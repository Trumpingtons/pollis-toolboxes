# Image Search

## The Image Search of the Mapillary API

The endpoint `/images` of the Mapillary API returns the images in a bounding box, with the fields asked for, filtered by the days of capture, by panorama, by camera make and model, by creator, organisation or sequence ([Mapillary (2026)](#ref-Map2026a)). A bounding box must be smaller than 0.01 square degrees, and one request returns at most 2,000 images. The API pages through further results only for a search by creator, so a search by bounding box that reaches 2,000 images may have left some out. For larger areas, the documentation points to the vector tiles.

## How the Images Tab Splits the Area

The Images tab divides the Area into boxes of at most 0.09 by 0.09 degrees, under the limit of 0.01 square degrees, and asks for the images of each. When a box returns 2,000 images, it is divided into four and each quarter asked again, until every box returns fewer, so that no image is left out. An image on the edge between two boxes is kept once. The tab searches an Area of at most one square degree; Coverage reads larger areas from the tiles. Captured From and Captured To, as days such as 2020-01-31, and Panoramas filter the search on the side of the API.

## The Columns of the Images Table

| Column | What it holds |
|---|---|
| `id`, `sequence_id` | The image and its sequence |
| `captured_at` | When it was captured |
| `compass_angle` | Its computed heading in degrees, or the recorded one |
| `is_pano`, `camera_type` | Whether it is a panorama; the projection of the camera: perspective, fisheye or spherical |
| `make`, `camera_model`, `width`, `height` | The camera and the size of the original image |
| `on_foot` | Whether it was captured on foot, where Mapillary has classified it |
| `quality_score` | The predicted visual quality, from 0 to 1 |
| `creator`, `thumb_url`, `thumbnail` | The user name of its contributor; the address and the file of its thumbnail |
| `geom` | Its computed position, or the recorded one |

The fields are those of the image entity of the Mapillary API ([Mapillary (2026)](#ref-Map2026a)).

## Thumbnails of the Mapillary Images

The image entity gives the addresses of thumbnails 256, 512, 1024 and 2048 pixels wide, and of the original image ([Mapillary (2026)](#ref-Map2026a)). With Thumbnails at 20 Images or 100 Images, the Images tab downloads that many thumbnails 1024 pixels wide into the folder thumbnails, taking one image of each sequence first, the newest first, so that they spread over the streets of the Area; the column `thumbnail` holds the file of each. Look at the Images shows them on a page, newest first, each linked to the image on Mapillary.

## References

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Coverage Tiles](coverage-tiles.md) · [Map Features](map-features.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
