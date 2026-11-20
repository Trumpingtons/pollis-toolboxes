# Decision Guide

## Which Tab of the OpenTopography Panel

| Need | Tab |
|---|---|
| What lidar surveys and elevation models cover an area, and when they were made | Find Datasets |
| The elevation of an area anywhere on Earth | Global DEM |
| Finer elevation of an area of the United States | USGS 3DEP |

Find Datasets needs no key, so it is the place to see what covers an area before downloading. Its table `datasets` gives each OpenTopography model its short name, such as COP30, which is the code of the Elevation Model of Global DEM.

## Which Global Elevation Model to Download

| Elevation Model | Kind | What it comes from |
|---|---|---|
| Copernicus DEM, 30 m and 90 m | Surface | The TanDEM-X radar mission ([European Space Agency and Airbus (2022)](#ref-ESAA2022a); [Rizzoli and 13 coauthors (2017)](#ref-RMGWB...2017a)) |
| SRTM, 30 m and 90 m | Surface | The Shuttle Radar Topography Mission of February 2000 ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)) |
| NASADEM, 30 m | Surface | The SRTM data reprocessed ([Crippen and 14 coauthors (2016)](#ref-CBABG...2016a)) |
| ALOS World 3D, 30 m | Surface | Optical stereo images of ALOS PRISM ([Tadono, Ishida, Oda, Naito, Minakawa and Iwamoto (2014)](#ref-TIONM...2014a)) |
| GEDTM30, 30 m | Terrain | Surface models and spaceborne lidar combined ([Ho and 6 coauthors (2025)](#ref-HGLRP...2025a)) |
| EU DTM, 30 m | Terrain | The same approach, for continental Europe ([Hengl, Parente, Križan and Bonannella (2020)](#ref-HPKB2020a)) |
| SRTM15+ and GEBCO, 500 m | Land and sea floor | Land models with ocean depths ([Tozer, Sandwell, Smith, Olson, Beale and Wessel (2019)](#ref-TSSOB...2019a); [Mayer and 8 coauthors (2018)](#ref-MJADF...2018a)) |

The Global Elevation Models page describes each.

## Which Resolution of USGS 3DEP to Download

USGS 3DEP offers the elevation at 1 arc-second (about 30 m), 1/3 arc-second (about 10 m) and 1 m ([OpenTopography (2026)](#ref-Ope2026a)). The finer the resolution, the smaller the area OpenTopography serves in one request: 225,000 km² at 30 m, 25,000 km² at 10 m and 250 km² at 1 m, so a city fits at 10 m and a neighbourhood at 1 m. The 1 m rasters, made from lidar, are open to academic users only.

## Which Model to Compare With

Two Models Side by Side sets the elevation downloaded beside a global model at 30 m chosen in Compare With. Comparing a surface model with a terrain model, such as the Copernicus DEM with GEDTM30, shows where buildings and trees raise the surface above the ground, which a terrain model removes ([Ho and 6 coauthors (2025)](#ref-HGLRP...2025a)). Comparing two surface models, such as the Copernicus DEM with SRTM, shows how the two missions differ over the area. Comparing USGS 3DEP with a global model shows the global model's differences from a lidar elevation where 3DEP has one.

## References

<a id="ref-CBABG...2016a"></a>Crippen, R., Buckley, S., Agram, P., Belz, E., Gurrola, E., Hensley, S., Kobrick, M., Lavalle, M., Martin, J., Neumann, M., Nguyen, Q., Rosen, P., Shimada, J., Simard, M. and Tung, W. (2016). NASADEM Global Elevation Model: Methods and Progress. *International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences*, XLI-B4, 125–128. [doi:10.5194/isprsarchives-XLI-B4-125-2016](https://doi.org/10.5194/isprsarchives-XLI-B4-125-2016)

<a id="ref-ESAA2022a"></a>European Space Agency and Airbus (2022). Copernicus DEM. [doi:10.5270/ESA-c5d3d65](https://doi.org/10.5270/ESA-c5d3d65)

<a id="ref-FRCCD...2007a"></a>Farr, T. G., Rosen, P. A., Caro, E., Crippen, R., Duren, R., Hensley, S., Kobrick, M., Paller, M., Rodriguez, E., Roth, L., Seal, D., Shaffer, S., Shimada, J., Umland, J., Werner, M., Oskin, M., Burbank, D. and Alsdorf, D. (2007). The Shuttle Radar Topography Mission. *Reviews of Geophysics*, 45(2). [doi:10.1029/2005RG000183](https://doi.org/10.1029/2005RG000183)

<a id="ref-HPKB2020a"></a>Hengl, T., Parente, L., Križan, J. and Bonannella, C. (2020). Continental Europe Digital Terrain Model at 30 m resolution based on GEDI, ICESat-2, AW3D, GLO-30, EUDEM, MERIT DEM and background layers. [doi:10.5281/zenodo.4056634](https://doi.org/10.5281/zenodo.4056634)

<a id="ref-HGLRP...2025a"></a>Ho, Y.-F., Grohmann, C. H., Lindsay, J., Reuter, H. I., Parente, L., Witjes, M. and Hengl, T. (2025). GEDTM30: global ensemble digital terrain model at 30 m and derived multiscale terrain variables. *PeerJ*, 13, e19673. [doi:10.7717/peerj.19673](https://doi.org/10.7717/peerj.19673)

<a id="ref-MJADF...2018a"></a>Mayer, L., Jakobsson, M., Allen, G., Dorschel, B., Falconer, R., Ferrini, V., Lamarche, G., Snaith, H. and Weatherall, P. (2018). The Nippon Foundation—GEBCO Seabed 2030 Project: The Quest to See the World’s Oceans Completely Mapped by 2030. *Geosciences*, 8(2), 63. [doi:10.3390/geosciences8020063](https://doi.org/10.3390/geosciences8020063)

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

<a id="ref-RMGWB...2017a"></a>Rizzoli, P., Martone, M., Gonzalez, C., Wecklich, C., Borla Tridon, D., Bräutigam, B., Bachmann, M., Schulze, D., Fritz, T., Huber, M., Wessel, B., Krieger, G., Zink, M. and Moreira, A. (2017). Generation and performance assessment of the global TanDEM-X digital elevation model. *ISPRS Journal of Photogrammetry and Remote Sensing*, 132, 119–139. [doi:10.1016/j.isprsjprs.2017.08.008](https://doi.org/10.1016/j.isprsjprs.2017.08.008)

<a id="ref-TIONM...2014a"></a>Tadono, T., Ishida, H., Oda, F., Naito, S., Minakawa, K. and Iwamoto, H. (2014). Precise Global DEM Generation by ALOS PRISM. *ISPRS Annals of the Photogrammetry, Remote Sensing and Spatial Information Sciences*, II-4, 71–76. [doi:10.5194/isprsannals-II-4-71-2014](https://doi.org/10.5194/isprsannals-II-4-71-2014)

<a id="ref-TSSOB...2019a"></a>Tozer, B., Sandwell, D. T., Smith, W. H. F., Olson, C., Beale, J. R. and Wessel, P. (2019). Global Bathymetry and Topography at 15 Arc Sec: SRTM15+. *Earth and Space Science*, 6(10), 1847–1864. [doi:10.1029/2019EA000658](https://doi.org/10.1029/2019EA000658)

## See Also
- [Overview](overview.md) · [The Global Elevation Models](global-dems.md) · [USGS 3D Elevation Program](usgs-3dep.md) · [Factsheet](factsheet.md)
