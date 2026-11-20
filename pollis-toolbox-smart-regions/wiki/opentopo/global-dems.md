# The Global Elevation Models

## The Copernicus DEM

The Copernicus DEM is a digital surface model, representing the surface of the Earth with its buildings, infrastructure and vegetation, provided as GLO-30 at 30 m and GLO-90 at 90 m, among others ([European Space Agency and Airbus (2022)](#ref-ESAA2022a)). It derives from the global digital elevation model of the TanDEM-X mission, whose two twin radar satellites, TerraSAR-X and TanDEM-X, flew in close formation as an X-band single-pass interferometer and acquired all land surfaces at least twice between December 2010 and early 2015 ([Rizzoli and 13 coauthors (2017)](#ref-RMGWB...2017a)). Global DEM offers it as Copernicus DEM, 30 m, the default, and Copernicus DEM, 90 m.

## SRTM and NASADEM

The Shuttle Radar Topography Mission flew in February 2000 and produced a digital elevation model at 1 arc-second, about 30 m, from interferometric radar data acquired with two antennas ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)), for the land between 60 degrees north and 56 degrees south ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)). Global DEM offers it at 30 m and 90 m. NASADEM reprocesses the SRTM radar data completely, with better vertical control of each swath by reference to ICESat elevations and fewer voids from advanced interferometric unwrapping, and fills the voids that remain mainly with ASTER GDEM elevations ([Crippen and 14 coauthors (2016)](#ref-CBABG...2016a)).

## ALOS World 3D

The Japan Aerospace Exploration Agency generated a global digital surface model from the archive of the Panchromatic Remote-sensing Instrument for Stereo Mapping (PRISM) of the Advanced Land Observing Satellite, operated from 2006 to 2011, whose three panchromatic radiometers acquired along-track stereo images at 2.5 m ([Tadono, Ishida, Oda, Naito, Minakawa and Iwamoto (2014)](#ref-TIONM...2014a)). Global DEM offers its version at 30 m as ALOS World 3D, 30 m.

## GEDTM30 and the EU DTM

GEDTM30 is a global digital terrain model at 1 arc-second, which combines the Copernicus DEM, ALOS World 3D and models of the height of objects, and is fitted to over 30 billion lidar measurements of the ground from ICESat-2 and GEDI, by a global model refined in tiles of 5 by 5 degrees ([Ho and 6 coauthors (2025)](#ref-HGLRP...2025a)). The EU DTM is a terrain model of continental Europe at 30 m, predicted by ensemble machine learning from surface models, canopy height, tree cover and surface water, trained on GEDI and ICESat-2 points ([Hengl, Parente, Križan and Bonannella (2020)](#ref-HPKB2020a)). Both estimate the bare ground beneath buildings and trees.

## SRTM15+ and GEBCO

SRTM15+ is a global grid of bathymetry and topography at 15 arc-seconds, about 500 m: its ocean depths combine shipboard soundings with depths predicted from satellite altimetry, and its land heights come from published elevation models, mainly SRTM between 60 degrees north and 60 degrees south ([Tozer, Sandwell, Smith, Olson, Beale and Wessel (2019)](#ref-TSSOB...2019a)). GEBCO publishes a global grid of ocean depths and land heights, whose mapping of the sea floor the Nippon Foundation-GEBCO Seabed 2030 Project aims to complete ([Mayer and 8 coauthors (2018)](#ref-MJADF...2018a)). Global DEM offers both, with the largest areas OpenTopography serves ([OpenTopography (2026)](#ref-Ope2026a)).

## References

<a id="ref-CBABG...2016a"></a>Crippen, R., Buckley, S., Agram, P., Belz, E., Gurrola, E., Hensley, S., Kobrick, M., Lavalle, M., Martin, J., Neumann, M., Nguyen, Q., Rosen, P., Shimada, J., Simard, M. and Tung, W. (2016). NASADEM Global Elevation Model: Methods and Progress. *International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences*, XLI-B4, 125–128. [doi:10.5194/isprsarchives-XLI-B4-125-2016](https://doi.org/10.5194/isprsarchives-XLI-B4-125-2016)

<a id="ref-EROSC2017a"></a>Earth Resources Observation and Science (EROS) Center (2017). Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global. [doi:10.5066/F7PR7TFT](https://doi.org/10.5066/F7PR7TFT)

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
- [Decision Guide](decision-guide.md) · [USGS 3D Elevation Program](usgs-3dep.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
