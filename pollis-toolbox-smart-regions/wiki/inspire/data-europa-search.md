# Searching data.europa.eu

## What data.europa.eu Collects

data.europa.eu, the official portal for European data, collects the metadata of datasets from national, regional and European data portals and catalogues, and its search API searches them by words and by facets such as country, catalogue, format and licence ([Publications Office of the European Union (2026)](#ref-POEU2026a)). Each dataset comes with its distributions, the forms in which it is available, each with its format, its licence and its access and download addresses. The catalogues of INSPIRE reach it through GeoDCAT-AP, which carries the metadata of INSPIRE into the DCAT application profile of European data portals ([European Commission (2026)](#ref-EC2026a); [SEMIC (2026)](#ref-SEM2026a)).

## How Find Datasets Searches data.europa.eu

The Find Datasets tab of the INSPIRE Data panel sends one request to the search API: every word of the Theme and the word inspire, joined by AND, the country facet set to the Country, and as many results as Datasets asks for, the most relevant first ([Publications Office of the European Union (2026)](#ref-POEU2026a)). It reads the answer, a JSON document, with DuckDB's JSON functions into the table `datasets`, one row per dataset with its title in English when the portal has one ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). The search matches the words in the datasets' metadata in the languages the portal holds, so a dataset may be found by a translation of its title.

## How Find Datasets Tells the Kinds of Service Apart

The table `services` of the Find Datasets tab holds, for each dataset, the distributions it can read, each with its kind: WFS, Atom, OGC API Features or File. The tab takes the kind from the format data.europa.eu gives the distribution, and, where the format is missing or general, from the address: a WFS by its service parameter or path, an OGC API by its path, an Atom feed by the word atom or an XML address. A WFS appears once, by its address without the parameters of a request, whatever the requests its distributions list. Distributions of other kinds, such as view services, are left out.

## Catalogues and Duplicates in data.europa.eu

A dataset may reach data.europa.eu from more than one catalogue: from a national geoportal and from a national open data portal that also lists it, for instance ([Publications Office of the European Union (2026)](#ref-POEU2026a)). Find Datasets then lists it twice, under the identifier of each catalogue. Catalogues and Duplicates in the INSPIRE Data panel counts the datasets found by catalogue, and lists the titles found more than once with their catalogues.

## Countries Side by Side in the INSPIRE Data Panel

Countries Side by Side in the INSPIRE Data panel sends four searches with the words of the Theme and inspire: one with no filter, and one filtered by each format of service, WFS, Atom and OGC API Features. Each answer has a country facet with the number of datasets of each country, so four requests give the table for every country of data.europa.eu ([Publications Office of the European Union (2026)](#ref-POEU2026a)). The counts follow the formats the catalogues give their distributions: a service whose catalogue records another format is not counted under its kind.

## References

<a id="ref-EC2026a"></a>European Commission (2026). The European Commission is transitioning the INSPIRE infrastructure to EU horizontal services to ensure long-term continuity and efficiency. INSPIRE Knowledge Base. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/news-and-publications/news/european-commission-transitioning-inspire-infrastructure-eu-horizontal-services-ensure-long-term-2026-07-01_en)

<a id="ref-POEU2026a"></a>Publications Office of the European Union (2026). data.europa.eu Search API. [data.europa.eu/api/hub/search](https://data.europa.eu/api/hub/search/)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-SEM2026a"></a>SEMIC (2026). GeoDCAT-AP 3.1.0. [semiceu.github.io/GeoDCAT-AP/releases/3.1.0](https://semiceu.github.io/GeoDCAT-AP/releases/3.1.0/)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
