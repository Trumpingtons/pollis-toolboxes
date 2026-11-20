# Diagnostics

## OpenTopography Refuses the API Key

Global DEM and USGS 3DEP stop with the message of the OpenTopography API when it refuses a request: an answer of HTTP 401 for a key it does not accept, or for a key that has reached its limit of requests, and a message saying which. The key on the Powered by line sets the key again. The 1 m rasters of the 3D Elevation Program are open to academic users only ([OpenTopography (2026)](#ref-Ope2026a)), so another key is refused for them while the 10 m and 30 m rasters still download.

## An Area Too Large for OpenTopography

OpenTopography limits each request by the size of its area ([OpenTopography (2026)](#ref-Ope2026a)). Global DEM and USGS 3DEP compute the size of the Area before the request and stop when it is larger than the limit of the model, with the size and the limit in square kilometres.

| Model | Largest area served |
|---|---|
| Most global models at 30 m | 450,000 km² |
| SRTM and Copernicus DEM at 90 m | 4,050,000 km² |
| SRTM15+ and GEBCO | 125,000,000 km² |
| USGS 3DEP at 30 m, 10 m, 1 m | 225,000 km², 25,000 km², 250 km² |

## USGS 3DEP Returns No Data

The 3D Elevation Program covers the United States ([Sugarbaker and 6 coauthors (2014)](#ref-SCHJL...2014a)). For an Area outside it, the API answers with no content, and USGS 3DEP stops with a message that says so. An Area that crosses a border or a coast returns the part with data, and Cells Without Data shows how much of the Area has none and where.

## Cells Without Data in the Elevation

Cells Without Data counts the cells of the elevation that have no value, gives the longitudes and latitudes between which they lie, and sets the extent of the grid beside the Area. A global model may leave cells without data where its sources had gaps, such as the voids of the original SRTM data, which NASADEM reduces ([Crippen and 14 coauthors (2016)](#ref-CBABG...2016a)). Two Models Side by Side and the summaries of the Interpret group use only the cells that have a value.

## References

<a id="ref-CBABG...2016a"></a>Crippen, R., Buckley, S., Agram, P., Belz, E., Gurrola, E., Hensley, S., Kobrick, M., Lavalle, M., Martin, J., Neumann, M., Nguyen, Q., Rosen, P., Shimada, J., Simard, M. and Tung, W. (2016). NASADEM Global Elevation Model: Methods and Progress. *International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences*, XLI-B4, 125–128. [doi:10.5194/isprsarchives-XLI-B4-125-2016](https://doi.org/10.5194/isprsarchives-XLI-B4-125-2016)

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

<a id="ref-SCHJL...2014a"></a>Sugarbaker, L. J., Constance, E. W., Heidemann, H. K., Jason, A. L., Lukas, V., Saghy, D. L. and Stoker, J. M. (2014). The 3D Elevation Program initiative: A call for action. [doi:10.3133/cir1399](https://doi.org/10.3133/cir1399)

## See Also
- [Authentication](authentication.md) · [The Global Elevation Models](global-dems.md) · [USGS 3D Elevation Program](usgs-3dep.md) · [Factsheet](factsheet.md)
