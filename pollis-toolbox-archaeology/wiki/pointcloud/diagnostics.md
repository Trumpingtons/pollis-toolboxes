# Terrain Model from Point Cloud — Diagnostics

## Many Cells Without Ground

Ground, Step 2, prints the share of cells with ground. A low share has three common causes. The canopy may be dense, so that few pulses reached the soil, as in tropical forest. The Cell Size may be small for the density of the ground points, so that many cells fall between them. Or the survey's ground class may be sparse, or a filter strict, so that few points are kept as ground. The map Ground Points a Square Metre, in Zoom and Pan of Check the Terrain Model, shows where the cells without ground lie. A larger Cell Size, or Zhang's Filter or Pingel's Filter in place of the Survey's Ground, raises the share; a larger Distance in Fill the Gaps fills more of what is left.

## Vegetation Left as Mounds or Bumps

Small round bumps scattered over the shaded relief, often in patches, are the lowest points of shrubs or of dense low vegetation taken for ground. They are common in the Survey's Ground under thick undergrowth, where no pulse reached the soil and the lowest return is a branch. With Zhang's Filter or Pingel's Filter, a smaller Slope or Initial Height removes more of them. The imagery beside the maps in Zoom and Pan shows whether a patch of bumps lies under trees or shrubs. Bumps that follow no plan and stop at the edge of a wood are rarely archaeological; mounds of regular size and spacing call for a closer look.

## Platforms, Mounds or Banks Flattened

A platform, mound or bank that appears on the imagery or in the Survey's Ground and is missing from the result of a filter has been taken for an object. A Window narrower than the form keeps it as ground; a larger Slope keeps its steep sides. The two filters of Terrain Model from Point Cloud can be compared on the same area by running Ground with each in turn, and the Survey's Ground with them. Wide artificial plateaus, causeways and terraces stand above their surroundings as buildings do, and a filter set to remove the largest buildings of an area can remove them too.

## Rough or Cracked Patches in the Shaded Relief

Rough, cracked or faceted patches in the shaded relief lie where many cells were filled among scattered measured cells. Each filled cell takes its height from its nearest cells with ground, and where these alternate with gaps the surface joins heights from points of different heights. The map Filled Cells, in Zoom and Pan, shows these patches. A larger Cell Size puts more ground points into each cell, and fewer cells need filling. Forms seen in such patches rest on a few measured heights, and the same place in another survey, or seen on the ground, confirms them.

## Straight Lines, Steps and Strips in the Terrain Model

Straight lines, steps or strips of different texture across the terrain model often follow the swaths of the survey's flights, where the density of points changes, or the edges of tiles classified separately by the provider. Where two tiles meet, a step in height shows a difference in their ground classification or in their processing. The ground points a square metre in Check the Terrain Model show strips of different density as bands. Running Zhang's Filter or Pingel's Filter on the whole area, in place of the Survey's Ground, classifies every tile alike.

## Point Clouds That Cannot Be Read

Point Cloud, Step 1, stops with a message in three cases. When PDAL cannot read a source, the message gives PDAL's own report, which names the file and the reason, such as a file that is not there, an address that does not answer or a file that is not LAS or LAZ ([Butler, Chambers, Hartzell and Glennie (2021)](#ref-BCHG2021a)). When the point cloud has no coordinate system, or one that is not projected, the cells and distances in metres cannot be set; the survey's documentation gives its system. When a tile index gives no tile, the Area does not cross it, or is in other coordinates than the index.

## A Terrain Model Already Saved

Save the Terrain Model does not overwrite a file. When `<name>-dtm.tif` is already in the Folder, the action says so, and the file is kept. Renaming or moving it, or giving another Name in Point Cloud, lets the new terrain model be saved. The LAZ file of the points, `<name>.laz`, is likewise kept once written, so that a new Area or Resolution needs another Name, or the file deleted, for the points to be read again.

## References

<a id="ref-BCHG2021a"></a>Butler, H., Chambers, B., Hartzell, P. and Glennie, C. (2021). PDAL: an open source library for the processing and analysis of point clouds. *Computers & Geosciences* 148, 104680. [doi:10.1016/j.cageo.2020.104680](https://doi.org/10.1016/j.cageo.2020.104680)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Ground Filters](ground-filters.md) · [Filling the Gaps](gap-filling.md) · [Decision Guide](decision-guide.md)
