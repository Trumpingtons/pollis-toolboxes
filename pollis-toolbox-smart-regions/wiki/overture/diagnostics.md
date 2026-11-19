# Diagnostics

## Releases That Expire

Overture keeps a release in its public buckets on Amazon S3 and Microsoft Azure for at most 60 days, two monthly releases, to comply with data protection regulations such as the right to be forgotten of the GDPR ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A release named in the Release input of the Overture Maps Data panel that has expired has no catalogue and no files. Release and Files lists the releases Overture's catalogue still has; the Release input set to latest always reads the newest. To keep the features of a release, save them with Save as GeoParquet.

## Schema Versions

Overture tags each release with its date, yyyy-mm-dd.x, and with the version of its schema ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Minor schema changes, such as new columns or new values of a class, may come in any month; major changes, such as removed columns or changed data types, only in March, June, September and December. Code written for one schema version may fail on a release with a new major version: in September 2026, for instance, the categories column of places was removed in favour of taxonomy and basic_category. Release and Files gives the schema version of the release read.

## Columns Without Values

Column Completeness in the Overture Maps Data panel gives, for each column of the features read, the share of features that have a value. Many columns are optional, and Gabrielli, Sulis, Thabit and Minghini found low and spatially uneven completeness of height, floors and other building attributes in OpenStreetMap and Overture Maps across the European Union ([Gabrielli, Sulis, Thabit and Minghini (2026)](#ref-GSTM2026a)). A measure computed from a column that few features have, such as the median height of buildings, describes those features, not the area.

## Places That May Not Exist

Overture gives each place a confidence between 0 and 1, the likelihood that the place exists: 0 means Overture is certain it does not, and a missing value means no information ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Overture states that the places theme is known to contain duplicates, a high rate of junk records and low completeness of properties; confidence is the main tool to filter junk, and does not address duplicates. Confidence is not calibrated to be comparable across providers, so it serves as a relative threshold. Confidence Check shows how the places of an area spread over confidence, and the Minimum Confidence input leaves out those under a threshold.

## Features Cut by the Area

The Overture Maps Data panel keeps every feature whose geometry meets the area, whole, so buildings, segments and divisions that cross its edge extend beyond it. Counts and totals of the Next Steps include those features whole; Building Measures and Division Areas also give the part inside the area, and Network Measures counts only the connectors inside it. Divisions read slowly, since the polygons of a country or region overlap any area within them and are large.

## Biases in Building Data

Gevaert, Buunk and Van den Homberg audited four global building datasets, Google Open Buildings, Microsoft's building footprints, Overture Maps and OpenStreetMap, for biases in Tanzania and the Philippines ([Gevaert, Buunk and Van den Homberg (2024)](#ref-GBH2024a)). The accuracy of all four was lower than expected in those countries, and they found biases with respect to wealth, population density, urban and rural areas and building size. Sources and Licences and Sources Side by Side in the Overture Maps Data panel show which datasets the buildings of an area come from, a first step in judging whether such biases may apply.

## References

<a id="ref-GSTM2026a"></a>Gabrielli, L., Sulis, P., Thabit, S. and Minghini, M. (2026). Towards a comparison of the semantic information of pan-European open building data. *ISPRS International Journal of Geo-Information*, 15(6), 252. [doi:10.3390/ijgi15060252](https://doi.org/10.3390/ijgi15060252)

<a id="ref-GBH2024a"></a>Gevaert, C. M., Buunk, T. and Van den Homberg, M. J. C. (2024). Auditing geospatial datasets for biases: using global building datasets for disaster risk management. *IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing*, 17, 12579–12590. [doi:10.1109/JSTARS.2024.3422503](https://doi.org/10.1109/JSTARS.2024.3422503)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

## See Also
- [Themes and Types](themes-and-types.md) · [Sources and Licences](sources-and-licences.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
