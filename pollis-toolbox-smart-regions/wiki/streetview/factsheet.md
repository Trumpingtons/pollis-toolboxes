# Mapillary Street-Level Viewer — Factsheet

The **Mapillary Street-Level Viewer** panel of the Smart Regions Toolbox finds a street-level image of Mapillary near a point, or one given by its id, and opens it in an interactive viewer in the plot pane of the Julia REPL or in a notebook output. The viewer is MapillaryJS, the library Mapillary publishes for showing street imagery on the web, which renders the images with WebGL ([Mapillary (2023)](#ref-Map2023a)); beside it, Map and Viewer draws a map of Mapillary's coverage with MapLibre GL JS ([MapLibre Contributors (2026)](#ref-MLC2026a)).

| Item | Mapillary Street-Level Viewer panel |
|---|---|
| **Purpose** | See a place as it looks from the street, look around it, and walk the streets near it |
| **Input** | A point (longitude and latitude) and a Search Radius, or the id or link of an image |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | Nearest Image, Image by ID, Nearest Panorama, Map and Viewer |
| **Service** | The image search and image entities of the Mapillary API, its computed coverage tiles, and its images, which the viewer loads |
| **Output** | The table `images`, and a street-level viewer, alone or beside a coverage map |
| **Key choices** | The point, the Search Radius, and the nearest or the newest image |

## What Each Tab of the Mapillary Street-Level Viewer Opens

| Tab | Looks for | Opens |
|---|---|---|
| Nearest Image | Every image within the Search Radius of the point | The nearest or the newest of them |
| Image by ID | The image of an id or of a link of mapillary.com | That image |
| Nearest Panorama | The panoramas within the Search Radius | The nearest or the newest panorama |
| Map and Viewer | Every image within the Search Radius | The nearest or the newest, beside a map of the coverage |

Every tab keeps what it found in the table `images` of an in-memory DuckDB database, one row per image, which the Next Steps read; the variable `image` holds the id of the image the viewer opened. With Image ID or Link set to nearest, Image by ID looks for the images within the Search Radius as Nearest Image does, and prints the id of the nearest.

## Pollis.streetview

`Pollis.streetview(image, layers...; token, map, style, center, zoom, title)` shows the image whose id is `image` in the street-level viewer of the plot pane or of a notebook output. `token` is the Mapillary access token, by default the variable `MAPILLARY_ACCESS_TOKEN` of the Julia session. With `map = true`, a map of the coverage stands to the right of the viewer; `layers`, `style`, `center` and `zoom` are those of `Pollis.webmap`, and the zoom is 17 unless given. `title` is shown over the map, or over the viewer when it stands alone. The id and the token go into the output, which the page of the plot pane or of the notebook reads to ask Mapillary for the images.

## Next Steps That Show and Check a Mapillary Image

| Group | Action | What it shows |
|---|---|---|
| Visualise | Viewer and Map | The image beside the coverage map, kept in step |
| Visualise | Images Around the Point | The images found, by year, and the point, on a map |
| Visualise | Look at the Image | The thumbnail with its date, heading and creator, on a page |
| Diagnose | Image Details | Every field of the image, and how far its computed position lies from its camera's |
| Diagnose | Images by Distance | How many images, and panoramas, lie within each 10 m of the point |
| Compare | Oldest and Newest | The first and the last image within the Search Radius, each in a viewer |
| Compare | Panoramas and Others | The panoramas beside the other images: counts, nearest and dates |

The Visualise and Diagnose steps look at the image opened and at the table `images`; the Compare steps need more than one image within the Search Radius.

## Next Steps That Interpret and Save a Mapillary Image

| Group | Action | What it shows |
|---|---|---|
| Interpret | Is the Point in View? | The direction from the image to the point, beside the direction the camera faced |
| Interpret | Coverage by Year | The images within the Search Radius by year: images, sequences and panoramas |
| Export | Save the Image | The image, 2048 pixels wide, as a JPEG file |
| Export | Save as GeoParquet | The table `images`, with its computed positions |
| Export | Open on Mapillary | The link of the image on mapillary.com, opened in Pollis's browser |

The files go into the folder mapillary inside the Folder of the panel, named by the id of the image.

## References

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

## See Also
- [Overview](overview.md) · [Using the Viewer](viewer.md) · [Finding an Image](finding-an-image.md) · [Access Token](access-token.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
