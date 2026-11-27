# Historical Maps — Maps of France

Maps of France is the tab of the Historical Maps panel that draws the historical maps of France that IGN, the Institut national de l'information géographique et forestière, serves as tiles on its Géoplateforme, beside today's aerial photographs, Plan IGN or OpenStreetMap ([Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a)).

## What Is the Map of Cassini?

The map of Cassini, the general map of France, was made by the Cassini family of cartographers between 1756 and 1815: about 180 sheets, the first map of the kingdom that is both general and detailed. The map shows France within its borders of the time, without Nice, Savoy and Corsica, and with towns now in Belgium, Luxembourg or Germany ([Archives nationales and Institut national de l'information géographique et forestière (2025a)](#ref-ANIGN2025a)). Some areas are missing where sheets were lost or damaged.

## What Are the Two Copies of the Map of Cassini in Maps of France?

The Old Map input of the Maps of France tab offers two copies of the map of Cassini. Cassini, Copy of the King is the copy commissioned by the King, scanned at 400 dpi by the Archives nationales ([Archives nationales and Institut national de l'information géographique et forestière (2025a)](#ref-ANIGN2025a)). Cassini, Copy of Marie-Antoinette is the copy said to have been made for Queen Marie-Antoinette, scanned at 400 dpi by the Bibliothèque nationale de France ([Archives nationales and Institut national de l'information géographique et forestière (2025b)](#ref-ANIGN2025b)). IGN cut, assembled and georeferenced the sheets of both copies.

## Which Other Old Maps Does Maps of France Offer?

| Old Map | Years | Zooms with tiles |
|---|---|---|
| Cassini, Copy of Marie-Antoinette | 1756 to 1815 | 6 to 14 |
| Cassini, Copy of the King | 1756 to 1815 | 0 to 14 |
| État-Major, 1820-1866 | 1820 to 1866 | 6 to 15 |
| État-Major of Paris, 1818-1824 | 1818 to 1824, at 1:10,000 | 6 to 16 |
| Map of 1950 | IGN's map of 1950 at 1:50,000 | 3 to 15 |
| Aerial Photographs, 1950-1965, 1965-1980, 1980-1995 | The years of each coverage | 0 or 3 to 18 |

The years and zooms are those of IGN's service ([Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a)). Today's Plan IGN and aerial photographs have tiles to zoom 19.

## Under Which Terms Can the Map of Cassini Be Reused?

IGN publishes both copies of the map of Cassini under the Licence Ouverte: public information that may be reused freely and at no cost, anywhere and for any purpose, including commercial, provided the integrity of the data is respected. Every redistribution must name the source that IGN's metadata give, which names the Archives nationales, IGN and the copy scanned ([Archives nationales and Institut national de l'information géographique et forestière (2025a)](#ref-ANIGN2025a); [Archives nationales and Institut national de l'information géographique et forestière (2025b)](#ref-ANIGN2025b)). The Maps of France tab shows that source in the corner of the map, and Save as GeoTIFF prints it with the file.

## How Does Save as GeoTIFF Save a Map of France?

Save as GeoTIFF, a Next Step of the Maps of France and Georeferenced Maps tabs of the Historical Maps panel, saves the old map around the Place as one GeoTIFF file in the Folder: the tiles at Zoom over a box four tiles wide, read through GDAL's WMS driver with ArchGDAL.jl, in Web Mercator (EPSG:3857), with red, green, blue and alpha bands ([Ng (2026)](#ref-Ng2026a); [Open Geospatial Consortium (2019)](#ref-OGC2019a)). A GIS opens the file on its coordinates. A Zoom higher by one doubles the detail and halves the area saved.

## References

<a id="ref-ANIGN2025a"></a>Archives nationales and Institut national de l'information géographique et forestière (2025a). Carte de Cassini – exemplaire du Roi. Dataset, Licence Ouverte / Open License. [cartes.gouv.fr](https://cartes.gouv.fr/rechercher-une-donnee/dataset/ARCHIVES-NATIONALES_CASSINI-ROI)

<a id="ref-ANIGN2025b"></a>Archives nationales and Institut national de l'information géographique et forestière (2025b). Carte de Cassini – exemplaire dit « de Marie-Antoinette ». Dataset, Licence Ouverte / Open License. [cartes.gouv.fr](https://cartes.gouv.fr/rechercher-une-donnee/dataset/BNF_CASSINI-MARIE-ANTOINETTE)

<a id="ref-IGN2026a"></a>Institut national de l'information géographique et forestière (2026). API Géoplateforme – Diffusion d'images tuilées WMTS. [data.geopf.fr/wmts](https://data.geopf.fr/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OGC2019a"></a>Open Geospatial Consortium (2019). OGC GeoTIFF Standard, Version 1.1 (OGC 19-008r4). [docs.ogc.org/is/19-008r4/19-008r4.html](https://docs.ogc.org/is/19-008r4/19-008r4.html)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Georeferenced Maps](georeferenced-maps.md)
