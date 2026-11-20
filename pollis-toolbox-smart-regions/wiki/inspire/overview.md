# Overview

## What INSPIRE Is

Directive 2007/2/EC establishes INSPIRE, an Infrastructure for Spatial Information in the European Community, for the purposes of the Community's environmental policies and of policies or activities that may have an impact on the environment ([European Parliament and Council of the European Union (2007)](#ref-EPCEU2007a)). It covers the spatial data sets held by public authorities in the themes of its three annexes: administrative units are a theme of Annex I, and statistical units a theme of Annex III. The member states describe those data sets with metadata, make them interoperable by common specifications, and make them available through network services, so that public authorities can share them and the public can find and use them.

## The Network Services of INSPIRE

The INSPIRE Directive asks the member states for a network of services: discovery services, to search for data sets and services by their metadata; view services, to display them; download services, to download copies of data sets or parts of them; and transformation services ([European Parliament and Council of the European Union (2007)](#ref-EPCEU2007a)). Regulation (EC) No 976/2009 sets the rules of these services, among them the operations of a download service: getting a pre-defined data set, and, for direct access, getting the spatial objects that a query selects ([European Commission (2009)](#ref-EC2009a)). The WFS Download, Atom Download and OGC API Features tabs of the INSPIRE Data panel read from download services.

## data.europa.eu as the European Entry Point

The European Commission decommissioned the INSPIRE Geoportal by 1 July 2026: the European Data Portal, data.europa.eu, became the European entry point for geospatial datasets, and the existing metadata and catalogue services are integrated into its ecosystem through GeoDCAT-AP ([European Commission (2026)](#ref-EC2026a)). GeoDCAT-AP extends the DCAT application profile for data portals in Europe with the metadata elements of the core profile of ISO 19115:2003 and those defined in the framework of the INSPIRE Directive ([SEMIC (2026)](#ref-SEM2026a)). The Find Datasets tab of the INSPIRE Data panel searches data.europa.eu with its search API ([Publications Office of the European Union (2026)](#ref-POEU2026a)).

## Administrative Units as High-Value Datasets

Commission Implementing Regulation (EU) 2023/138 lists administrative units among the high-value geospatial datasets, with geographical names, addresses, buildings, cadastral parcels, reference parcels and agricultural parcels ([European Commission (2023)](#ref-EC2023b)). Their granularity reaches the scale of 1:5,000, from the municipalities to the country, and they are made available under the Creative Commons BY 4.0 licence or an equivalent or less restrictive open licence, through application programming interfaces and as bulk downloads. The WFS Download and OGC API Features tabs of the INSPIRE Data panel read such interfaces; the Atom Download tab reads bulk downloads.

## INSPIRE Data and Eurostat GISCO

GISCO, the Geographic Information System of the Commission, distributes the boundaries of the NUTS regions and of the local administrative units for the whole of Europe, in one set of files ([Eurostat (2026)](#ref-Eur2026a)). The INSPIRE datasets of administrative units are each country's own, from its national or regional authorities, in that country's levels and at the scale it publishes. Beside GISCO's Units in the INSPIRE Data panel sets the units of one level of an INSPIRE dataset beside GISCO's local administrative units of the same country, as the Eurostat GISCO panel reads them.

## References

<a id="ref-EC2009a"></a>European Commission (2009). Commission Regulation (EC) No 976/2009 of 19 October 2009 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards the Network Services. *Official Journal of the European Union*, L 274, 9–18. [eur-lex.europa.eu/eli/reg/2009/976/oj](https://eur-lex.europa.eu/eli/reg/2009/976/oj)

<a id="ref-EC2023b"></a>European Commission (2023). Commission Implementing Regulation (EU) 2023/138 of 21 December 2022 laying down a list of specific high-value datasets and the arrangements for their publication and re-use. *Official Journal of the European Union*, L 19, 43–75. [eur-lex.europa.eu/eli/reg_impl/2023/138/oj](https://eur-lex.europa.eu/eli/reg_impl/2023/138/oj)

<a id="ref-EC2026a"></a>European Commission (2026). The European Commission is transitioning the INSPIRE infrastructure to EU horizontal services to ensure long-term continuity and efficiency. INSPIRE Knowledge Base. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/news-and-publications/news/european-commission-transitioning-inspire-infrastructure-eu-horizontal-services-ensure-long-term-2026-07-01_en)

<a id="ref-EPCEU2007a"></a>European Parliament and Council of the European Union (2007). Directive 2007/2/EC of the European Parliament and of the Council of 14 March 2007 establishing an Infrastructure for Spatial Information in the European Community (INSPIRE). *Official Journal of the European Union*, L 108, 1–14. [eur-lex.europa.eu/eli/dir/2007/2/oj](https://eur-lex.europa.eu/eli/dir/2007/2/oj)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-POEU2026a"></a>Publications Office of the European Union (2026). data.europa.eu Search API. [data.europa.eu/api/hub/search](https://data.europa.eu/api/hub/search/)

<a id="ref-SEM2026a"></a>SEMIC (2026). GeoDCAT-AP 3.1.0. [semiceu.github.io/GeoDCAT-AP/releases/3.1.0](https://semiceu.github.io/GeoDCAT-AP/releases/3.1.0/)

## See Also
- [Factsheet](factsheet.md) · [Searching data.europa.eu](data-europa-search.md) · [Administrative and Statistical Units](units-themes.md) · [Decision Guide](decision-guide.md)
