# Nearest Image

## What Nearest Image Does

Nearest Image looks for the images of Mapillary within the Search Radius of a point and opens one of them in the street-level viewer of the plot pane. It asks the image search of the Mapillary API for the images in a square around the point, with their dates, cameras, compass angles and positions, and keeps those within the Search Radius in the table `images` ([Mapillary (2026)](#ref-Map2026a)). Image to Open then picks the nearest image or the newest, and `Pollis.streetview` opens it, titled with the Place Name. The line the tab prints gives the id of the image, when it was captured, how far it lies from the point and which way its camera faced.

## The Inputs of Nearest Image

| Input | What it sets |
|---|---|
| Place Name | The name in the titles of the viewer and of the Next Steps |
| Longitude, Latitude | The point, in degrees on WGS 84 |
| Search Radius (m) | How far from the point to look, from above 0 to 500 m |
| Image to Open | The Nearest, or The Newest within the radius |
| Folder | Where the Next Steps save their files, in a folder mapillary |

The point is best placed on a street or a square, where contributors capture their images.

## What Nearest Image Leaves for the Next Steps

Nearest Image leaves an in-memory DuckDB database with the table `images`, one row per image within the Search Radius, and the variable `image`, the id of the image opened ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). The Next Steps read both: Images Around the Point maps the table, Images by Distance and Coverage by Year summarise it, and Oldest and Newest opens two more of its images. Image Details, Is the Point in View?, Save the Image and Open on Mapillary work on the image opened. Every Next Step of the panel runs after Nearest Image.

## References

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Finding an Image](finding-an-image.md) · [Using the Viewer](viewer.md) · [Nearest Panorama](pano.md) · [Map and Viewer](mapview.md)
