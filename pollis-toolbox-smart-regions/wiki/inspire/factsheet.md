# INSPIRE Data — Factsheet

**INSPIRE**, the Infrastructure for Spatial Information in the European Community, has the member states make their spatial data sets available through network services, among them download services ([European Parliament and Council of the European Union (2007)](#ref-EPCEU2007a)). The INSPIRE Data panel of the Smart Regions Toolbox finds the INSPIRE datasets of administrative and statistical units in data.europa.eu, the European entry point for geospatial datasets ([European Commission (2026)](#ref-EC2026a)), and reads them from the countries' download services with DuckDB.jl and DuckDB's spatial extension ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | INSPIRE Data panel |
|---|---|
| **Purpose** | Find the INSPIRE datasets of a theme in a country, read their units from a download service, check them, compare them with GISCO's and save them |
| **Input** | A theme and a country; the address of a WFS, an Atom feed or an OGC API, with its layer, file or collection; the name and colour columns |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl) (`inspire_search`, `inspire_countries`, `wfs_features`, `atom_features`, `ogc_features`, `vector_units`, `gisco_file`), which reads XML with [EzXML.jl](https://github.com/JuliaIO/EzXML.jl) and zip archives with [ZipArchives.jl](https://github.com/JuliaIO/ZipArchives.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Tabs** | Find Datasets; WFS Download; Atom Download; OGC API Features |
| **Output** | Find Datasets: the tables `datasets` and `services`. The other tabs: the table `features`, one row per unit, with the service's columns, its area in km² as `km2` and its geometry as `geom` |
| **Key choices** | The theme and country; the service and its layer, file or collection; the page size; the Name Column and Colour By |

## How the INSPIRE Data Panel Reads Each Service

| Tab | Service | How the tab reads it |
|---|---|---|
| Find Datasets | The search API of data.europa.eu | One search by the words of the theme and inspire, filtered by the country; each dataset's download services from its distributions |
| WFS Download | A Web Feature Service | GetCapabilities for the layers and output formats, then GetFeature page by page, as GeoJSON when the service offers it |
| Atom Download | An INSPIRE Atom feed | The top feed, then each dataset feed, then the file chosen, unpacked when it is a .zip |
| OGC API Features | An OGC API | The collections, then the items of one collection, each page linked to the next |

## Downloads Kept in the Folder of the INSPIRE Data Panel

The WFS Download and OGC API Features tabs write the features of a layer or a collection, once downloaded, as one GeoParquet file in the Folder, named after the service's host and the layer or collection; Atom Download keeps the file of the feed as it came, with a .zip unpacked into a folder beside it. Each tab reads its download from the Folder when it is there, so the services are asked only once. Deleting a download makes the tab ask the service again, which is the way to read data the publisher has since updated.

## What the Next Steps of the INSPIRE Data Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Largest Units by Area, Services of the Datasets | The units on a base map coloured by Colour By; the largest units in km²; the kinds of download service of the datasets found |
| Diagnose | Download and Columns, Geometry Check, Catalogues and Duplicates | The source, columns, extent and levels; invalid, empty and multipart geometries; the catalogues of the datasets found and the titles found twice |
| Compare | Beside GISCO's Units, Countries Side by Side | The units of one level beside GISCO's local administrative units; the datasets of every country and their services |
| Interpret | Units by Level, Licences of the Datasets | The number and areas of the units of each level; the licences of the services found |
| Export | Save as GeoPackage, Save as GeoParquet, Save the List as CSV | The units read, with their area; the datasets found with their services |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-EC2026a"></a>European Commission (2026). The European Commission is transitioning the INSPIRE infrastructure to EU horizontal services to ensure long-term continuity and efficiency. INSPIRE Knowledge Base. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/news-and-publications/news/european-commission-transitioning-inspire-infrastructure-eu-horizontal-services-ensure-long-term-2026-07-01_en)

<a id="ref-EPCEU2007a"></a>European Parliament and Council of the European Union (2007). Directive 2007/2/EC of the European Parliament and of the Council of 14 March 2007 establishing an Infrastructure for Spatial Information in the European Community (INSPIRE). *Official Journal of the European Union*, L 108, 1–14. [eur-lex.europa.eu/eli/dir/2007/2/oj](https://eur-lex.europa.eu/eli/dir/2007/2/oj)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Searching data.europa.eu](data-europa-search.md) · [Web Feature Service](wfs.md) · [Atom Download Feeds](atom-feeds.md) · [OGC API Features](ogc-api-features.md) · [Administrative and Statistical Units](units-themes.md)
