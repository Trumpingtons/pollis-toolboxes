# Using the Viewer

## Looking Around in the Street-Level Viewer

In the viewer of MapillaryJS, dragging the image with the mouse, a pen or a finger turns the camera, and scrolling zooms in and out; the keys `+` and `-` zoom too ([Mapillary (2023)](#ref-Map2023a)). An indicator shows the direction the camera faces and its field of view, and buttons zoom in and out. MapillaryJS can show a cover that loads nothing until the viewer is clicked; the Mapillary Street-Level Viewer turns it off, so that the image of the tab opens at once. The attribution that MapillaryJS shows by default stays in the corner of the viewer.

## Walking Along a Sequence and Around a Crossing

Arrows drawn on the image lead to the images around it: steps forward, backward and to the sides, and turns, to images of the same sequence or of others nearby ([Mapillary (2023)](#ref-Map2023a)). A click on an arrow moves the viewer there. The keyboard does the same once the viewer has the focus: the arrow keys step forward, back, left and right; with `Shift` held, the left, right and down arrows turn left, right and around; and `Alt` with the up and down arrows moves to the next and the previous image of the sequence.

## Playing a Sequence in the Viewer

The sequence component of MapillaryJS shows arrows to the next and the previous image of the sequence, and a button that plays it, moving from image to image on its own ([Mapillary (2023)](#ref-Map2023a)). The space bar starts and stops playing, `Shift` with `D` switches the direction, and `<` and `>` slow it down and speed it up. Playing follows a street as its contributor captured it, image after image, while the steps of the direction arrows can also leave the sequence for a nearby one.

## Panoramas in the Street-Level Viewer

A panorama is an image captured all round; the Mapillary API marks it with the field `is_pano`, and gives the projection of every camera in `camera_type`: perspective, fisheye or spherical ([Mapillary (2026)](#ref-Map2026a)). In the viewer, a panorama turns through the whole circle as it is dragged, while a perspective image shows only what lay in front of its camera; the arrows lead from panoramas to perspective images and back ([Mapillary (2023)](#ref-Map2023a)). Nearest Panorama looks for panoramas only, so that the whole view round the point comes from one image.

## The Coverage Map Beside the Viewer

Map and Viewer, and Viewer and Map among the Next Steps, put a map to the right of the viewer. It draws the computed coverage tiles of Mapillary on an OpenStreetMap base map: the sequences as green lines from zoom 6, and the images as dots from zoom 14, the only zoom of the image layer of the tiles ([Mapillary (2026)](#ref-Map2026a); [MapLibre Contributors (2026)](#ref-MLC2026a)). A click on a dot opens that image in the viewer, and a click on a line opens the image the tiles give for that sequence. A red arrow marks where the viewer stands and points where it looks, and the map follows it as the viewer walks and turns.

## The Viewer on a Page and in a Notebook

From the Julia REPL, `Pollis.streetview` writes a page and opens it in Pollis's browser; in a Julia notebook, the viewer is drawn in the output of the cell. The page is named after the title, so a viewer with the same title opens again in its tab, and one with another title, as after Oldest and Newest, in a tab of its own; a notebook keeps a viewer under each cell that shows one. The page also says in text which image the viewer opens and whether a map stands beside it, for screen readers. MapillaryJS resizes the viewer when the window is resized ([Mapillary (2023)](#ref-Map2023a)). The page loads the images from Mapillary while the viewer is open; nothing of them is saved in the Folder unless Look at the Image or Save the Image downloads it.

## References

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Map and Viewer](mapview.md) · [Nearest Panorama](pano.md) · [Diagnostics](diagnostics.md)
