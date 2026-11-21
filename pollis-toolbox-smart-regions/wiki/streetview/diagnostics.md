# Diagnostics

## No Image Within the Search Radius

A tab stops with a message when the image search finds no image, or no panorama, within the Search Radius of the point. The images of Mapillary lie along the routes its contributors took, mostly roads and paths ([Mahabir, Schuchard, Crooks, Croitoru and Stefanidis (2020)](#ref-MSCCS2020a)), so a point inside a block, a park or water may have none near it. Make the Search Radius larger, up to 500 m, or move the point onto a street; Images by Distance shows how the images found spread out from the point. Nearest Panorama finds fewer images than Nearest Image, as panoramas are a part of Mapillary's images.

## More Than 2,000 Images in the Box

The image search returns at most 2,000 images to a request, and pages through further results only for a search by creator ([Mapillary (2026)](#ref-Map2026a)). Over a large Search Radius, in a place photographed often, the box around the point can hold more images than that, and the answer is then only part of them: the nearest or the newest may be missing. The tab says so when the search returns 2,000 images. A smaller Search Radius avoids it.

## An Image That Does Not Open

When Mapillary cannot load the image the viewer asks for, a message over the viewer names the image and gives Mapillary's reason. Image by ID checks that the id is a number, and reads the fields of the image from the image entity of the API before it draws the viewer ([Mapillary (2026)](#ref-Map2026a)), so an id that Mapillary does not know stops the tab with Mapillary's message. An image can also have been removed from Mapillary since its id was noted. A move that the next one cancels, as when the map is clicked twice in quick succession, is not reported as a failure.

## A Blank Viewer or a Map Without Coverage

A viewer that stays blank, with a message about the token, was given none: set the token with the key on the Powered by line and run the tab again. MapillaryJS renders the images with WebGL ([Mapillary (2023)](#ref-Map2023a)), which Pollis's browser and notebook outputs provide. On the coverage map, the lines of the sequences appear from zoom 6 and the dots of the images from zoom 14 ([Mapillary (2026)](#ref-Map2026a)), so a map zoomed out further than that shows only the base map. A token that Mapillary refuses leaves the map without lines, and the viewer with a message.

## Mapillary Refuses the Token or the Request

A message that Mapillary answered with HTTP 401 or 403 means that it refused the token: copied in part, or of an application that no longer exists; set it again with the key. Mapillary also limits how many requests an application makes in a period, for entity, search and tile requests alike ([Mapillary (2026)](#ref-Map2026a)), and a message about a limit means waiting before running the tab again. Each run of a tab makes one search, or one image request, while the coverage map fetches the tiles of the area on screen as it moves.

## References

<a id="ref-MSCCS2020a"></a>Mahabir, R., Schuchard, R., Crooks, A., Croitoru, A. and Stefanidis, A. (2020). Crowdsourcing Street View Imagery: A Comparison of Mapillary and OpenStreetCam. *ISPRS International Journal of Geo-Information*, 9(6), 341. [doi:10.3390/ijgi9060341](https://doi.org/10.3390/ijgi9060341)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Access Token](access-token.md) · [Finding an Image](finding-an-image.md) · [Using the Viewer](viewer.md) · [Decision Guide](decision-guide.md)
