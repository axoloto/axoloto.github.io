<mxfile host="app.diagrams.net" modified="2021-07-12T16:20:25.259Z" agent="5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" etag="Y_xFMmCO381Y9nOR4kJd" version="14.8.5" type="github">
  <diagram id="5nwrhSC2a5XxL6fgXqDe" name="Page-1">
    <mxGraphModel dx="981" dy="526" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="850" pageHeight="1100" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="oexrsUWFK_sh6rO82MGl-1" value="(1) Application" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#dae8fc;strokeColor=#6c8ebf;" parent="1" vertex="1">
          <mxGeometry x="380" y="200" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-2" value="(2) Renderer" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#f8cecc;strokeColor=#b85450;" parent="1" vertex="1">
          <mxGeometry x="280" y="320" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-3" value="(3) Physics Engine" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#d5e8d4;strokeColor=#82b366;" parent="1" vertex="1">
          <mxGeometry x="480" y="320" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-4" value="" style="endArrow=classic;startArrow=classic;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" parent="1" target="oexrsUWFK_sh6rO82MGl-3" edge="1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="360" y="360" as="sourcePoint" />
            <mxPoint x="460" y="300" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-5" value="" style="endArrow=classic;startArrow=classic;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;entryX=0;entryY=1;entryDx=0;entryDy=0;" parent="1" source="oexrsUWFK_sh6rO82MGl-2" target="oexrsUWFK_sh6rO82MGl-1" edge="1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="340" y="320" as="sourcePoint" />
            <mxPoint x="390" y="270" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-6" value="" style="endArrow=classic;startArrow=classic;html=1;entryX=1;entryY=1;entryDx=0;entryDy=0;exitX=0;exitY=0;exitDx=0;exitDy=0;" parent="1" source="oexrsUWFK_sh6rO82MGl-3" target="oexrsUWFK_sh6rO82MGl-1" edge="1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="410" y="350" as="sourcePoint" />
            <mxPoint x="460" y="300" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-8" value="&lt;ul&gt;&lt;li&gt;Main IO and UI manager for (2) and (3)&lt;/li&gt;&lt;li&gt;Call (2) and (3) for updates&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" parent="1" vertex="1">
          <mxGeometry x="440" y="220" width="260" height="40" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-11" value="&lt;ul&gt;&lt;li&gt;Compute particle coords using boids model&lt;/li&gt;&lt;li&gt;Send coords to (2) and receive inputs from (1)&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" parent="1" vertex="1">
          <mxGeometry x="540" y="340" width="190" height="40" as="geometry" />
        </mxCell>
        <mxCell id="oexrsUWFK_sh6rO82MGl-12" value="&lt;ul&gt;&lt;li&gt;Draw 3D world and particles&lt;/li&gt;&lt;li&gt;Receive coords from (3) and inputs from (1)&lt;/li&gt;&lt;/ul&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" parent="1" vertex="1">
          <mxGeometry x="80" y="340" width="200" height="40" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-1" value="Application" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
          <mxGeometry x="380" y="480" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-113" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;endArrow=classic;endFill=1;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-3" target="iJ4ovqydmkVFNqbaDCKs-110">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-3" value="Physics Engine" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;verticalAlign=top;" vertex="1" parent="1">
          <mxGeometry x="230" y="600" width="380" height="340" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-6" value="" style="endArrow=classic;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-1" target="iJ4ovqydmkVFNqbaDCKs-3">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="400" y="520" as="sourcePoint" />
            <mxPoint x="420" y="590" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-7" value="&lt;div&gt;Call for an update at &lt;i&gt;&lt;b&gt;t&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="425" y="560" width="190" height="40" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-108" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;endArrow=classic;endFill=1;dashed=1;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-8" target="iJ4ovqydmkVFNqbaDCKs-68">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-8" value="Boids model (3 rules + target)" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;" vertex="1" parent="1">
          <mxGeometry x="240" y="630" width="360" height="120" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-22" value="" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;editable=0;" vertex="1" parent="1">
          <mxGeometry x="250" y="660" width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-23" value="" style="shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;fillColor=none;top=0;left=0;bottom=0;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-22">
          <mxGeometry width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-24" value="x&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-25" value="y&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="17" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-26" value="z&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="32" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-27" value="x&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="50" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-28" value="y&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="66" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-29" value="z&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="84" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-30" value="x&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="100" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-31" value="y&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="118" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-32" value="z&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-23">
          <mxGeometry x="133" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-33" value="" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;" vertex="1" parent="1">
          <mxGeometry x="440" y="660" width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-34" value="" style="shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;fillColor=none;top=0;left=0;bottom=0;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-33">
          <mxGeometry width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-35" value="v&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-36" value="u&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="16" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-37" value="w&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="33" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-38" value="u&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="49" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-39" value="v&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="65" width="20" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-40" value="w&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="85" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-41" value="u&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="101" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-42" value="v&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="117" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-43" value="w&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-34">
          <mxGeometry x="134" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-47" value="coords&lt;b style=&quot;font-style: italic&quot;&gt; t-1&lt;/b&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="287.5" y="680" width="75" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-48" value="velocity&lt;b style=&quot;font-style: italic&quot;&gt; t-1&lt;/b&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="477.5" y="680" width="75" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-50" value="" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;editable=0;" vertex="1" parent="1">
          <mxGeometry x="345" y="710" width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-51" value="" style="shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;fillColor=none;top=0;left=0;bottom=0;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-50">
          <mxGeometry width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-52" value="a&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-53" value="b&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="17" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-54" value="c&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="32" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-55" value="a&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="50" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-56" value="b&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="66" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-57" value="c&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="84" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-58" value="a&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="100" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-59" value="b&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="118" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-60" value="c&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry x="133" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-62" value="" style="edgeStyle=segmentEdgeStyle;endArrow=classic;html=1;dashed=1;dashPattern=1 1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.498;entryY=0.025;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-34" target="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="580" y="750" as="sourcePoint" />
            <mxPoint x="425" y="708" as="targetPoint" />
            <Array as="points">
              <mxPoint x="420" y="670" />
              <mxPoint x="420" y="711" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-64" value="" style="edgeStyle=segmentEdgeStyle;endArrow=none;html=1;dashed=1;dashPattern=1 1;endFill=0;entryX=0.499;entryY=-0.126;entryDx=0;entryDy=0;entryPerimeter=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-23" target="iJ4ovqydmkVFNqbaDCKs-51">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="440" y="740" as="sourcePoint" />
            <mxPoint x="490" y="690" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-65" value="acceleration&lt;b style=&quot;font-style: italic&quot;&gt; t&lt;/b&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="375" y="730" width="90" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-109" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;endArrow=classic;endFill=1;dashed=1;" edge="1" parent="1" source="iJ4ovqydmkVFNqbaDCKs-68" target="iJ4ovqydmkVFNqbaDCKs-69">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-68" value="Integration and clamping" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;" vertex="1" parent="1">
          <mxGeometry x="295" y="770" width="250" height="70" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-69" value="Integration and boundary conditions" style="rounded=1;whiteSpace=wrap;html=1;verticalAlign=top;" vertex="1" parent="1">
          <mxGeometry x="295" y="860" width="250" height="70" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-70" value="" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;" vertex="1" parent="1">
          <mxGeometry x="347.5" y="795" width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-71" value="" style="shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;fillColor=none;top=0;left=0;bottom=0;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-70">
          <mxGeometry width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-72" value="v&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-73" value="u&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="16" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-74" value="w&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="33" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-75" value="u&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="49" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-76" value="v&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="65" width="20" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-77" value="w&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="85" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-78" value="u&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="101" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-79" value="v&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="117" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-80" value="w&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-71">
          <mxGeometry x="134" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-81" value="velocity&lt;b style=&quot;font-style: italic&quot;&gt; t&lt;/b&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="385" y="815" width="75" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-94" value="" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;editable=0;" vertex="1" parent="1">
          <mxGeometry x="345" y="890" width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-95" value="" style="shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;fillColor=none;top=0;left=0;bottom=0;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-94">
          <mxGeometry width="150" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-96" value="x&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-97" value="y&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="17" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-98" value="z&lt;sub&gt;0&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#d5e8d4;top=0;left=0;bottom=0;right=0;strokeColor=#82b366;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="32" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-99" value="x&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="50" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-100" value="y&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="66" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-101" value="z&lt;sub&gt;1&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;strokeColor=#b85450;fillColor=#CCFF99;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="84" width="16" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-102" value="x&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="100" width="18" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-103" value="y&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="118" width="15" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-104" value="z&lt;sub&gt;2&lt;/sub&gt;" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;fillColor=#60a917;top=0;left=0;bottom=0;right=0;strokeColor=#2D7600;fontColor=#ffffff;" vertex="1" parent="iJ4ovqydmkVFNqbaDCKs-95">
          <mxGeometry x="133" width="17" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-105" value="coords&lt;b style=&quot;font-style: italic&quot;&gt; t&lt;/b&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="382.5" y="910" width="75" height="20" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-110" value="Renderer" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
          <mxGeometry x="380" y="980" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="iJ4ovqydmkVFNqbaDCKs-114" value="&lt;div&gt;Load coords buffer to GPU&lt;/div&gt;" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="425" y="940" width="190" height="40" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
