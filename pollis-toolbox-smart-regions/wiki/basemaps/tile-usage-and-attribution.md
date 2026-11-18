# Tile Usage and Attribution

## Who Serves the Tiles of the OpenStreetMap Base Maps Panel

The OpenStreetMap Base Maps panel fetches its tiles, styles and fonts from the public instance of OpenFreeMap at tiles.openfreemap.org ([Ero (2026)](#ref-Ero2026a)). OpenFreeMap states that its public instance is free, sets no limit on map views or requests, needs no registration, user accounts, API keys or cookies, and may be used commercially. The project is paid for by donations and support plans. Its tiles are made from OpenStreetMap data, in the OpenMapTiles schema, and the project publishes full downloads of the planet each week. The map needs the internet: MapLibre GL JS fetches the tiles of the area on screen as the map is zoomed and moved ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## The Attribution a Base Map Must Show

OpenStreetMap data must be credited wherever it is shown. OpenFreeMap asks for the attribution "OpenFreeMap © OpenMapTiles Data from OpenStreetMap", in which the OpenFreeMap name is optional; MapLibre GL JS adds it from the style, at the bottom right of the map, with links to each project ([Ero (2026)](#ref-Ero2026a)). Maps shown in other software, in print or in video must carry the same words. The OpenMapTiles schema is open under CC-BY and must be credited when built upon ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a)). A map put in a report or a slide as a picture must carry the attribution too, on the map or right beside it.

## The Tile Usage Policy of tile.openstreetmap.org

The OpenStreetMap Foundation serves the raster tiles of the standard map of openstreetmap.org from tile.openstreetmap.org, on a best-effort basis and without guarantee, under its Tile Usage Policy ([OpenStreetMap Foundation (2026)](#ref-OSMF2026a)). The policy asks for clear attribution, a distinct User-Agent naming the application, and caching that honours the server's headers. It forbids bulk downloading, prefetching and offline use, and says access may be blocked without notice when usage degrades the service; commercial services are told that access may be withdrawn at any point. For other needs, the policy points to other tile providers, to serving tiles oneself, and to vector tiles. The OpenStreetMap Base Maps panel uses OpenFreeMap's vector tiles, not tile.openstreetmap.org.

## Offline Maps and Serving Tiles Oneself

Neither public tile service is meant for downloading large areas in advance. OpenFreeMap allows downloads for offline use of at most 3,000 tiles or 50 MB each, with at most four parallel requests and a distinct User-Agent, and asks to be contacted for more ([Ero (2026)](#ref-Ero2026a)). For larger areas, or for maps that must work without the internet, the planet files OpenFreeMap publishes each week, or tiles made with the OpenMapTiles tools, can be served from one's own server ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a)). `Pollis.webmap` takes the address of any MapLibre style in its `style` argument, so such a server, or a commercial provider, can replace OpenFreeMap ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## References

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OMTC2026a"></a>OpenMapTiles Contributors (2026). OpenMapTiles: vector tile schema implementation. [github.com/openmaptiles/openmaptiles](https://github.com/openmaptiles/openmaptiles)

<a id="ref-OSMF2026a"></a>OpenStreetMap Foundation (2026). Tile usage policy. [operations.osmfoundation.org/policies/tiles](https://operations.osmfoundation.org/policies/tiles/)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md) · [Decision Guide](decision-guide.md)
