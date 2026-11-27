# Learned Detection in Satellite Images — Diagnostics

## Learned Detection in Satellite Images Finds No Scenes

When Step 1, Area and Scenes, finds no scenes, the Maximum Cloud is too low for the years chosen, or the Area is not in degrees. The Area is west, south, east and north in degrees of longitude and latitude, west less than east and south less than north; coordinates in metres are not degrees. Raising the Maximum Cloud or taking more years brings more scenes. A few scenes of Earth Search keep their files where an account is needed, and are left out without notice.

## Cells Missing from the Sentinel-2 Composite

A cell of the composite is missing when no scene showed it clear: every scene had cloud, cloud shadow or no data there. Step 2 prints how many cells were clear in at least one scene, and how many scenes a cell had on average. Missing cells have no probability and belong to no feature. More years, or a higher Maximum Cloud, fill them. Cells clear in only a few scenes are noisier than the rest, and can stand out in the probability map for that reason alone.

## The Composite of a Previous Area Is Read Again

Step 2 reads the composite from the Composite File whenever the file is there, whatever the Area and the years. After a change of Area or years, the old composite is read, and Step 3 finds no known sites, or the wrong ones. A new Composite File name for each area and range of years avoids this; deleting the old file makes Step 2 read the scenes again.

## No Cells of Known Sites

When Step 3, Known Sites, finds no cells of known sites, the sites lie outside the composite, the file has no coordinate system, or its points are smaller than a cell. The sites must be inside the Area of Step 1, and the file must state its coordinate system, as a GeoPackage does. Points and lines take half a cell with a Radius of 0, which may meet no cell centre: a Radius of the sites' own size gives each point an area. Training fails when no cell of a site has all ten bands of the composite.

## Enki's Image Cannot Be Read

When Step 2 cannot read the image of 1 m for Enki, the key, the WMS or the file is at fault. Esri World Imagery and Google's satellite tiles need the user's key, set on the Powered by line; without it Step 2 stops and names the key that is missing. A WMS must be given as GDAL's connection string, starting WMS: and naming a layer. A raster file must have red, green and blue as its first three bands, and a coordinate system. Step 2 reads the image from the Image File whenever the file is there, so an image of a previous area or source is read again until the Image File is renamed or deleted.

## Cells of Enki Left Out

A cell of 350 m is left out of Enki's map when it is black over half its area: the imagery has no tiles there, the WMS returned nothing, or the user's file does not cover the area. Cells along the east and south edges of the image that are not whole are left out too. Missing cells have no share and belong to no feature. A map of black tiles over the whole area usually means that the source has no imagery at the zoom level of 1 m there, or that the key was refused.

## Features Everywhere in Learned Detection in Satellite Images

When much of the area is above the Threshold, the random forest has learned little that tells the sites apart: their ground resembles that of the area, or the known sites mix kinds of ground. A higher Threshold, more Negatives per Site Cell, or a Minimum Area leaves out the commonest false positives. Known sites of one kind, with outlines that follow their true extent, teach a clearer model. Some sites cannot be told from their surroundings by reflectance at all, and no setting finds them in Sentinel-2.

## Features Only on the Known Sites

When the only features are the known sites, the random forest has learned their exact values and finds nothing else like them. This is expected with few sites and many negatives: each site's ground is unlike the rest. A lower Threshold shows the cells that resemble the sites less closely. Features and Known Sites, in Interpret, separates the features on the known sites from those away from them, which are the ones to look at. Known sites kept out of the training file show whether the model finds sites it was not shown.

## Enki Marks Villages, Quarries and Roads

Enki's README names its common false positives: modern buildings, industrial areas, construction sites, quarries, roads and landforms that resemble mounds ([Rosati (2025b)](#ref-Ros2025b)). A higher Threshold leaves out the less certain cells. Enki's own test first left out mountainous ground, where landforms resemble mounds. Enki Fine-Tuned on Known Sites draws its negatives from the area, among them such ground, and teaches its last layers that it is not a tell, when the known sites are many enough. The features remain places to look at on the imagery, not sites.

## Different Results after Training Again

The negatives and the samples of the trees are drawn at random, from a fixed seed, so training again on the same composite, sites and settings gives the same random forest. A change of the known sites, of the Negatives per Site Cell or of the Distance from Sites draws other negatives, and the probabilities of the cells change, most of all near the threshold. Features that appear and disappear from one training to the next are less certain than those that remain. Enki Fine-Tuned on Known Sites draws its negatives, the images kept out and its dropout from a fixed seed too, so training it again on the same image and known sites gives the same layers.

## References

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Enki on Imagery of 1 m](enki.md) · [Decision Guide](decision-guide.md)
