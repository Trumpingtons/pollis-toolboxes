# Learned Detection in Satellite Images — Factsheet

**Learned detection in satellite images** trains a model on archaeological sites already known in an area, and applies it to the rest of the area to find ground that looks like them. The Learned Detection in Satellite Images panel of the Historical Geography and Archaeology Toolbox does this in nine steps, with a random forest on a multitemporal composite of Sentinel-2, after the method of [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a). ArchaeologicalDetection.jl reads the scenes and trains the random forest with DecisionTree.jl, on a grid read with Rasters.jl and ArchGDAL.jl ([JuliaAI Contributors (2026)](#ref-JAIC2026a); [Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Learned Detection in Satellite Images panel |
|---|---|
| **Purpose** | Train a model on known sites and apply it over an area, to find ground that looks like them in Sentinel-2 |
| **Input** | An area in degrees, a range of years, and a vector file of known sites: polygons, or points and lines with a radius |
| **Core packages** | [ArchaeologicalDetection.jl](https://github.com/Trumpingtons/ArchaeologicalDetection.jl), [DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl), [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Steps** | Area and Scenes; Sentinel-2 Composite; Known Sites; Train the Random Forest; Run the Random Forest; Save the Model's Output; Compute the Features; Look at the Features; Save Features |
| **Output** | `composite`, a `Raster` of ten bands at 10 m; `probability`, a `Raster` from 0 to 1 on its grid; `candidates`, one named tuple for each feature, ranked by probability; `found.labels`, a `Raster` of the feature each cell belongs to; and their files: two GeoTIFFs and a GeoPackage |
| **Key choices** | The years and the Maximum Cloud, the known sites, the negatives and their distance, the threshold, the minimum area and the minimum roundness |

## How Learned Detection in Satellite Images Makes the Composite and Trains the Model

| Step | Function | Computation |
|---|---|---|
| 1. Area and Scenes | `sentinel_scenes` | The Sentinel-2 Level-2A scenes over the area in the years chosen, from Earth Search's catalogue, those with more clouds than the Maximum Cloud left out |
| 2. Sentinel-2 Composite | `sentinel_composite` | At every cell of 10 m in the UTM zone of the area, the mean reflectance of ten bands over the scenes where the cell is clear; saved as a GeoTIFF and read from it afterwards |
| 3. Known Sites | `site_cells` | The cells inside the polygons of the file, or within the Radius of its points and lines |
| 4. Train the Random Forest | `forest_model` | A random forest of 128 trees on the cells of the sites and on cells drawn at random at least the Distance from Sites away from them |

The scenes come from Earth Search, which serves Sentinel-2 as Cloud-Optimised GeoTIFFs without an account ([Element 84 (2026)](#ref-E2026a)). Only the cells of the area are read from each scene.

## How Learned Detection in Satellite Images Computes, Shows and Saves Its Results

| Step | Function | Computation |
|---|---|---|
| 5. Run the Random Forest | `forest_probability` | At every cell, the share of the trees that vote for a site |
| 6. Save the Model's Output | `write` | The probability map, before any threshold, as a Cloud-Optimised GeoTIFF |
| 7. Compute the Features | `forest_features` | The cells at or above the Threshold, joined through their sides, filtered by the Minimum Area and the Minimum Roundness, ranked by highest probability |
| 8. Look at the Features | `terrain_maps` | Zoom and Pan: the probability, the near infrared and the short-wave infrared of the composite and imagery of the same ground, side by side with a scale bar, moving together, with each feature outlined in yellow, and a button that goes to the square of the Zoom Size around the Zoom Centre and back. The imagery comes from Google or Esri, with the user's own key, or from EOX's Sentinel-2 cloudless of 2016, as Imagery chooses; its server learns where the area is. |
| 9. Save Features | `save_candidates` | The outline of each feature with its measures, as a GeoPackage in the UTM zone of the composite |

## How the Steps of Learned Detection in Satellite Images Run

Each step of Learned Detection in Satellite Images has its inputs and its code, and the code of a step uses the results of the steps before it. Julia REPL first runs the earlier steps that have not run in the session as they are now, starting from the first one that changed. A new Threshold therefore runs Compute the Features again and leaves the random forest and its probability map as they are, while new known sites train the random forest again on the same composite. The composite itself is read from its file whenever the file is there. Looking at the results and saving them are run only when asked.

## What the Next Steps of the Learned Detection in Satellite Images Panel Do

Interpret has two actions. Features and Known Sites counts the features that meet a known site and lists those that meet none: a feature on a known site only shows that the random forest learned its training cells, while a feature away from them is a new candidate. Features and Scheduled Monuments, for an area in England, reads the scheduled monuments within the area from Historic England's National Heritage List for England and lists each with the number of features that meet it ([Historic England (2026)](#ref-HE2026a)).

## What a Feature of Learned Detection in Satellite Images Records

Each feature is a named tuple. `id` numbers it, and `x` and `y` give its centre in the coordinates of the composite, the UTM zone of the centre of the area. `area` is in square metres, 100 m² a cell. `roundness` is 4π times the area over the squared perimeter of the convex hull, 1 for a circle. `probability` is the highest probability of a cell within the feature, the largest share of trees that voted for a site there.

## How Long Learned Detection in Satellite Images Takes

Making the composite takes the longest. Each scene is read over the network for the cells of the area only, a few seconds a scene for an area of some tens of kilometres across, and several scenes at once when the Julia REPL runs several threads, as it does in Pollis by default. A composite of two years of scenes thus takes several minutes, and is read from its file in seconds afterwards. Training a random forest of 128 trees and running it over a few million cells take seconds to tens of seconds.

## Where the Example Data of the Learned Detection in Satellite Images Panel Comes From

The default area is the Berkshire Downs, south-west of Oxford. Its scenes come from Earth Search's Sentinel-2 Level-2A ([Element 84 (2026)](#ref-E2026a)). With the default file of known sites, Step 3 first writes the hillforts among the scheduled monuments of the area, read from Historic England's open web service, unless the folder already holds the file ([Historic England (2026)](#ref-HE2026a)). Hillforts are among the few sites of England large enough to cover many cells of 10 m.

## References

<a id="ref-E2026a"></a>Element 84 (2026). Earth Search: Sentinel-2 Level-2A. Dataset, updated continuously. [element84.com/earth-search](https://element84.com/earth-search/)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of decision tree (CART) and random forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
