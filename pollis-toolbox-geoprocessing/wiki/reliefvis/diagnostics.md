# Relief Visualisation — Diagnostics

## Cell Size, Square Cells and the Coordinate System

The radii of the Relief Visualisation panel are given in metres and become whole cells: a trend radius of 20 m is 20 cells on a grid of 1 m and 40 cells on a grid of 0.5 m. The conversion assumes square cells in a projected coordinate system whose unit is the metre, such as British National Grid or a UTM zone. On a grid in degrees of latitude and longitude, a cell is neither square nor measured in metres, and slope, openness and the radii all come out wrong. Grid and Cell Size prints the coordinate system, the number of cells, the size of a cell and the extent, so that the grid can be checked before the result is read. A terrain model in degrees should first be reprojected to a metric grid.

## Missing Cells and the Edge of the Grid

A terrain model may lack cells: water bodies where the laser returned nothing, the gaps between survey flights, or areas cut out. The window of the local relief model and the search of the horizon need the cells around each cell, so near a gap or the edge of the grid they see only part of the neighbourhood. The Relief Visualisation panel leaves out the cells within one trend radius or one search radius of the edge, and Missing and Edge Cells counts the cells missing in the file and those left out. A terrain model a few hundred metres larger than the area of interest keeps the result whole where it matters.

## Spikes, Pits and Objects Left in the Terrain Model

The filtering that builds a bare-earth terrain model can leave cells too high, where part of a building, a vehicle or dense vegetation was taken for ground, or too low, where a pulse returned from below the surface. Every visualisation turns such a cell into a small, sharp feature, which can look like a post or a pit. Spikes and Pits lists the cells that differ from the median of their eight neighbours by more than half a metre, largest first, with their coordinates, so that they can be checked in the Zoom on a Place step before any is read as a feature. Isolated spikes are usually errors; a ring or a line of them follows a real form.

## Seams, Stripes and Triangles Made by Processing

Terrain models built from several surveys can show straight steps where flights or tiles meet, and stripes along the lines of a flight where the strips were not well matched in height. Interpolating the ground beneath buildings or dense woodland, where few pulses reached it, leaves flat facets and triangles of a triangulated surface. All of these have straight edges and follow the grid, the tiles or the direction of flight rather than the land, which is the usual way to tell them from earthworks ([Kokalj and Hesse (2017)](#ref-KH2017a)). Visualisations that enhance small forms, the local relief model and the layered image above all, show them clearly.

## Features That Are Not Archaeological

The visualisations bring out every small form of the ground, whatever its age. Drainage ditches, field drains, tracks, quarries, hedge banks, tree throws, the edges of modern fields and the foundations of demolished buildings all stand out with the same contrast as earthworks. Their shapes and their relation to present-day maps often betray them: a ditch that follows a modern field edge is likely to be recent. A feature seen in a visualisation is a place to check against historic maps, aerial photographs, the records of known sites and the ground, never a site in itself ([Kokalj and Hesse (2017)](#ref-KH2017a)).

## Checking Features Against Known Sites in England

In England, the National Heritage List for England records scheduled monuments, listed buildings and other protected sites, each with its list entry number, name and boundary ([Historic England (2026)](#ref-HE2026a)). Scheduled Monuments in the Area queries its open web service for the scheduled monuments within the terrain model and prints their list entry numbers, names and areas, so that a feature can be set beside the sites already protected. Scheduling covers only a selection of nationally important sites; most known sites are held in local Historic Environment Records, which are not part of the list.

## References

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Local Relief Model](local-relief.md)
