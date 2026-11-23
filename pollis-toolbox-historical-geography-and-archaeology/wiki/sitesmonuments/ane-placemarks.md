# Sites and Monuments — Ancient Near East Placemarks

## What Are the Ancient Near East Site Placemarks?

The Ancient Near East site placemarks, the file `ANE.kmz`, are a set of placemarks for Google Earth of a selection of the most important archaeological sites in the Ancient Near East, by Olof Pedersen ([Pedersen (2007)](#ref-Ped2007a)). Opened in Google Earth Pro, the file lists the ancient sites alphabetically and marks them on the satellite images, where most of them have been identified. Its description counts some 2,500 sites with modern names, some 400 of which also have ancient names. Its development started in 2007, with support from Uppsala University, the Urban Mind Project at Mistra and the Excellence Cluster Topoi at Freie Universität Berlin, and the file is archived on Zenodo.

## How Are the Names of the Ancient Near East Placemarks Written?

The Ancient Near East site placemarks write ancient names without parentheses and modern names within them ([Pedersen (2007)](#ref-Ped2007a)). A name such as Nagar (Tell Brak) gives the ancient name and the modern one; a name in parentheses alone, such as a tell known only by its modern name, gives the modern name. A question mark marks an uncertain identification, and a slash separates two ancient names of the same site. The Ancient Near East tab of Sites and Monuments gives a site the kind ancient name when its name does not start with a parenthesis, and modern name only when it does. Name Contains finds sites by any part of either name, such as Tell, Tepe or Hüyük.

## What Do the Folders of the Ancient Near East Placemarks Hold?

The KML file of the Ancient Near East site placemarks holds three folders, which the Ancient Near East tab of Sites and Monuments reads as layers ([Pedersen (2007)](#ref-Ped2007a)). Sites holds the named sites, as points. No names holds sites without a name, as points, each labelled with a code of its region, such as NSYR or SIRAQ; the tab gives them the kind no name. Extensions holds the outlines of some of the largest sites, such as Babylon and Aššur, as polygons; the tab gives them the kind outline, and places them by the centre of the outline. The placemarks carry names and positions only, without kinds of site or years.

## How Does Sites and Monuments Read the Ancient Near East Placemarks?

The first run of the Ancient Near East tab of Sites and Monuments downloads `ANE.kmz` from Zenodo into the Folder, and later runs read it from there. DuckDB's spatial extension reads the three folders of the KML file inside the KMZ file through GDAL, without unpacking it, and joins them into the table of sites, keeping those whose point, or the centre of whose outline, lies in the Box ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The heights of the placemarks, all at the ground, are dropped. Save as KML writes the sites back to a KML file that Google Earth and Google My Maps read ([Google (2026h)](#ref-Goo2026h); [Google (2026i)](#ref-Goo2026i)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Goo2026h"></a>Google (2026h). Import Map Features from a File. My Maps Help. [support.google.com/mymaps/answer/3024836](https://support.google.com/mymaps/answer/3024836)

<a id="ref-Goo2026i"></a>Google (2026i). Import Data into Google Earth. Google Earth Help. [support.google.com/earth/answer/7365595](https://support.google.com/earth/answer/7365595)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Pleiades](pleiades.md)
