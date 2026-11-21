# Diagnostics

## The Code Stops Before Opening a Map

The Example Code of the Google Maps panel stops at once, with a message asking for the key, when the Julia session has no variable `GOOGLE_MAPS_API_KEY`. The key on the Powered by line sets it in the Julia REPL that Pollis starts; code sent to an editor or a notebook runs in a session that may not have it, and needs `ENV["GOOGLE_MAPS_API_KEY"]` set there first. A Next Step run before the Example Code of its tab stops too, since it uses the variables and functions that code defines, such as `map2d`, `places` and `maptype`.

## Google Refuses the Maps Demo Key

When the Maps JavaScript API cannot authenticate a key, it calls a global function `gm_authFailure` of the page, if there is one ([Google (2026a)](#ref-Goo2026a)). The pages of the Google Maps panel define it to replace the title over the map with a message saying that Google refused the key. With a refused key, Google also says over the map that the page did not load Google Maps correctly. The first thing to check is the key itself, against the one the Google Cloud console shows for the Maps Demo Project ([Google (2026c)](#ref-Goo2026c)); Google may also suspend or end access to a Maps Demo Project at any time ([Google (2026f)](#ref-Goo2026f)). Setting the key again with the key on the Powered by line, and running the tab again, writes a new page with the new key.

## The Maps Stop for the Rest of the Day

A Maps Demo Key has a daily limit of 100 calls per API, according to Google's page on AI Studio ([Google (2026d)](#ref-Goo2026d)). When it is reached, Google pauses the key's usage until the following day, without charges ([Google (2026c)](#ref-Goo2026c)), so maps that opened earlier in the day stop opening. Each map a page opens is a map load ([Google (2026g)](#ref-Goo2026g)): Every Map Type uses four, and Two Map Types Side by Side two, so repeating them uses the limit faster than the tabs alone. The Maps Demo Project Terms let Google change the limits without notice ([Google (2026f)](#ref-Goo2026f)).

## Features That Do Not Show on the Map

The Data layer reads GeoJSON, whose coordinates are longitude and latitude on WGS 84 in that order ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). A query `places` that returns coordinates in a projected system, in metres, puts its features far outside the world, and the map fits nothing; `ST_Transform` of DuckDB's spatial extension moves them into longitude and latitude first ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Latitude and longitude given the wrong way round put the features in the wrong place. A query that returns rows without a geometry gives features the map cannot draw. Layer Size prints the geometry types of the query, its vertices and the size of the GeoJSON the page would hold.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON Format. RFC 7946. [doi.org/10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026d"></a>Google (2026d). Google Maps Platform in AI Studio. [developers.google.com/maps/ai/ai-studio](https://developers.google.com/maps/ai/ai-studio)

<a id="ref-Goo2026f"></a>Google (2026f). Maps Demo Project Terms of Service. [cloud.google.com/terms/maps-platform/demo-project-terms](https://cloud.google.com/terms/maps-platform/demo-project-terms)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

## See Also
- [The Demo Key](demo-key.md) · [Map Types](map-types.md) · [Factsheet](factsheet.md)
