# Copernicus Imagery Layers — Factsheet

**Copernicus imagery layers** are maps made from the satellite images of the European Union's Copernicus programme, served by map services as tiles that any web map can draw. The Copernicus Imagery Layers panel of the Smart Regions Toolbox shows three of them on an OpenStreetMap base map in Pollis's browser, drawn by MapLibre GL JS: the yearly Sentinel-2 cloudless mosaics of EOX IT Services, CORINE Land Cover, and the High-Resolution Layers of the Copernicus Land Monitoring Service ([EOX IT Services GmbH (2026)](#ref-EOX2026a); [European Environment Agency (2019)](#ref-EEA2019a); [MapLibre Contributors (2026)](#ref-MLC2026a)).

| Item | Copernicus Imagery Layers panel |
|---|---|
| **Purpose** | See a place from above, what its land is used for, and how much of it is sealed, wooded, grassy or wet |
| **Input** | A place (longitude and latitude), a zoom, and the year or layer of each tab |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | Sentinel-2 Mosaic, CORINE Land Cover, High-Resolution |
| **Services** | EOX's WMTS for the mosaics; the European Environment Agency's ArcGIS map and image services, and WMS, for the rest |
| **Output** | An interactive map on a page in Pollis's browser, or in a notebook output, with the layer's legend and attribution |
| **Key choices** | The year or layer, the opacity, the base map's style, and the side of the box the Next Steps measure |

## How Does the Copernicus Imagery Layers Panel Draw a Layer?

The Example Code of the Copernicus Imagery Layers panel builds the address of one tile of the layer, with placeholders the map fills in: `{z}`, `{x}` and `{y}` for the zoom, column and row of a tile, or `{bbox-epsg-3857}` for the box of a tile in Web Mercator metres ([MapLibre Contributors (2026)](#ref-MLC2026a)). `Pollis.tiles` makes a layer of raster tiles from that address, with its name, opacity, legend image and attribution. `Pollis.webmap` puts the layer on a page in Pollis's browser, where MapLibre GL JS draws the base map, fetches the tiles of the area on screen from the service, and puts them under the base map's labels. The tiles are pictures the service draws: the values behind them come from the Next Steps.

## Pollis.tiles

`Pollis.tiles(url; name, opacity, attribution, legend, tilesize, maxzoom)` is a layer of raster tiles for `Pollis.webmap`. The `url` is a tile address with `{z}`, `{x}` and `{y}` in it, as XYZ services and the REST form of the Web Map Tile Service (WMTS) give them, or a request whose box is `{bbox-epsg-3857}`, as a GetMap request of a Web Map Service (WMS) in EPSG:3857 ([Open Geospatial Consortium (2010)](#ref-OGC2010a); [Open Geospatial Consortium (2006)](#ref-OGC2006a)). `opacity` runs from 0 to 1. `attribution` is the text the service asks every map to show, which the map puts at its bottom right. `legend` is the address of an image, such as a GetLegendGraphic request, shown under the layer's name in the legend. `maxzoom` is the highest zoom the service has tiles for: the map enlarges them beyond it.

## Next Steps That Show and Check a Copernicus Imagery Layer

| Group | Action | What it shows |
|---|---|---|
| Visualise | Three Zoom Levels | The layer three levels out, as given, and three levels in |
| Visualise | Over the Imagery | CORINE or a High-Resolution Layer over the Sentinel-2 mosaic of 2018 |
| Diagnose | Tile at the Centre | The service's answer for the tile under the place: status, type and size |
| Diagnose | Service Description | The years of the mosaic, the scales of the CORINE layers, or the pixels of a High-Resolution Layer |
| Compare | Two Years | The year chosen and the first or last of the series |
| Compare | Changes 2012 to 2018 | The CORINE change polygons in the box, with their areas |
| Compare | The Four Layers | The four High-Resolution Layers at the same place |

## Next Steps That Measure and Save a Copernicus Imagery Layer

| Group | Action | What it shows |
|---|---|---|
| Interpret | Pixel Size and Zoom | The ground a screen pixel covers, beside the 10 m of Sentinel-2 |
| Interpret | Values at Points | The value or class at the place and four points around it |
| Interpret | Land Cover Shares | The area and share of each CORINE class in the box |
| Interpret | Summary of the Box | The mean density, or the share of each class, of the 10 m pixels in the box |
| Export | Save as GeoTIFF, Save the Polygons, Save the Values | The mosaic, the CORINE polygons or the 10 m values of the box, in the folder |

## References

<a id="ref-EOX2026a"></a>EOX IT Services GmbH (2026). EOxCloudless: Sentinel-2 cloudless mosaics. [cloudless.eox.at](https://cloudless.eox.at)

<a id="ref-EEA2019a"></a>European Environment Agency (2019). CORINE Land Cover 2018 (vector), Europe, 6-yearly - version 2020_20u1, May 2020. [doi:10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0](https://doi.org/10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OGC2006a"></a>Open Geospatial Consortium (2006). OpenGIS Web Map Service (WMS) Implementation Specification, Version 1.3.0 (OGC 06-042). [portal.ogc.org/files/?artifact_id=14416](https://portal.ogc.org/files/?artifact_id=14416)

<a id="ref-OGC2010a"></a>Open Geospatial Consortium (2010). OpenGIS Web Map Tile Service Implementation Standard, Version 1.0.0 (OGC 07-057r7). [portal.ogc.org/files/?artifact_id=35326](https://portal.ogc.org/files/?artifact_id=35326)

## See Also
- [Overview](overview.md) · [Map Services](map-services.md) · [CORINE Nomenclature](corine-nomenclature.md) · [Decision Guide](decision-guide.md) · [Sentinel-2 Mosaic](sentinel2.md) · [CORINE Land Cover](corine.md) · [High-Resolution Layers](hrl.md)
