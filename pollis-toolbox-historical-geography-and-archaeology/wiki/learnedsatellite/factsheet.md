# Learned Detection in Satellite Images — Factsheet

**Learned detection in satellite images** finds archaeological sites with a model that has learned what known sites look like, applied to the rest of an area to find ground that looks like them. The Learned Detection in Satellite Images panel of the Historical Geography and Archaeology Toolbox does this in nine steps, with one of three models. Random Forest on Sentinel-2 trains a random forest on the known sites of the area in a multitemporal composite of Sentinel-2, after the method of [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a). Enki as Published classifies cells of 350 m of an RGB image of 1 m for tells with the trained network of [Rosati (2025b)](#ref-Ros2025b), and Enki Fine-Tuned on Known Sites first trains its last two layers again on the known sites. ArchaeologicalDetection.jl reads the scenes and the imagery, trains the random forest with DecisionTree.jl and runs Enki with NNlib.jl, on grids read with Rasters.jl and ArchGDAL.jl ([JuliaAI Contributors (2026)](#ref-JAIC2026a); [FluxML Contributors (2026)](#ref-FMLC2026a); [Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Learned Detection in Satellite Images panel |
|---|---|
| **Purpose** | Apply a model of known sites over an area, to find ground that looks like them in satellite images |
| **Models** | Random Forest on Sentinel-2; Enki Fine-Tuned on Known Sites; Enki as Published |
| **Input** | An area in degrees; a range of years of Sentinel-2, or a source of imagery of 1 m; and a vector file of known sites |
| **Core packages** | [ArchaeologicalDetection.jl](https://github.com/Trumpingtons/ArchaeologicalDetection.jl), [DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl), [NNlib.jl](https://github.com/FluxML/NNlib.jl), [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Steps** | Area and Model; Images; Known Sites; Train the Model; Run the Model; Save the Model's Output; Compute the Features; Look at the Features; Save Features |
| **Output** | `probability`, a `Raster` from 0 to 1, on the grid of the composite or of cells of 350 m; `candidates`, one named tuple for each feature, ranked by probability; `found.labels`, a `Raster` of the feature each cell belongs to; and their files: two GeoTIFFs and a GeoPackage |
| **Key choices** | The model; the years and the Maximum Cloud, or the imagery; the known sites; the negatives and their distance; the threshold, or the share of cells for Enki Fine-Tuned on Known Sites; the minimum area and the minimum roundness |

## How the Random Forest on Sentinel-2 Reads the Scenes and Trains the Model

| Step | Function | Computation |
|---|---|---|
| 1. Area and Model | `sentinel_scenes` | The Sentinel-2 Level-2A scenes over the area in the years chosen, from Earth Search's catalogue, those with more clouds than the Maximum Cloud left out |
| 2. Images | `sentinel_composite` | At every cell of 10 m in the UTM zone of the area, the mean reflectance of ten bands over the scenes where the cell is clear; saved as a GeoTIFF and read from it afterwards |
| 3. Known Sites | `site_cells` | The cells inside the polygons of the file, or within the Radius of its points and lines |
| 4. Train the Model | `forest_model` | A random forest of 128 trees on the cells of the sites and on cells drawn at random at least the Distance from Sites away from them |
| 5. Run the Model | `forest_probability` | At every cell, the share of the trees that vote for a site |
| 7. Compute the Features | `forest_features` | The cells at or above the Threshold, 0.55 by default, joined through their sides |

The scenes come from Earth Search, which serves Sentinel-2 as Cloud-Optimised GeoTIFFs without an account ([Element 84 (2026)](#ref-E2026a)). Only the cells of the area are read from each scene.

## How Enki Reads the Image and Trains the Model

| Step | Function | Computation |
|---|---|---|
| 1. Area and Model | `enki_weights`, `enki_model` | Enki's Keras file, downloaded once, read into its network in Julia |
| 2. Images | `aerial_image` | An RGB image of 1 m in the UTM zone of the area, from Esri World Imagery, Google's satellite tiles, a WMS or a raster file; saved as a GeoTIFF and read from it afterwards |
| 3. Known Sites | `site_points` | The centre of each feature of the file, in the coordinates of the image |
| 4. Train the Model | `enki_pooled`, `enki_examples`, `enki_finetune` | The 1,280 channels of Enki's network for every cell of 350 m; for Enki Fine-Tuned on Known Sites, nine images around each known site and cells away from them, on which Enki's last two layers are trained again |
| 5. Run the Model | `enki_probability` | At every cell of 350 m, the share of Enki's last layer for a tell |
| 7. Compute the Features | `enki_features` | The cells at or above the Threshold, 0.99 by default, joined through their sides; for Enki Fine-Tuned on Known Sites, the Share of Cells of highest share, 0.1 by default |

## How Learned Detection in Satellite Images Shows and Saves Its Results

| Step | Function | Computation |
|---|---|---|
| 6. Save the Model's Output | `write` | The probability map, before any threshold, as a Cloud-Optimised GeoTIFF |
| 7. Compute the Features | `forest_features`, `enki_features` | The features, filtered by the Minimum Area and the Minimum Roundness, ranked by highest probability |
| 8. Look at the Features | `terrain_maps` | Zoom and Pan: the probability map, and for the random forest the near infrared and the short-wave infrared of the composite, beside imagery of the same ground, side by side with a scale bar, moving together, with each feature outlined in yellow, and a button that goes to the square of the Zoom Size around the Zoom Centre and back. The imagery comes from Google or Esri, with the user's own key, or from EOX's Sentinel-2 cloudless of 2016, as Imagery chooses; its server learns where the area is. |
| 9. Save Features | `save_candidates` | The outline of each feature with its measures, as a GeoPackage in the UTM zone of the area |

## How the Steps of Learned Detection in Satellite Images Run

Each step of Learned Detection in Satellite Images has its inputs and its code, and the code of a step uses the results of the steps before it. Julia REPL first runs the earlier steps that have not run in the session as they are now, starting from the first one that changed. A new Threshold therefore runs Compute the Features again and leaves the model and its probability map as they are, while new known sites train the model again on the same images. The composite and the image of 1 m are read from their files whenever the files are there. The Model of Step 1 chooses the code of every step, and the inputs shown are those of the model chosen. Looking at the results and saving them are run only when asked.

## What the Next Steps of the Learned Detection in Satellite Images Panel Do

Interpret has two actions. Features and Known Sites counts the features that meet a known site and lists those that meet none; for Enki it also counts the known sites whose cell lies in a feature. A feature on a known site only shows that a model trained on it learned it, while a feature away from the known sites is a new candidate. Features and Scheduled Monuments, for the random forest on an area in England, reads the scheduled monuments within the area from Historic England's National Heritage List for England and lists each with the number of features that meet it ([Historic England (2026)](#ref-HE2026a)).

## What a Feature of Learned Detection in Satellite Images Records

Each feature is a named tuple. `id` numbers it, and `x` and `y` give its centre in the coordinates of the probability map, the UTM zone of the centre of the area. `area` is in square metres: a cell of the composite is 100 m², a cell of Enki 122,500 m². `roundness` is 4π times the area over the squared perimeter of the convex hull, 1 for a circle. `probability` is the highest probability of a cell within the feature: the largest share of trees that voted for a site, or the largest share of Enki for a tell.

## How Long Learned Detection in Satellite Images Takes

For the random forest, making the composite takes the longest. Each scene is read over the network for the cells of the area only, a few seconds a scene for an area of some tens of kilometres across, and several scenes at once when the Julia REPL runs several threads, as it does in Pollis by default. A composite of two years of scenes thus takes several minutes, and is read from its file in seconds afterwards; training and running the random forest take seconds to tens of seconds. For Enki, the image of 1 m takes a few minutes to read, once. Enki's network then reads each cell of 350 m in about a quarter of a second, several cells at once: an area of 12 km across, about 1,200 cells, takes about five minutes. Training the last layers and running them take seconds.

## Where the Example Data of the Learned Detection in Satellite Images Panel Comes From

For the random forest, the default area is the Berkshire Downs, south-west of Oxford. Its scenes come from Earth Search's Sentinel-2 Level-2A ([Element 84 (2026)](#ref-E2026a)). With the default file of known sites, Step 3 first writes the hillforts among the scheduled monuments of the area, read from Historic England's open web service, unless the folder already holds the file ([Historic England (2026)](#ref-HE2026a)). Hillforts are among the few sites of England large enough to cover many cells of 10 m. For Enki, the default area is around Tell Brak, in the Khabur basin of north-eastern Syria, among the tells on which Enki was trained. With the default file of known sites, Step 3 first writes the placemarks named Tell in the area, from the Ancient Near East site placemarks of [Pedersen (2007)](#ref-Ped2007a). Its imagery comes from the source the user chooses.

## References

<a id="ref-E2026a"></a>Element 84 (2026). Earth Search: Sentinel-2 Level-2A. Dataset, updated continuously. [element84.com/earth-search](https://element84.com/earth-search/)

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of decision tree (CART) and random forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Enki on Imagery of 1 m](enki.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
