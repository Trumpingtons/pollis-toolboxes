# Elevation Models From Point Clouds

## Surface Model, Terrain Model and Height Above Ground

Three grids are commonly derived from an airborne lidar point cloud. A digital surface model (DSM) gives the height of the highest surface in each cell, roofs and treetops included. A digital terrain model (DTM) gives the height of the bare ground, as if buildings and vegetation were removed. Their difference, often called the normalised DSM, gives the height of the objects above the ground: the heights of buildings and, over vegetation, a canopy height model. Surface and Terrain Grids computes the three at the Cell Size input of the LAS and LAZ tab of the Point Cloud Files panel.

## Separating Ground Points From the Rest

A terrain model needs to know which points are on the ground. Filtering, or ground classification, separates the ground points of a cloud from those on buildings, vegetation and other objects. Sithole and Vosselman compared filter algorithms for this bare-Earth extraction from airborne laser scanning point clouds ([Sithole and Vosselman (2004)](#ref-SV2004a)). Kraus and Pfeifer determined terrain models in wooded areas from airborne laser scanner data, where many pulses never reach the ground ([Kraus and Pfeifer (1998)](#ref-KP1998a)). Survey providers usually deliver point clouds already classified, with the ground in class 2.

## How the Surface and Terrain Grids Action Computes the Grids

Surface and Terrain Grids divides the extent of the cloud into square cells of the Cell Size input and assigns every point to the cell it falls in. The surface model of a cell is the highest z of its points; the terrain model is the mean z of its ground points, those of class 2; the height above ground is their difference. A cell without points has no surface value, and a cell without ground points, such as one under a roof, has no terrain value. The action counts both kinds of empty cells, which show where interpolation would be needed.

## Choosing the Cell Size of an Elevation Model

The cell size of an elevation model should match the density of the points: each cell needs several points for its value to rest on more than one measurement. Point Density reports the points per square unit and the share of empty cells at the Cell Size input. At 4 points per square metre, a cell of 1 metre holds about four points. Ground points are fewer, especially under vegetation and buildings, so a terrain model often needs larger cells, or interpolation between the ground points. Doubling the side of a cell gives it four times the area, and so about four times as many points.

## Filling the Gaps of a Terrain Model

Cells without ground points are filled by interpolating between the ground points around them: by triangulation, by inverse distance weighting, or by kriging. The Kriging panel of the Smart Regions Toolbox interpolates a value measured at scattered points onto a grid, which applies to ground heights as well. The terrain model written by Save Elevation Grids as GeoTIFF keeps the cells without ground points as no data, so the gaps stay visible.

## Using the Grids in the GeoTIFF Tab

Save Elevation Grids as GeoTIFF writes three files next to the point cloud, ending in -dsm.tif, -dtm.tif and -ndsm.tif, in the coordinate system of the cloud. Each is a single-band GeoTIFF that the GeoTIFF tab of the Raster Files panel reads: Plot the Raster draws the heights above ground, Histogram of Values shows how tall the objects are, and Show on a Map places the buildings and trees on a base map ([Schouten (2026)](#ref-Sch2026a)).

## References

<a id="ref-KP1998a"></a>Kraus, K. and Pfeifer, N. (1998). Determination of terrain models in wooded areas with airborne laser scanner data. *ISPRS Journal of Photogrammetry and Remote Sensing*, 53(4), 193–203. [doi:10.1016/S0924-2716(98)00009-4](https://doi.org/10.1016/S0924-2716(98)00009-4)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-SV2004a"></a>Sithole, G. and Vosselman, G. (2004). Experimental comparison of filter algorithms for bare-Earth extraction from airborne laser scanning point clouds. *ISPRS Journal of Photogrammetry and Remote Sensing*, 59(1-2), 85–101. [doi:10.1016/j.isprsjprs.2004.05.004](https://doi.org/10.1016/j.isprsjprs.2004.05.004)

## See Also
- [LAS](las.md) · [Diagnostics](diagnostics.md) · [GeoTIFF](geotiff.md) · [Decision Guide](decision-guide.md)
