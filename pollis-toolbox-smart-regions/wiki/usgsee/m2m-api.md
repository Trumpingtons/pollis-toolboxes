# The M2M API

## How a Request of the M2M API Is Made

The Machine-to-Machine (M2M) API of USGS EarthExplorer takes each request as an HTTP POST of a JSON object to the address of an endpoint, and answers with a JSON object that holds the result in `data`, or an error code and message when it cannot serve the request ([U.S. Geological Survey (2026)](#ref-USGS2026a)). Every endpoint but the login needs the API key of the session in the header X-Auth-Token. The USGS EarthExplorer panel writes each answer to a temporary file, which DuckDB reads as JSON, and stops with the error code and message when the API returns one.

## The Endpoints of the M2M API the Panel Uses

| Endpoint | What it does | Tabs |
|---|---|---|
| `login-token` | Gives the API key of a session for a username and an application token | All |
| `scene-search` | Lists the scenes of a dataset that meet a filter, a page at a time | All |
| `dataset-search` | Lists the datasets whose names match, with their aliases | Elevation |
| `download-options` | Lists the files that can be downloaded for a set of scenes | Landsat Download, Elevation |
| `download-request` | Asks for files, and returns those ready and those being prepared | Landsat Download, Elevation |
| `download-retrieve` | Returns the files of a request that have become ready | Landsat Download, Elevation |
| `logout` | Ends the session and its API key | All |

The endpoints and their fields are those of the documentation of the M2M API ([U.S. Geological Survey (2026)](#ref-USGS2026a)).

## How Find Scenes Searches a Dataset of EarthExplorer

Find Scenes sends `scene-search` the name of the Dataset and a scene filter with three parts: a spatial filter, the rectangle of the Area by its lower-left and upper-right corners; an acquisition filter, the From and To dates; and a cloud cover filter, from 0 to the Most Cloud, which keeps the scenes without a cloud score. It asks for a hundred scenes at a time and follows the number of the next record until it has the Scenes asked for or the results end. DuckDB keeps one row per scene in the table `scenes`, with its outline read from the GeoJSON the API returns, and adds the share of the Area inside it.

## Why Downloads of the M2M API Can Take Minutes

Some files are prepared by the EROS Center before they can be downloaded, so `download-request` returns the files ready at once and those still being prepared ([U.S. Geological Survey (2026)](#ref-USGS2026a)). Landsat Download and Elevation give each request a label, download the files ready, and ask `download-retrieve` for the others every 15 seconds, for up to ten minutes. When some are still not ready, the tab says how many it has and stops; a later run asks only for the files that are not in the Folder yet.

## References

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Authentication](authentication.md) · [Landsat Collection 2 Level-2](landsat.md) · [SRTM Elevation](srtm.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
