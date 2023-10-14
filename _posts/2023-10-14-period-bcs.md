---
layout: post
title: periodic bcs with pbf
description: >
  Implementation of periodic boundary conditions within a Position Based Fluids simulator.
  
  **Source code available [here](https://github.com/axoloto/RealTimeParticles).**
sitemap: false
hide_last_modified: false
category : rtp
image: /assets/img/blog/periodic/periodic-bg.png
accent_image: 
  background: url('/assets/img/blog/periodic/periodic-bg.png') center/cover
  overlay: false
accent_color: '#ccc'
theme_color: '#ccc'
---

# Periodic Boundary Conditions for Position Based Dynamics

1. this list will be replaced by the table of contents
{:toc}

## Introduction

The idea for this technical blog post came from a rampant bug that necessitated a series of fixes whose incremental complexity kept my mind occupied for weeks. At the end of this fun adventure, I decided it was worth sharing it with others and took some time to write it down.

So today, we will dive down the rabbit hole that are **boundary conditions**, a delicate but necessary step in any numerical simulation. More specifically, we will focus on periodic boundary conditions and **how to implement them in a position-based dynamics (PBD) framework** like the RealTimeParticles solver. PBD solvers are interesting because they compute both **predicted and corrected particle positions** at each time step. In this situation, **where should the boundary conditions be applied?**

Before jumping into it, I strongly recommend going through [Part 1](https://axoloto.github.io/rtp/2021-07-11-boids/) and [Part 2](https://axoloto.github.io/rtp/2021-10-12-fluids/) of RealTimeParticles series. This blog post brings a lot of technical details, many of which are explained in details in these previous parts.

## A bit of RealTimeParticles' history

### First implementation of the boundary conditions

Back in 2021, to initiate the work on [RealTimeParticles](https://github.com/axoloto/RealTimeParticles), I implemented the [boids model](https://en.wikipedia.org/wiki/Boids) with a [good friend of mine](https://github.com/Maitre-Pangolin). To obtain a variety of interesting flocking behavior, we ended up supporting two different types of boundary conditions (BC), wall and periodic:

Wall Boundary (2D Boids)  |  Periodic Boundary (2D Boids)
:-------------------------:|:-------------------------:|
![](/assets/img/blog/periodic/2D-wall-bc.gif)  |  ![](/assets/img/blog/periodic/2D-periodic-bc.gif)

Here are their implementations in two OpenCL kernels:
~~~c
/*
  Update position and apply periodic boundary conditions.
*/
__kernel void bd_updatePosAndApplyPeriodicBC(//Input
                                             const __global float4 *vel,     // 0
                                             //Param
                                             const          float  timeStep, // 1
                                             //Input/output
                                                   __global float4 *pos)     // 2
{
  const float4 newPos = pos[ID] + vel[ID] * timeStep;


  float4 clampedNewPos = clamp(newPos, (float4)(-ABS_WALL_X, -ABS_WALL_Y, -ABS_WALL_Z, 0.0f),
                                       (float4)( ABS_WALL_X,  ABS_WALL_Y,  ABS_WALL_Z, 0.0f));
 
  if (!isequal(clampedNewPos.x, newPos.x))
  {
    clampedNewPos.x *= -1.0f;
  }
  if (!isequal(clampedNewPos.y, newPos.y))
  {
    clampedNewPos.y *= -1.0f;
  }
  if (!isequal(clampedNewPos.z, newPos.z))
  {
    clampedNewPos.z *= -1.0f;
  }


  pos[ID] = clampedNewPos;
}
~~~
OpenCL implementation of a periodic boundary condition
{:.figcaption}

~~~c
/*
  Update position and apply wall boundary conditions on position and velocity.
*/
__kernel void bd_updatePosAndApplyWallBC(//Input/output
                                         __global float4 *vel,     // 0
                                         //Param
                                         const    float  timeStep, // 1
                                         //Input/output
                                         __global float4 *pos)     // 2


{
  const float4 newPos = pos[ID] + vel[ID] * timeStep;


  const float4 clampedNewPos = clamp(newPos, (float4)(-ABS_WALL_X, -ABS_WALL_Y, -ABS_WALL_Z, 0.0f),
                                             (float4)( ABS_WALL_X,  ABS_WALL_Y,  ABS_WALL_Z, 0.0f));
 
  pos[ID] = clampedNewPos;


  // Bouncing particle will have its velocity reversed and divided by half
  if (!all(isequal(clampedNewPos.xyz, newPos.xyz)))
  {
    vel[ID] *= -0.5f;
  }
}
~~~
OpenCL implementation of a wall boundary condition
{:.figcaption}

As you can see, their implementation is relatively simple and straightforward. The **particle domain is a cube whose center is also the center of our coordinate system**, it simplifies things. Notice how the wall implementation is not a no-slip BC, we simply **reverse and divide by half the particle velocities** hitting the walls. For the periodic one, we **clamp the position coordinates** to the domain boundaries, compare it to the original value, and reset it to the opposite boundaries if the comparison returns false. Two years later, I clearly see the imperfection of those conditions (we will discuss ways to improve it soon), but despite its flaws it worked really well with the boids.

### Wall BC for Position Based Fluids

Compared to the boids model, implementing boundary conditions in the Position Based Fluids (PBF) framework was more complex. For each time step, each particle has both predicted and corrected positions, the latter one being iteratively updated several times. **On which position buffer do you apply the boundary conditions? One of them, both of them?** The original [Position Based Fluids paper](https://mmacklin.com/pbf_sig_preprint.pdf) suggests implementing the BC in the Jacobian loop correcting the position ("*perform collision detection and response*"). I followed their guidelines, and after some trials and errors my version worked more or less with wall BCs hacking some adjustments I am definitely not proud of.

~~~c
/*
  Apply Bouncing wall boundary conditions on corrected position
*/
__kernel void fld_applyBoundaryCondition(__global float4 *correctedPos)
{
  correctedPos[ID] = clamp(correctedPos[ID], (float4)(-ABS_WALL_X + 0.01f, -ABS_WALL_Y + 0.01f, -ABS_WALL_Z + 0.01f, 0.0f)
                                 , (float4)(ABS_WALL_X - 0.1f, ABS_WALL_Y - 0.1f, ABS_WALL_Z - 0.1f, 0.0f)); //WIP, 0.1 and 0.01 are heuristic values to deal with boundary conditions
}
~~~
Hacked wall BCs for fluids - nothing can be better than random arbitrary numbers in the middle of your code…
{:.figcaption}


Now that I’m seeing this, I wonder why I did not set the velocity normal component to zero in order to have a no-slip BC… Anyway, at that time, as I was playing with fluids, I was not interested in periodic BCs so I only implemented the wall BC and it worked relatively well despite its flaws.

### What about periodic BC with Position Based Dynamics?

Suppose that despite a very typical modern life with its endless distractions, I managed to dedicate enough time to work on a new Position Based solver (new article on the subject soon). Also, assume that this solver needs periodic conditions. How should I implement it? Of course, at first I genuinely thought about simply adding the existing periodic BC to my new PBD solver, in a similar way as the current wall BC in PBF. Did it work? Not really…

<p>&nbsp;</p>
![brokenPeriodicPBF](/assets/img/blog/periodic/broken-periodic-pbf.gif){: loading="lazy"}
Broken periodic boundaries on vertical walls (2D PBF)
{:.figcaption}
<p>&nbsp;</p>

Well, it’s time to take a step back and think a bit deeper...


# Revisiting our periodic BC kernel

If we go back to the perodic BC OpenCL kernel presented above, one obvious flaw is the use of the OpenCL-specific function `isEqual()`. It looks fancy and can be vectorized, but behind the scene this is just **a basic equality operator `==`** according to the [OpenCL documentation](https://man.opencl.org/isequal.html).

~~~c
if (!isequal(clampedNewPos.x, newPos.x))
{
  clampedNewPos.x *= -1.0f;
}
~~~
Initial broken comparison in periodic BC
{:.figcaption}

Float comparison is a [complex topic](https://floating-point-gui.de/errors/comparison/), but to make it short: **using the equality operator with floats is never a good idea** because it will probably return wrong results due to their inherent limited precision and rounding. Doing this check about 60 times per second probably saves me here, in most cases one check will be right. An easy fix is to **use the comparison operator `>`** to compare the absolute coordinates to the domain boundaries. We could also improve this comparison by adding some tolerance and check the absolute margin between the particle and the boundary, or even push further and focus on the relative one but I think this is sufficient for now.

~~~c
if (fabs(newPos.x) > ABS_WALL_X)
~~~
New check, switching from the `==` operator to the `>` one
{:.figcaption}

Another thing annoying me is the fact that even if we correctly detect a particle that must be transferred to the opposite boundary, we don’t take into account the actual distance the particle made through the initial wall to its new position before applying the BC.

~~~c
pos[ID] = clampedNewPos;
~~~
Initial implementation, we reset the position to the opposite boundary
{:.figcaption}

That’s a bit clumsy, fortunately we can solve this pretty easily by simply keeping the distance traveled through the boundary.

~~~c
pos[ID].x = newPos.x - 2 * clampedNewPos.x; // delta.x = newPos.x - clampedNewPos.x directly incorporated here
~~~
We are now taking into account the distance traveled through the boundary
{:.figcaption}

<p>&nbsp;</p>
![periodicBCKeepingDelta](/assets/img/blog/periodic/periodic-bc-deltax.png){: loading="lazy"}
Red particle crosses periodic boundary while preserving its motion
{:.figcaption}
<p>&nbsp;</p>

Here is the final boundary conditions kernel where we apply **a mix of periodic and wall BCs**. Note the absence of no-slip condition for the wall, this is not necessary in this given position based framework, as velocity is computed right after as the difference between predicted and corrected position.

~~~c
/*
  Apply periodic boundary conditions for xz directions
  Apply wall boundary conditions for y direction
*/
__kernel void cld_applyMixedBoundaryConditions(//Input/output
                                               __global float4 *predPos) // 0
{
  const float4 newPos = predPos[ID];


  const float4 clampedNewPos = clamp(newPos, (float4)(-ABS_WALL_X, -ABS_WALL_Y, -ABS_WALL_Z, 0.0f),
                                             (float4)( ABS_WALL_X,  ABS_WALL_Y,  ABS_WALL_Z, 0.0f));
 
  if (fabs(newPos.x) > ABS_WALL_X)
  {
    predPos[ID].x = newPos.x - 2 * clampedNewPos.x; // periodic BC, keeping delta.x
  }
  if (fabs(newPos.y) > ABS_WALL_Y)
  {
    predPos[ID].y = clampedNewPos.y; // wall BC
  }  
  if (fabs(newPos.z) > ABS_WALL_Z)
  {
    predPos[ID].z = newPos.z - 2 * clampedNewPos.z; // periodic BC, keeping delta.z
  }
}
~~~
Final mixed BCs with vertical periodic boundaries preserving particles motions{:.figcaption}

Does it solve my initial problem? Not at all, let’s jump to the next fix.

# Applying the BCs at the right time in the simulation loop

The PBF article greatly describes the position-based algorithm and its main Jacobian correction loop but it **doesn’t say much about how to add to the mix BCs** or even a much needed spatial partitioning framework to obtain decent performance. This is understandable because its purpose is to describe a new way of simulating fluids, not to discuss any secondary algorithm implementation. However due to their absence, **we can easily forget about the relation between spatial partitioning and BCs**. Basic spatial partitioning is about splitting the particle domain in cells, identifying which cell contains which particle and regrouping neighboring particles based on the cell they belong to (see [Part 1](https://axoloto.github.io/rtp/2021-07-11-boids/)). With periodic boundaries, **one particle might well end up in a different cell with completely different neighbors if it goes through a boundary**. So we really **need to apply the BCs before doing any spatial partitioning**. Otherwise the nearest neighbors search (NNS) based on top of it might be incorrect close to the boundaries.

In a simplified pseudo code, a perfect implementation for a given time step would then be:

~~~c
PredictPosition();

// Jacobian loop, correcting positions to fit constraints
for (int iter = 0; iter < m_nbJacobiIters; ++iter)
{
  ApplyBCs();
  CreateSpatialPartitioning();
  ComputeCorrectionUsingNeighbors();
  CorrectPosition();
}

UpdateVelocity();
~~~
Ideal PBF implementation with spatial partitioning done once per position correction
{:.figcaption}

In my PBF implementation, as the spatial partitioning and the related buffer sorting were relatively costly, **I took the decision to move them out of the Jacobian loop**. This is a risky performance tradeoff over correctness. Partitioning being done only once a frame, **we assume that during the correction the particles remain in the same cell**. It only works if the particle velocity isn’t too high.

So the real implementation looks something like this:
~~~c
PredictPosition();
CreateSpatialPartioning(); // Costly operation out of the loop

// Jacobian loop, correcting positions to fit constraints
for (int iter = 0; iter < m_nbJacobiIters; ++iter)
{
  ApplyBCs();
  ComputeCorrectionUsingNeighbors();
  CorrectPosition();
}

UpdateVelocity();
~~~
Current broken PBF implementation with spatial partioning done once per frame
{:.figcaption}

Well, **this is clearly broken**. Focusing on performance, I blindly accepted the tradeoff regarding potential particles changing cells during the position correction, but **I totally forgot about BCs**. Remember, I said previously that BCs should always be applied before spatial partitioning. We simply don’t do it here, not even for the prediction step which is probably the most important one because this is where the positions change the most.

For the fluid simulations where I only use wall BCs, the positions being clamped, the approximation still looks visually acceptable and I didn’t notice the clear flaw. But when I start using periodic BCs, this is another story. Indeed, with periodic boundaries, **one particle can move the size of the domain, hard to have a meaningful partitioning if it doesn’t take this type of displacement into account**.

So the fixed implementation looks like this:
~~~c
PredictPosition();
ApplyBCs();
CreateSpatialPartioning(); // Costly operation out of the loop

// Jacobian loop, correcting positions to fit constraints
for (int iter = 0; iter < m_nbJacobiIters; ++iter)
{
  ComputeCorrectionUsingNeighbors();
  CorrectPosition();
  ApplyBCs();
}

UpdateVelocity();
~~~
Fixed PBF implementation with spatial partioning done once and correct BCs handling
{:.figcaption}

Is it better? Way better. Does it fix my issue? Nope, so better keep going!

# Computing velocity with the relative sum of position corrections

At that point, periodic BCs still don’t work in general but **a global constant speed enforced on all the particles gives the right result using them**. It gives me two hints, first I’m not too far from the truth, second the problem lies in the correction loop itself. Indeed, the particle velocity is based on the difference between the final corrected position and the position at the previous time step, if the velocity is wrong it must come from there.

~~~c
/*
  Update velocity buffer
*/
__kernel void fld_updateVel(//Input
                            const __global float4 *newPos,    // 0
                            const __global float4 *prevPos,   // 1
                            //Param
                            const     FluidParams fluid,      // 2
                            //Output
                                  __global float4 *vel)       // 3
{
  // Clamping velocity and preventing division by 0
  vel[ID] = clamp((newPos[ID] - prevPos[ID]) / (fluid.timeStep + FLOAT_EPS), -MAX_VEL, MAX_VEL);
}
~~~
OpenCL kernel updating the particle velocity
{:.figcaption}

Doing a schema of the situation makes me realize the issue. **If a particle goes through a periodic boundary, its new position differs greatly from the previous one due to the particle jumping to the opposite boundary**. Therefore the computed **velocity is suddenly huge** for that time step. It explains the exponential increase of velocity for some particles in the initial buggy behavior.

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/periodic-bc-abs.png){: loading="lazy"}
Absolute displacement of a particle during a time frame
{:.figcaption}
<p>&nbsp;</p>

$$
\begin{aligned}
\mathbf{v} = \frac{\Delta \mathbf{x}}{\Delta T} = \frac{ \mathbf{x}_{T+1} - \mathbf{x}_T }{ (T+1) - T} \\
\end{aligned}
$$
Incorrect velocity based on absolute particle displacement, omitting boundary crossing
{:.figcaption}

One way to fix it is to consider **the sum of corrections applied on the initial position**, not the absolute distance between this initial position and the final corrected one. Indeed, this **absolute distance can contain some jumps between periodic boundaries**, in other words wrong distances not traveled by the particles. We can obtain the real distance traveled by the particle by **creating a new buffer `totalCorrection` which will contain all the increment adjustments made on the initial position**, i.e the initial prediction and all the following corrections. The velocity is then computed using this new buffer.

<p>&nbsp;</p>
![relDisplacement](/assets/img/blog/periodic/periodic-bc-rel.png){: loading="lazy"}
Sum of relative corrections
{:.figcaption}
<p>&nbsp;</p>

$$
\begin{aligned}
\mathbf{v} = \frac{\Delta \mathbf{x}_{pred} + \sum \Delta \mathbf{x}_{corr \space i}}{\Delta T} = \frac{ \Delta \mathbf{x}_{pred} + \Delta \mathbf{x}_{corr \space 0} + \Delta \mathbf{x}_{corr \space 1} }{ (T+1) - T} \\
\end{aligned}
$$
Correct velocity based on the sum of relative corrections, taking into account boundary crossing
{:.figcaption}

~~~c
/*
  Predict fluid particle position and update velocity by integrating external forces
*/
__kernel void cld_predictPosition(//Input
                                  const __global float4 *pos,        // 0
                                  const __global float4 *vel,        // 1
                                  const __global float  *buoyancy,   // 2
                                  //Param
                                  const     CloudParams cloud,       // 3
                                  //Output
                                        __global float4 *predPos,     // 4
                                        __global float4 *totCorrPos)    // 5
{
  // No need to update global vel, as it will be reset later on
  const float4 predVel = vel[ID] + (float4)(0.0f, buoyancy[ID], 0.0f, 0.0f) * cloud.timeStep;
  // Init totCorrPos with prediction dist
  totCorrPos[ID] = predVel * cloud.timeStep;


  predPos[ID] = pos[ID] + predVel * cloud.timeStep;
}


/*
  Sum correction positions
*/
__kernel void fld_updateTotCorrPosition(//Input
                                  const __global float4 *corrPos, // 0
                                  //Output
                                        __global float4 *totCorrPos) // 1
{
  totCorrPos[ID] += corrPos[ID];
}


/*
  Update velocity buffer
*/
__kernel void fld_updateVel(//Input
                            const __global float4 *totCorrPos, // 0
                            //Param
                            const     FluidParams fluid,       // 1
                            //Output
                                  __global float4 *vel)        // 2
{
  // Clamping velocity and preventing division by 0
  vel[ID] = clamp((totCorrPos[ID]) / (fluid.timeStep + FLOAT_EPS), -MAX_VEL, MAX_VEL);
}
~~~
OpenCL kernels to compute `totalCorrection` buffer and use it to calculate velocity
{:.figcaption}

Finally, the visual result is much butter! There are no more flashing particles, the periodic BCs don't act anymore as time warp portals with the particles. However **they still have some visible effect on the particles, a perfect periodic BC shouldn’t affect the particles traversing it**. No time to rest, the investigation is not over!

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/straining-2D.gif){: loading="lazy"}
Straining effect, note the left particles struggling to enter back the domain
{:.figcaption}
<p>&nbsp;</p>

# Taking into account periodic BC in our Nearest Neighbor Search algorithm

We can see **a clear loss of cohesion in the stock of particles** crossing the periodic boundary, as if the BC was acting as a strainer. The particles seem reluctant to cross the boundary. Why? They usually don't go somewhere if it means reducing their density, i.e losing some peer connection with neighbors. But when crossing this periodic boundary, they shouldn’t lose any, as their neighbors are still right behind, close to them and ready to follow. Oh, it finally hits me. The **Nearest Neighbor Search (NNS) algorithm is not considering periodic neighbor cells**: the neighbor particles on the other side of a periodic boundary are omitted in all computation. In other words, currently for a particle, crossing the boundary means losing all its previous neighbors at once, impacting the efforts applied on it and therefore its motion.

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/grid-particle.png){: loading="lazy"}
NNS correctly taking into account periodic neighbor cells
{:.figcaption}
<p>&nbsp;</p>

This is a serious flaw in my NNS algorithm implementation. I should have seen it faster but I probably pushed back the problem to the back of my mind because it seemed difficult to implement. Literature talks about ghost particles with fake density or even duplicating boundary neighbor particles, but I really didn’t like that. It means potential dynamic buffers and bigger memory consumption. I think I have a better idea that should fit my basic case. With my simple box domain, **I know the resolution of the grid and I know the index of my current cell, using this information I can surely compute the index of its direct periodic neighboring cells if any**. Retrieving correctly the periodic neighbor cells should solve my NNS problem.

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/grid-index.png){: loading="lazy"}
Spatial partitioning and cell indices in 2D, computing periodic neighbor indices using particle cell index is straightforward{:.figcaption}
<p>&nbsp;</p>

After experimenting on paper, I end up with this formula:

~~~c
// Initial formula to obtain a neighbor cell index in 3D
// cellNIndex3D = convert_int3(currCellIndex3D) + (int3)(iX, iY, iZ);

// New formula taking into account periodic neighbor cells
cellNIndex3D = (convert_int3(currCellIndex3D) + (int3)(iX, iY, iZ) + gridResXYZ) % gridResXYZ;
~~~
Corrected 3D cell index formula retrieving periodic neighbor cell indices
{:.figcaption}

It looks nice on the paper but unfortunately it doesn’t fix anything and this absence of improvement drives me nuts. It's 2AM when I end up implementing it and I truly thought it would solve my problem. But then it hits me again! **This is the right fix but I need to go another layer down, indeed the SPH kernels (Part 1) have no effect past their limited radius**. As we consider the absolute distance between a selected particle and its periodic neighbors, this distance is always bigger than the SPH effect radius and therefore the periodic neighbors contribution is null. 

In other words, we are correctly retrieving all the neighbor particles (periodic or not) thanks to the initial fix, but **all periodic ones don’t have any effect on the selected particle for now**. Let’s adjust it so the periodic neighbors have a real contribution during the NNS:

~~~c
// 27 cells to visit, current one + 3D neighbors
for (int iX = -1; iX <= 1; ++iX)
{
 for (int iY = -1; iY <= 1; ++iY)
 {
   for (int iZ = -1; iZ <= 1; ++iZ)
   {
     signAbsWall = (float4)(0.0f);

     // Computing 3D index of the current neighbor cell
     cellNIndex3D = (cellIndex3D + (int3)(iX, iY, iZ) + gridResXYZ) % gridResXYZ;

     // Periodic BC for x, periodic neighbors must be considered
     if((cellIndex3D.x + iX) >= GRID_RES_X) signAbsWall.x = 2.0f;
     else if((cellIndex3D.x + iX) < 0) signAbsWall.x = -2.0f;

     // Wall BC for y, out of domain cells are discarded
     if(((cellIndex3D.y + iY) >= GRID_RES_Y) || ((cellIndex3D.y + iY) < 0)) continue;
    
     // Periodic BC for z, periodic neighbors must be considered
     if((cellIndex3D.z + iZ) >= GRID_RES_Z) signAbsWall.z = 2.0f;
     else if((cellIndex3D.z + iZ) < 0) signAbsWall.z = -2.0f;

     // Computing 1D index of the current neighbor cell
     cellNIndex1D = (cellNIndex3D.x * GRID_RES_Y + cellNIndex3D.y) * GRID_RES_Z + cellNIndex3D.z;

     // Retrieving indices of all the particles in this cell
     startEndN = startEndCell[cellNIndex1D];

     for (uint e = startEndN.x; e <= startEndN.y; ++e)
     {
       fluidDensity += poly6(pos - predPos[e] - absWallXYZ * signAbsWall, EFFECT_RADIUS); // poly6 is the SPH kernel used to compute density
     }
   }
 }
}
~~~
Adjusted SPH kernel with correct NNS
{:.figcaption}

The periodic BC is hardcoded in the NNS algorithm for X and Z direction, this is not perfect but I don’t plan to support another type of BC for now with this model so this is acceptable. Notice how we adjust the distance between particles sent to the SPH kernel so the periodic neighbors contribute to the particle density.

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/periodic-final-2D.gif){: loading="lazy"}
Periodic boundary fully functioning in 2D
{:.figcaption}
<p>&nbsp;</p>

Does it work? Yes! The particles are finally passing through the periodic boundaries without any visible change in behavior.

# Conclusion

What a journey. It was a long one but we made it. If you are still here, **thanks a lot for keeping up with me up to this point**. I hope that it will be helpful at least for the few tormented souls also seeking to implement similar periodic boundary conditions within a Position Based Dynamics framework.

To summarize, during this blog post, I went through a series of gradually complex fixes and adjustments in order **to enable periodic boundary conditions in my Position Based Dynamics framework**. The challenge came partly from the spatial partitioning implemented to speed up our Nearest Neighbor Search (NNS) algorithm.

Implementing this boundary condition properly was challenging, but it was a necessary initial step towards the integration of my future solver. This one will be the main subject of my next post, stay tuned!

<p>&nbsp;</p>
![absDisplacement](/assets/img/blog/periodic/periodic-final-3D.gif){: loading="lazy"}
Periodic boundary 3D with a new PBD model in preparation
{:.figcaption}
<p>&nbsp;</p>