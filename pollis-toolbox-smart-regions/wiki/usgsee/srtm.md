# SRTM Elevation

## How the Shuttle Radar Topography Mission Measured Elevation

The Shuttle Radar Topography Mission (SRTM) flew on the space shuttle Endeavour in February 2000 with two radar antennas, one in the shuttle's bay and one at the end of a mast, so that the difference between the echoes they received gave the height of the surface by radar interferometry ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)). Its data were processed into a digital elevation model at a resolution of 1 arc-second, about 30 m, for the land between 60 degrees north and 56 degrees south ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)). Heights are given in metres above the EGM96 geoid, on the WGS84 datum ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)).

## What an SRTM Height Measures

A radar height is that of the surface which returns the echo, so SRTM measures the ground where it is bare, and a height between the ground and the top of the canopy in forests, and the tops of buildings in cities ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)). SRTM is therefore a surface model, not a model of the bare ground. The original data have gaps, or voids, where too little signal returned, such as on steep slopes in radar shadow and on some smooth surfaces ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)). Elevation Summary gives the quantiles of the heights over the Area, its range, and where its highest and lowest cells are.

## The SRTM Products the Elevation Tab Reads

| Elevation Product | What it is |
|---|---|
| SRTM 1 Arc-Second Global | The elevation at 1 arc-second, about 30 m, in tiles of 1 by 1 degree ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)) |
| SRTM Void Filled | The elevation with the voids of the original data filled, at 3 arc-seconds outside the United States |

Elevation finds the dataset by its name with `dataset-search` of the M2M API ([U.S. Geological Survey (2026)](#ref-USGS2026a)), searches its tiles over the Area with `scene-search`, and downloads each tile's GeoTIFF, the finest the API offers.

## How the Elevation Tab Joins the SRTM Tiles

An Area that crosses a whole degree of longitude or latitude spans several tiles. Elevation cuts each tile to the Area with Rasters.jl, reading only the cells it needs, and joins the pieces into one grid ([Schouten (2026)](#ref-Sch2026a)). The grid is in longitude and latitude, EPSG:4326, so its cells are 1 arc-second on each side, narrower in metres from west to east the farther the Area is from the equator. Elevation Profile draws the heights along the row of cells through the middle of the Area, from west to east.

## References

<a id="ref-EROSC2017a"></a>Earth Resources Observation and Science (EROS) Center (2017). Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global. [doi:10.5066/F7PR7TFT](https://doi.org/10.5066/F7PR7TFT)

<a id="ref-FRCCD...2007a"></a>Farr, T. G., Rosen, P. A., Caro, E., Crippen, R., Duren, R., Hensley, S., Kobrick, M., Paller, M., Rodriguez, E., Roth, L., Seal, D., Shaffer, S., Shimada, J., Umland, J., Werner, M., Oskin, M., Burbank, D. and Alsdorf, D. (2007). The Shuttle Radar Topography Mission. *Reviews of Geophysics*, 45(2). [doi:10.1029/2005RG000183](https://doi.org/10.1029/2005RG000183)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Overview](overview.md) · [The M2M API](m2m-api.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
