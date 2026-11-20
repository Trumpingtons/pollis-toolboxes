# Searching the STAC Catalogue

## What a STAC Catalogue Is

A SpatioTemporal Asset Catalog (STAC) API is a web API for searching catalogues of assets such as satellite images by collection, bounding box, time and properties, built on OGC API - Features: it returns the items found as GeoJSON features, in pages linked to the next, each item with links to its assets ([STAC Contributors (2023)](#ref-STACC2023a)). The STAC catalogue of the Copernicus Data Space Ecosystem lists the products of the Sentinel missions this way, each band of a Sentinel-2 product an asset of its item ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)).

## How Find Scenes Searches the Copernicus Data Space

Find Scenes asks the search endpoint of the STAC catalogue for the items of the Collection whose outline meets the Area between the From and To dates, a hundred to a page, and follows the link of each page to the next until it has the Scenes asked for or the search ends. For the collections whose scenes record a cloud cover, it adds a filter in the CQL2 text language that keeps the scenes with at most the Most Cloud ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)). DuckDB reads the pages as JSON and keeps one row per scene in the table `scenes`.

## The Properties of a Scene in the STAC Catalogue

| Column of `scenes` | Property of the item | What it holds |
|---|---|---|
| `acquired` | `datetime` | When the scene was taken, in UTC |
| `cloud` | `eo:cloud_cover` | The share of the scene classed as cloud, in per cent |
| `platform` | `platform` | The satellite, such as sentinel-2b |
| `tile` | `grid:code` | The tile of the scene, such as an MGRS tile of Sentinel-2 |
| `orbit` | `sat:orbit_state` | Ascending or descending |
| `assets` | `assets` | The files of the scene, with their addresses and properties |

The column `covered` adds the share of the Area inside the scene's outline.

## The Assets of a Scene in the STAC Catalogue

Each asset of an item names a file of the product, with its media type, its size, its coordinate system as `proj:code`, its no-data value, and for the bands of Sentinel-2 the scale and offset that turn its stored integers into reflectance ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)). Its address is on the object storage of the Copernicus Data Space Ecosystem, with an alternate address on the download service over HTTPS; Sentinel-2 Bands and Sentinel-1 Radar download from the second, which asks for the access token of an account ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)).

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

<a id="ref-CDSE2026a"></a>Copernicus Data Space Ecosystem (2026). STAC Product Catalogue. [documentation.dataspace.copernicus.eu/APIs/STAC.html](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)

<a id="ref-STACC2023a"></a>STAC Contributors (2023). STAC API Specification, version 1.0.0. [github.com/radiantearth/stac-api-spec](https://github.com/radiantearth/stac-api-spec)

## See Also
- [Decision Guide](decision-guide.md) · [Sentinel-2 Bands](sentinel-2.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
