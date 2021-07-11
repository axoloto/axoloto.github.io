<mxfile host="app.diagrams.net" modified="2021-07-12T00:52:03.587Z" agent="5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" etag="yhM2yGaZXyHBQNGJUybz" version="14.8.5" type="github">
  <diagram id="5nwrhSC2a5XxL6fgXqDe" name="Page-1">
    <mxGraphModel dx="677" dy="363" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="850" pageHeight="1100" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="oexrsUWFK_sh6rO82MGl-1" value="(1) Application" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
          <mxGeometry x="380" y="200" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-2" value="(2) Renderer" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
          <mxGeometry x="280" y="320" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-3" value="(3) Physics Engine" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="480" y="320" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-4" value="" style="endArrow=classic;startArrow=classic;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" target="oexrsUWFK_sh6rO82MGl-3">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="360" y="360" as="sourcePoint" />
            <mxPoint x="460" y="300" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-5" value="" style="endArrow=classic;startArrow=classic;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;entryX=0;entryY=1;entryDx=0;entryDy=0;" edge="1" parent="1" source="oexrsUWFK_sh6rO82MGl-2" target="oexrsUWFK_sh6rO82MGl-1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="340" y="320" as="sourcePoint" />
            <mxPoint x="390" y="270" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-6" value="" style="endArrow=classic;startArrow=classic;html=1;entryX=1;entryY=1;entryDx=0;entryDy=0;exitX=0;exitY=0;exitDx=0;exitDy=0;" edge="1" parent="1" source="oexrsUWFK_sh6rO82MGl-3" target="oexrsUWFK_sh6rO82MGl-1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="410" y="350" as="sourcePoint" />
            <mxPoint x="460" y="300" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-8" value="&lt;ul&gt;&lt;li&gt;Main IO and UI manager for (2) and (3)&lt;/li&gt;&lt;li&gt;Call (2) and (3) for updates&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="440" y="220" width="260" height="40" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-11" value="&lt;ul&gt;&lt;li&gt;Compute particle coords using boids model&lt;/li&gt;&lt;li&gt;Send coords to (2) and receive inputs from (1)&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="540" y="340" width="190" height="40" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-12" value="&lt;ul&gt;&lt;li&gt;Draw 3D world and particles&lt;/li&gt;&lt;li&gt;Receive coords from (3) and inputs from (1)&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="80" y="340" width="200" height="40" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
