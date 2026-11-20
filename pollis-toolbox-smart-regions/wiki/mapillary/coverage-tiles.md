# Coverage Tiles

## The Coverage Tiles of Mapillary

Mapillary serves the coverage of its images as vector tiles, in three layers whose content depends on the zoom ([Mapillary (2026)](#ref-Map2026a)). The documentation expects programs to use the vector tiles for spatial queries at scale, since its entity endpoints offer only a limited search by bounding box.

| Layer | Zoom | Geometry | What each feature is |
|---|---|---|---|
| `overview` | 0 to 5 | Point | A cluster of images, at low zoom |
| `sequence` | 6 to 14 | Line | A sequence of images captured in one collection, sorted by capture time |
| `image` | 14 | Point | One image |

The features of the image layer carry the image's identifier, sequence, capture time in milliseconds, compass angle, creator and organisation numbers, whether it is a panorama, and its quality score.

## Original and Computed Positions of Mapillary Images

Mapillary publishes two sets of coverage tiles with the same layers and attributes: one with the positions of the images as originally recorded, and one with their computed positions, map-matched by processing the images ([Mapillary (2026)](#ref-Map2026a)). Coverage reads the computed coverage tiles, `mly1_computed_public`, so that its images lie where the processing places them, as the computed geometry of the Images tab does. The Images tab falls back on the original position for an image without a computed one; the tiles give one position for each image.

## How Coverage Reads the Tiles

Coverage finds the tiles of zoom 14 that cover the Area, downloads each into a folder of the day, and reads its `image` and `sequence` layers with the vector tile driver of GDAL, through `ST_Read` of DuckDB's spatial extension ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The points come in the Web Mercator projection of the tiles and are transformed to longitude and latitude. An image near the edge of a tile may appear in two tiles, and is kept once; a sequence crossing several tiles comes in pieces, which are joined into one line. Only the images inside the Area, and the parts of the sequences inside it, are kept. A tile with no images is kept as an empty file.

## The Columns of the Coverage Tables

| Table | Column | What it holds |
|---|---|---|
| `images` | `id`, `sequence_id` | The image and its sequence |
| `images` | `captured_at`, `compass_angle`, `is_pano` | When it was captured, its heading in degrees, whether it is a panorama |
| `images` | `quality_score` | The predicted visual quality, from 0 to 1, where Mapillary gives one |
| `images` | `creator`, `organization_id` | The numbers of the person and of the organisation that contributed it |
| `sequences` | `id`, `image_id`, `captured_at` | The sequence, its representative image and when it began |
| `sequences` | `is_pano`, `quality_score`, `geom` | Whether it is of panoramas, its mean quality score, its line |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Image Search](image-search.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
