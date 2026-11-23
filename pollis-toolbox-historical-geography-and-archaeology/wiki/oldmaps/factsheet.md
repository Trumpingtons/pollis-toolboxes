# Historical Maps — Factsheet

**Old maps** set beside today's map show how a place has changed: streets laid out or gone, rivers moved, towns grown over fields. The Historical Maps panel of the Historical Geography and Archaeology Toolbox draws an old map and today's map of the same place together, with MapLibre GL JS, from three sources: the maps of France that IGN serves as tiles, the maps of libraries that Allmaps holds georeferenced, and famous maps of the world in the images their libraries publish ([MapLibre Contributors (2026)](#ref-MLC2026a); [Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a); [Allmaps (2026)](#ref-All2026a)).

| Item | Historical Maps panel |
|---|---|
| **Purpose** | Compare an old map with today's map of the same place, and find the old maps of a place |
| **Tabs** | Maps of France; Georeferenced Maps; Famous Maps |
| **Inputs** | Folder; Place; Zoom; Old Map, Map of Today, Other Old Map (Maps of France); Largest, Map Number, Other Map Number (Georeferenced Maps); Year of Borders; Famous Map (Famous Maps) |
| **Core packages** | [HistoricalGeography.jl](https://github.com/Trumpingtons/HistoricalGeography.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Output** | A map with a swipe, or an old map beside today's; for Georeferenced Maps, the table `maps` |
| **Needs** | An Internet connection; no account or key |

## What Do the Inputs of Historical Maps Set?

| Input | What the input sets |
|---|---|
| Folder | Where the list of maps found and the manifests read are kept, and where Export saves |
| Place | The centre of the map, as longitude and latitude |
| Zoom | The zoom the map opens on, and that of Save as GeoTIFF |
| Old Map | For Maps of France, the old map on the left of the line |
| Map of Today | For Maps of France, the map on the right of the line: aerial photographs, Plan IGN or OpenStreetMap |
| Other Old Map | The old map that Two Old Maps sets on the right of the line |
| Largest | For Georeferenced Maps, the largest area in km² a map may cover |
| Map Number, Other Map Number | For Georeferenced Maps, the maps of the list that are drawn |
| Year of Borders | The year whose borders Borders over the Map draws |
| Famous Map | For Famous Maps, the map shown |

## What Is in the Table of Maps of Georeferenced Maps?

The Georeferenced Maps tab of the Historical Maps panel writes the table `maps` in DuckDB, one row for each map of Allmaps that covers the Place. The columns are `id`, the map's identifier in Allmaps; `title`, the label of its IIIF manifest; `year`, the year its manifest gives, or missing; `library`, the institution that provides the image; `km2`, the area the map covers; `tiles`, the address of the map's tiles from the Allmaps Tile Server; `image` and `manifest`, its IIIF image and manifest; `editor`, its page in Allmaps Editor; and `geom`, the outline of the map on today's coordinates ([Allmaps (2026)](#ref-All2026a); [Appleby, Crane, Sanderson, Stroop and Warner (2020)](#ref-ACSSW2020a)).

## Which Functions of HistoricalGeography.jl Does Historical Maps Call?

The Maps of France tab of the Historical Maps panel calls `ign_layer(id)`, which gives the title, years, tile address, zooms and source of a map of France, and Zooms of the Maps lists them all with `ign_layers()`. The Georeferenced Maps tab calls `allmaps(con; at, largest, folder)`, which asks Allmaps for the maps that cover a point and writes the table `maps`. The Famous Maps tab calls `famous_map(id)`, and The Famous Maps lists the eight with `famous_maps()`. Save as GeoTIFF calls `save_geotiff(url, box; zoom, path)`, which reads the tiles through GDAL with ArchGDAL.jl, and Borders over the Map calls `historical_borders` and `borders_geojson`, as Historical Borders does ([Ng (2026)](#ref-Ng2026a)).

## What Do the Next Steps of Historical Maps Do?

| Group | Action | Tabs | What the action shows |
|---|---|---|---|
| Visualise | Old Map Over Today | Maps of France, Georeferenced Maps | The old map half transparent over today's |
| Visualise | Map Outlines | Georeferenced Maps | The outline of every map found, coloured by year |
| Visualise | Whole Image | Famous Maps | The image of the famous map alone |
| Diagnose | Zooms of the Maps | Maps of France | The zooms at which each map of France has tiles |
| Diagnose | Missing Titles and Years | Georeferenced Maps | The maps without a title or a year, by library |
| Compare | Two Old Maps | Maps of France | Two old maps of France on either side of the line |
| Compare | Two Maps of the Place | Georeferenced Maps | Two maps of Allmaps on either side of the line |
| Interpret | Borders over the Map | Maps of France, Georeferenced Maps | The borders of Cliopatria in the map's year over the old map |
| Interpret | Libraries of the Maps | Georeferenced Maps | The libraries whose maps cover the Place |
| Interpret | The Famous Maps | Famous Maps | The eight famous maps, their libraries and terms |
| Export | Save as GeoTIFF | Maps of France, Georeferenced Maps | The old map around the Place as a GeoTIFF |
| Export | Save the Image | Famous Maps | The image of the famous map as a JPEG |

## References

<a id="ref-All2026a"></a>Allmaps (2026). Allmaps: curating, georeferencing and exploring IIIF maps. [allmaps.org](https://allmaps.org)

<a id="ref-ACSSW2020a"></a>Appleby, M., Crane, T., Sanderson, R., Stroop, J. and Warner, S. (2020). IIIF Presentation API 3.0. IIIF Consortium. [iiif.io/api/presentation/3.0](https://iiif.io/api/presentation/3.0/)

<a id="ref-IGN2026a"></a>Institut national de l'information géographique et forestière (2026). API Géoplateforme – Diffusion d'images tuilées WMTS. [data.geopf.fr/wmts](https://data.geopf.fr/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Maps of France](maps-of-france.md) · [Georeferenced Maps](georeferenced-maps.md) · [Famous Maps](famous-maps.md)
