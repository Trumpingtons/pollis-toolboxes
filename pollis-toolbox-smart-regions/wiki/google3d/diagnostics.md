# Diagnostics

## The Code of Google Photorealistic 3D Maps Stops at Once

The Example Code of Google Photorealistic 3D Maps reads the Maps Demo Key from the variable `GOOGLE_MAPS_API_KEY` of the Julia session and stops with a message when there is none. The panel shares the key with Google Maps: once it is set with the key on the Powered by line of either panel, both find it in the Julia REPL that Pollis starts. Code sent to an editor or a notebook runs in a session that may lack the variable, which then has to be set there by hand. A Next Step needs the Example Code of its own tab to have run: Orbit the Place uses `map3d` and `shapes`, Tallest Buildings the table `buildings`, Places by Category the tables `places3d` and `cells`, and Flights Drawn the table `flights`.

## The 3D Map Stays Blank or Says the Key Was Refused

When the 3D map cannot start, the element `gmp-map-3d` fires the event `gmp-error`, and the pages of the panel answer it by replacing the title over the map with a message ([Google (2026b)](#ref-Goo2026b)). A refused key is the most common cause: it is worth comparing with the key the Google Cloud console shows for the Maps Demo Project ([Google (2026c)](#ref-Goo2026c)). The Maps Demo Key also stops for the rest of the day once its daily limit is reached, and each page of the panel counts as one map load, however many shapes it draws ([Google (2026g)](#ref-Goo2026g)). Running the tab again after setting the key writes a new page with the new key.

## A 3D Map Without Buildings

The SATELLITE and HYBRID modes of the 3D map show photorealistic imagery where it is available ([Google (2026b)](#ref-Goo2026b)). In a place without it, 3D View shows flatter imagery, and the buildings do not stand up. A very large Range looks down from far away, where buildings are too small to see, and a Tilt near 0 looks straight down, where their heights do not show. A Range of one or two kilometres and a Tilt of about 60 degrees show the buildings of a city centre. Orbit the Place starts only once the map has loaded enough to animate, so the camera may wait a moment before it turns.

## Your Features, Values as Columns or Routes at Height Read No Data

Your Features and Values as Columns read Overture Maps over HTTPS with DuckDB's extension `httpfs`, which the Smart Regions Toolbox installs; without a connection to the internet they stop when they ask Overture's catalogue for its newest release ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A Radius (m) around a place that Overture covers poorly finds few features, and buildings without a height or floors are not drawn. Routes at Height stops when no aircraft flies above 1,000 m over the box, when the OpenSky Network has no track of those nearest, or when the anonymous credits of the day are spent, which the API reports with HTTP 429 ([The OpenSky Network (2026)](#ref-OSN2026a)). A wider Box Side, another time of day or a place near a large airport finds more aircraft.

## Shapes That Do Not Show on the 3D Map

The page reads the features as GeoJSON, whose coordinates are longitude and latitude on WGS 84, in that order, with an optional third coordinate for the altitude ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). A table of your own in a projected system, in metres, puts its shapes far from the place; `ST_Transform` of DuckDB's spatial extension moves them into longitude and latitude first ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). In Your Features, a polygon whose height column is missing or zero lies flat on the ground and may hide under Google's buildings. In Routes at Height, a line without altitudes is drawn at sea level, below the ground of most places.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON Format. RFC 7946. [doi.org/10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [3D Maps and the Camera](camera.md) · [3D Features](features3d.md) · [Factsheet](factsheet.md)
