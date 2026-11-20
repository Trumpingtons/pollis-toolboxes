# Atom Download Feeds

## Pre-Defined Dataset Download Services

A pre-defined dataset download service offers each dataset of INSPIRE as files prepared in advance, for download as they are, without a query ([European Commission (2009)](#ref-EC2009a)). The technical guidance for INSPIRE download services implements it with Atom, the XML syndication format of feeds and entries, whose links say, by their relation, media type and length, what each linked resource is ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a); [Nottingham and Sayre (2005)](#ref-NS2005a)). The Atom Download tab of the INSPIRE Data panel reads such feeds with EzXML.jl ([Sato (2026)](#ref-Sat2026a)).

## The Top Feed and the Dataset Feeds

An INSPIRE Atom download service has a top feed, the feed of the service, with an entry for each dataset it offers; each entry links to the feed of that dataset ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a)). The dataset feed has an entry for each form of the dataset, in one coordinate reference system and one format, linked to its files. Atom Download follows the links of the top feed whose media type is that of an Atom feed to the dataset feeds; a Feed Address that is already a dataset feed, with no such links, is read as one.

## Files in One Part or Several

An entry of a dataset feed links to its file with the relation alternate when the dataset comes in one file, or to each of its parts with the relation section when it is split into several, and the length of each link gives the size of the file in bytes ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a); [Nottingham and Sayre (2005)](#ref-NS2005a)). Atom Download lists the files of all the dataset feeds, with their sizes in MB when the feed gives them, and downloads one: the first whose address contains the File input, among those DuckDB reads or a .zip.

## How Atom Download Unpacks and Reads a File

Atom Download keeps the file it downloads in the Folder, and unpacks a .zip once into a folder beside it with ZipArchives.jl, writing no entry outside that folder ([Zimmerberg (2026)](#ref-Zim2026a)). It then reads the first file of the .zip that DuckDB's spatial extension reads, such as a GML file or a GeoPackage ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A GML file of INSPIRE holds one layer for each type of spatial object, such as administrative units and administrative boundaries ([INSPIRE Maintenance and Implementation Group (2024)](#ref-IMIG2024a)): the Layer input chooses one, and Atom Download lists the layers of the file when the Layer is not among them.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-EC2009a"></a>European Commission (2009). Commission Regulation (EC) No 976/2009 of 19 October 2009 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards the Network Services. *Official Journal of the European Union*, L 274, 9–18. [eur-lex.europa.eu/eli/reg/2009/976/oj](https://eur-lex.europa.eu/eli/reg/2009/976/oj)

<a id="ref-IOCTF2013a"></a>Initial Operating Capability Task Force (2013). Technical Guidance for the implementation of INSPIRE Download Services, version 3.1. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/technical-guidance-implementation-inspire-download-services_en)

<a id="ref-IMIG2024a"></a>INSPIRE Maintenance and Implementation Group (2024). INSPIRE Data Specification on Administrative Units – Technical Guidelines. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/inspire-data-specification-administrative-units-technical-guidelines_en)

<a id="ref-NS2005a"></a>Nottingham, M. and Sayre, R. (2005). The Atom Syndication Format. RFC 4287. Internet Engineering Task Force. [doi:10.17487/RFC4287](https://doi.org/10.17487/RFC4287)

<a id="ref-Sat2026a"></a>Sato, K. (2026). EzXML.jl: XML/HTML handling tools for primates. [github.com/JuliaIO/EzXML.jl](https://github.com/JuliaIO/EzXML.jl)

<a id="ref-Zim2026a"></a>Zimmerberg, N. (2026). ZipArchives.jl: read and write Zip archive files in Julia. [github.com/JuliaIO/ZipArchives.jl](https://github.com/JuliaIO/ZipArchives.jl)

## See Also
- [Web Feature Service](wfs.md) · [OGC API Features](ogc-api-features.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
