# Finding an Image

## The Image Search Around the Point

Nearest Image, Nearest Panorama and Map and Viewer look for images with the image search of the Mapillary API, which returns the images in a bounding box with the fields asked for, at most 2,000 to a request, over a box smaller than 0.01 square degrees ([Mapillary (2026)](#ref-Map2026a)). The tabs ask for the square whose sides lie the Search Radius away from the point, and keep the images whose position lies within the Search Radius of it, a distance measured on the sphere by DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A Search Radius of at most 500 m keeps the box well under the size limit, so that one request answers it.

## The Nearest or the Newest Image

Image to Open chooses which of the images found the viewer opens. The Nearest is the image whose position lies closest to the point. The Newest is the image captured last within the Search Radius, whatever its distance: it shows the place as it was photographed most recently, but may stand farther from it. The table `images` keeps every image found, with its distance from the point in the column `metres`, so that the Next Steps can open others, as Oldest and Newest does.

## Computed and Camera Positions of an Image

The Mapillary API gives two positions of an image: the geometry its camera recorded, and the computed geometry, which Mapillary estimates by processing the images together, with a computed compass angle beside the recorded one ([Mapillary (2026)](#ref-Map2026a)). The tabs measure distances from the computed position, and from the recorded one for an image without a computed position; the table keeps both, as `geom` and `camera_geom`. MapillaryJS too places an image at its computed position when there is one, and at the recorded one otherwise ([Mapillary (2023)](#ref-Map2023a)), and the coverage map draws the computed tiles, so that the viewer and the map agree. Image Details reports how far apart the two positions lie.

## Ids and Links of Mapillary Images

Every image of Mapillary has a numeric id, by which the image entity of the API returns its fields ([Mapillary (2026)](#ref-Map2026a)). The site of Mapillary names the image it shows with the parameter `pKey` of its address, as in `https://www.mapillary.com/app/?pKey=` followed by the id, the link Open on Mapillary prints. Image by ID takes either the number or the whole link, from which it reads the number after `pKey=`. The tables of the Images tab of Mapillary Street-Level Imagery hold the same ids in their column `id`, so an image found there opens here.

## The Columns of the Table images

| Column | What it holds |
|---|---|
| `id`, `sequence_id` | The image and its sequence |
| `captured_at` | When it was captured |
| `compass_angle` | The computed compass angle, or the recorded one |
| `is_pano`, `camera_type` | Whether it is a panorama; the projection of its camera |
| `make`, `camera_model`, `width`, `height` | Its camera, and its size in pixels |
| `creator` | The user name of its contributor |
| `thumb_url`, `large_url` | The addresses of its thumbnails 1024 and 2048 pixels wide |
| `geom`, `camera_geom` | Its computed and recorded positions |
| `metres` | Its distance from the point |

Every column but `metres` comes from a field of the image entity of the Mapillary API ([Mapillary (2026)](#ref-Map2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Nearest Image](nearest.md) · [Image by ID](byid.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
