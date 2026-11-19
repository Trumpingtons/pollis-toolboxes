# GeoTIFF

## What Is GeoTIFF?

GeoTIFF is the Tagged Image File Format, TIFF, with tags that describe where an image lies on the Earth. Ritter and Ruth describe its origin in the early 1990s as a way to exchange georeferenced raster images between software, by adding the metadata of cartography to a mature, platform-independent image format ([Ritter and Ruth (1997)](#ref-RR1997a)). The Open Geospatial Consortium adopted GeoTIFF 1.1 as a standard in 2019, formalising the community specification 1.0 and aligning it with the EPSG Geodetic Parameter Dataset ([Open Geospatial Consortium (2019)](#ref-OGC2019a)). GeoTIFF is the common format of elevation models, satellite and aerial imagery, and land cover maps.

## What a GeoTIFF File Holds

A GeoTIFF file holds one or more bands over the same grid of cells, each band an image whose cells are numbers: 8-bit or 16-bit integers for imagery, 32-bit floating point for elevations and other measurements. TIFF tags describe the image: its size, the data type, the compression, and whether cells are stored in strips of rows or in square tiles. The GeoTIFF tags add the georeference, and the GeoKeys name the coordinate reference system ([Open Geospatial Consortium (2019)](#ref-OGC2019a)). GDAL adds its own tags, such as the no-data value of the bands and other metadata ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Reading a GeoTIFF File With Rasters.jl

`Raster(path)` reads a GeoTIFF file into a Rasters.jl raster, with dimensions X and Y and, for a multiband file, Band ([Schouten (2026)](#ref-Sch2026a)). The keyword `lazy = true` opens the file without reading the cells, which are read when used. `r[Band(2)]` selects the second band; `crop(r; to = extent)` cuts out an area; `extract(r, points)` gives the values under a list of points. The cells the file marks as no data come back as `missing`. The GeoTIFF tab of the Raster Files panel reads one band, chosen with the Band input, into `grid`.

## Writing a GeoTIFF File With Rasters.jl

`write(path, raster)` writes a Rasters.jl raster to a file whose format GDAL infers from the extension: `.tif` gives a GeoTIFF ([Schouten (2026)](#ref-Sch2026a)). The keyword `driver` chooses another driver, such as `"COG"` for a Cloud-Optimised GeoTIFF, and `options` passes GDAL's creation options, such as `Dict("COMPRESS" => "DEFLATE", "TILED" => "YES")`. The keyword `missingval` sets the value written for the missing cells, which becomes the no-data value of the file. Save as Cloud-Optimised GeoTIFF and Reproject to Longitude and Latitude write the band read with the no-data value of the file read.

## Compression of GeoTIFF Files

GDAL writes GeoTIFF files uncompressed unless a creation option asks for compression ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The lossless choices are LZW, DEFLATE, ZSTD and LERC with a maximum error of zero; JPEG and WEBP are lossy, meant for photographs, and change the values of the cells. For elevation models and other measurements, a lossless compression with the predictor option keeps the values exact in a smaller file. Compression Side by Side compares the sizes and read times of the band read written without compression and with LZW, DEFLATE and ZSTD.

## Reprojecting a Raster

Reprojecting, or warping, a raster to another coordinate system builds a new grid in the target system and fills each new cell from the cells of the original that fall under it ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Rasters.jl does it with `resample(raster; crs = EPSG(4326))`, which calls GDAL's warp; the keyword `method` chooses how cells are filled ([Schouten (2026)](#ref-Sch2026a)). Nearest neighbour keeps the original values, as land cover classes need; bilinear and cubic interpolation smooth continuous surfaces such as elevations. Each warp resamples, so a raster is best kept in its original system and reprojected once, for the use that needs it.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2019a"></a>Open Geospatial Consortium (2019). OGC GeoTIFF Standard, Version 1.1 (OGC 19-008r4). [docs.ogc.org/is/19-008r4/19-008r4.html](https://docs.ogc.org/is/19-008r4/19-008r4.html)

<a id="ref-RR1997a"></a>Ritter, N. and Ruth, M. (1997). The GeoTiff data interchange standard for raster geographic images. *International Journal of Remote Sensing*, 18(7), 1637–1647. [doi:10.1080/014311697218340](https://doi.org/10.1080/014311697218340)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md) · [Coordinates and Georeferencing](georeferencing.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
