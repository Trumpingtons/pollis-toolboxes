# Cloud-Optimised GeoTIFF

## What Is a Cloud-Optimised GeoTIFF?

A Cloud-Optimised GeoTIFF, COG, is a GeoTIFF file organised so that a reader can fetch only the part it needs over the web. The OGC Cloud Optimized GeoTIFF Standard, version 1.0 of 2023, rests on two features of TIFF, tiles and reduced-resolution images, on the GeoTIFF keys for the georeference, and on HTTP range requests, which ask a web server for a given range of bytes of a file ([Open Geospatial Consortium (2023)](#ref-OGC2023a)). A COG-aware application downloads only the bytes it needs to display or process an area. Many remote sensing datasets in cloud storage are published as Cloud-Optimised GeoTIFF for that reason.

## Tiles, Overviews and the Order of a Cloud-Optimised GeoTIFF

The cells of a Cloud-Optimised GeoTIFF are stored in square tiles, often 256 or 512 cells a side, so the cells of an area lie together in the file. Overviews are reduced-resolution copies of the image, each half the size of the one before, which serve a view of a large area without reading every cell ([Open Geospatial Consortium (2023)](#ref-OGC2023a)). GDAL's COG driver writes the header and the directories of all the images at the start of the file, before the tiles, so a reader learns where every tile is from the first bytes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). File Metadata shows the layout COG, the block size and the number of overviews of each band.

## Reading a Cloud-Optimised GeoTIFF Over the Web

GDAL reads a file on a web server through its virtual file system: a path such as `/vsicurl/https://example.org/dem.tif` reads the file with HTTP range requests instead of downloading it ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Rasters.jl passes such a path to GDAL, so `Raster("/vsicurl/https://..."; lazy = true)` opens a remote Cloud-Optimised GeoTIFF, and a `crop` before `read` downloads only the tiles of the area ([Schouten (2026)](#ref-Sch2026a)). The same works for any GeoTIFF on a server, but a file without tiles and overviews may need most of its bytes for a small area.

## Writing a Cloud-Optimised GeoTIFF

GDAL's COG driver writes a Cloud-Optimised GeoTIFF from any raster: it tiles the cells, builds the overviews and orders the file ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Its creation options include COMPRESS, BLOCKSIZE for the size of the tiles, and OVERVIEW_RESAMPLING for how overviews are computed, averaging for continuous surfaces and nearest neighbour for classes. With Rasters.jl, `write(path, raster; driver = "COG", options = Dict("COMPRESS" => "DEFLATE"))` writes one ([Schouten (2026)](#ref-Sch2026a)). GDAL builds overviews only for rasters larger than a tile, so a small raster may have none.

## Is a Cloud-Optimised GeoTIFF Larger Than a GeoTIFF?

A Cloud-Optimised GeoTIFF holds the overviews as well as the full-resolution cells, so it is larger than the same raster without them; each overview level holds a quarter of the cells of the level before, so the first overview adds the most. Tiles also compress differently from strips. Compression Side by Side writes the band read as a plain GeoTIFF with several compressions and as a Cloud-Optimised GeoTIFF, and prints the size and read time of each, for the raster at hand.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2023a"></a>Open Geospatial Consortium (2023). OGC Cloud Optimized GeoTIFF Standard, Version 1.0 (OGC 21-026). [docs.ogc.org/is/21-026/21-026.html](https://docs.ogc.org/is/21-026/21-026.html)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [GeoTIFF](geotiff.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Coordinates and Georeferencing](georeferencing.md)
