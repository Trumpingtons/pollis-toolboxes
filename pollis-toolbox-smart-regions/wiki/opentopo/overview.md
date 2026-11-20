# Overview

## OpenTopography and Its API

OpenTopography is a facility funded by the National Science Foundation and hosted at the San Diego Supercomputer Center, which gives online access to high-resolution lidar topography, standard digital elevation models and tools to process them, built as a services oriented architecture ([Krishnan and 6 coauthors (2011)](#ref-KCNPC...2011a)). Its API offers part of this to programs: the global elevation models it serves, cut to a bounding box; the rasters of the 3D Elevation Program of the U.S. Geological Survey; a catalogue of the point cloud and raster datasets over an area; and the elevation at a point ([OpenTopography (2026)](#ref-Ope2026a)). The OpenTopography panel uses the first three.

## Elevation Models, Surface Models and Terrain Models

A digital elevation model is a grid of heights over an area. A digital surface model gives the height of the surface the instrument sees, with buildings, infrastructure and vegetation: the Copernicus DEM is one ([European Space Agency and Airbus (2022)](#ref-ESAA2022a)). A digital terrain model gives the height of the bare ground beneath them, which GEDTM30 and the EU DTM estimate by combining surface models with lidar measurements of the ground from the GEDI and ICESat-2 missions ([Ho and 6 coauthors (2025)](#ref-HGLRP...2025a); [Hengl, Parente, Križan and Bonannella (2020)](#ref-HPKB2020a)). Which kind a study needs depends on whether buildings and trees belong to the height being studied.

## What the OpenTopography Panel Does

The OpenTopography panel has three tabs. Find Datasets searches the catalogue of OpenTopography for the point cloud and raster datasets over the Area, with or without those of other catalogues, and lists them with their sources, dates and the share of the Area each covers. Global DEM downloads the elevation of the Area from the Elevation Model chosen, anywhere on Earth. USGS 3DEP downloads the elevation of an Area of the United States from the 3D Elevation Program at the Resolution chosen. The Next Steps map, check, compare, summarise and save the results.

## The Terms of Use of OpenTopography Data

OpenTopography asks for an API key for every download of its API, which a user requests through myOpenTopo on its portal, and refers to its terms of use for appropriate use of the data ([OpenTopography (2026)](#ref-Ope2026a)). Each dataset of its catalogue carries its own citation, a digital object identifier for the datasets OpenTopography hosts, which Find Datasets keeps in the column `doi`. The Authentication page describes how the OpenTopography panel uses the key.

## References

<a id="ref-ESAA2022a"></a>European Space Agency and Airbus (2022). Copernicus DEM. [doi:10.5270/ESA-c5d3d65](https://doi.org/10.5270/ESA-c5d3d65)

<a id="ref-HPKB2020a"></a>Hengl, T., Parente, L., Križan, J. and Bonannella, C. (2020). Continental Europe Digital Terrain Model at 30 m resolution based on GEDI, ICESat-2, AW3D, GLO-30, EUDEM, MERIT DEM and background layers. [doi:10.5281/zenodo.4056634](https://doi.org/10.5281/zenodo.4056634)

<a id="ref-HGLRP...2025a"></a>Ho, Y.-F., Grohmann, C. H., Lindsay, J., Reuter, H. I., Parente, L., Witjes, M. and Hengl, T. (2025). GEDTM30: global ensemble digital terrain model at 30 m and derived multiscale terrain variables. *PeerJ*, 13, e19673. [doi:10.7717/peerj.19673](https://doi.org/10.7717/peerj.19673)

<a id="ref-KCNPC...2011a"></a>Krishnan, S., Crosby, C., Nandigam, V., Phan, M., Cowart, C., Baru, C. and Arrowsmith, R. (2011). OpenTopography: a services oriented architecture for community access to LIDAR topography. *Proceedings of the 2nd International Conference on Computing for Geospatial Research and Applications (COM.Geo '11)*, 1–8. [doi:10.1145/1999320.1999327](https://doi.org/10.1145/1999320.1999327)

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

## See Also
- [Factsheet](factsheet.md) · [Authentication](authentication.md) · [The OpenTopography Catalogue](catalogue.md) · [The Global Elevation Models](global-dems.md) · [USGS 3D Elevation Program](usgs-3dep.md)
