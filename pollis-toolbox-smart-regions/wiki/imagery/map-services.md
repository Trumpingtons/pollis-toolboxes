# Map Services

## What Is a Web Map Service (WMS)?

A Web Map Service (WMS) is the standard of the Open Geospatial Consortium for asking a server for map images over HTTP ([Open Geospatial Consortium (2006)](#ref-OGC2006a)). GetCapabilities returns an XML description of the service: its layers, the coordinate systems it draws them in, and the image formats it returns. GetMap returns a picture of chosen layers over a box, in a coordinate system and at a size in pixels, as PNG or JPEG; a transparent PNG lets the map beneath show through. GetFeatureInfo, which a service may offer for its queryable layers, returns what lies at a pixel of such a picture. Many servers also answer GetLegendGraphic, which returns the image of a layer's legend. A web map uses GetMap as a tile service by asking for one tile's box at a time, which MapLibre GL JS writes as `{bbox-epsg-3857}` in the address ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## What Is a Web Map Tile Service (WMTS)?

A Web Map Tile Service (WMTS) serves maps as predefined image tiles, where WMS draws any box on request ([Open Geospatial Consortium (2010)](#ref-OGC2010a)). A tile matrix set fixes the coordinate system, the zoom levels, called tile matrices, and the grid of tiles at each; the server can then make every tile once and serve it as a file. WMTS can be asked in key-value form, as WMS is, or in a REST form, where the address of a tile is a template with the tile matrix, the row and the column in it. The Sentinel-2 cloudless mosaics are served in REST form on a Web Mercator grid, whose address puts the row before the column ([EOX IT Services GmbH (2026)](#ref-EOX2026a)). GetCapabilities lists the layers, the tile matrix sets and the template of each layer.

## The ArcGIS REST API of Map and Image Services

ArcGIS servers publish their maps through a REST API, besides WMS ([Esri (2026)](#ref-Esr2026a)). A map service draws vector or raster layers: its export operation returns a map image of a box, a size and a set of layers, streamed directly when the image format is asked for, and the query operation of a layer returns its features, with the fields asked for and their geometries, as JSON or GeoJSON. An image service serves a raster: exportImage returns its pixels over a box in a chosen spatial reference, as a picture or as a GeoTIFF of the values themselves, and identify returns the value of the pixel at a point. The European Environment Agency serves CORINE Land Cover as map services and the High-Resolution Layers as image services.

## Tiles, Scales and Empty Answers

A service may draw different layers at different scales. The European Environment Agency's CORINE map services draw the 100 m raster when the map is zoomed out and the polygons from a scale of about 1:250,000 in, with the same classes and colours. A service answers a tile outside its data with a transparent picture, not with an error, so a layer that is blank on the map may be outside the area mapped or above the zoom the service has tiles for ([Open Geospatial Consortium (2006)](#ref-OGC2006a); [Open Geospatial Consortium (2010)](#ref-OGC2010a)). A WMS reports a request it cannot draw with an XML exception report in place of an image. Tile at the Centre, in Diagnose, prints the status, type and size of the tile under the place, which tells these cases apart.

## References

<a id="ref-EOX2026a"></a>EOX IT Services GmbH (2026). EOxCloudless: Sentinel-2 cloudless mosaics. [cloudless.eox.at](https://cloudless.eox.at)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OGC2006a"></a>Open Geospatial Consortium (2006). OpenGIS Web Map Service (WMS) Implementation Specification, Version 1.3.0 (OGC 06-042). [portal.ogc.org/files/?artifact_id=14416](https://portal.ogc.org/files/?artifact_id=14416)

<a id="ref-OGC2010a"></a>Open Geospatial Consortium (2010). OpenGIS Web Map Tile Service Implementation Standard, Version 1.0.0 (OGC 07-057r7). [portal.ogc.org/files/?artifact_id=35326](https://portal.ogc.org/files/?artifact_id=35326)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Sentinel-2 Mosaic](sentinel2.md) · [CORINE Land Cover](corine.md) · [High-Resolution Layers](hrl.md)
