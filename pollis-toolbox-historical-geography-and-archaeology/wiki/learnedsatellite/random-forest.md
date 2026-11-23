# Random Forest on Sentinel-2

## The Method of Orengo and Coauthors for Archaeological Mounds

[Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) mapped the mounded settlements of the Indus Civilisation in the Cholistan Desert of Pakistan, from about 3300 to 1500 BC, with a random forest in Google Earth Engine. Their composite had 14 bands: four of Sentinel-1 radar, the median of about 1,500 scenes from 2014 to 2020, and ten of Sentinel-2, the mean of 3,112 scenes from 2015 to 2020. Of 25 mounds recorded by earlier surveys and clearly identified, 5 were outlined by hand in Earth Engine to train a random forest of 128 trees, in probability mode, and 20 were kept to test it. After three rounds of training, the clusters of cells above a probability of 0.55 were turned into outlines, checked on high-resolution imagery, and became the map of mounds, hundreds of them new.

## The Ten Bands of the Sentinel-2 Composite

The composite of Learned Detection in Satellite Images has the ten bands that [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) took from Sentinel-2, leaving out the three bands of 60 m that record the atmosphere ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)).

| Band | Name in Earth Search | Centre (nm) | Cell |
|---|---|---|---|
| B2 | blue | 490 | 10 m |
| B3 | green | 560 | 10 m |
| B4 | red | 665 | 10 m |
| B5 | rededge1 | 705 | 20 m |
| B6 | rededge2 | 740 | 20 m |
| B7 | rededge3 | 783 | 20 m |
| B8 | nir | 842 | 10 m |
| B8A | nir08 | 865 | 20 m |
| B11 | swir16 | 1610 | 20 m |
| B12 | swir22 | 2190 | 20 m |

Each cell of 10 m takes, in the bands of 20 m, the value of the nearest cell of the scene, as Earth Engine does by default.

## How the Sentinel-2 Composite Leaves Out Clouds

[Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) averaged each band over all scenes, leaving out the cells that the QA60 mask of Level-1C flags as opaque cloud or cirrus. The composite of Learned Detection in Satellite Images is made from Level-2A, which comes with a scene classification at 20 m. A cell of a scene is left out of the mean when the classification marks it as no data, saturated or defective, cloud shadow, cloud of medium or high probability, or thin cirrus, or when a band has no value there. The scene classification thus also leaves out the shadows of clouds, which the QA60 mask does not mark. Step 1 leaves out, besides, the scenes with more clouds over the whole scene than the Maximum Cloud.

## Level-2A Surface Reflectance and Level-1C Top of Atmosphere

[Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) used Level-1C, the reflectance at the top of the atmosphere, for its longer span of years in Earth Engine. Learned Detection in Satellite Images uses Level-2A, the reflectance at the surface after correction for the atmosphere, because Earth Search serves it as Cloud-Optimised GeoTIFFs without an account, so only the cells of the area are read ([Element 84 (2026)](#ref-E2026a)). Earth Search's Level-1C is kept where an account is needed. The random forest is trained on the same composite it classifies, so either level serves it; Level-2A also makes composites of different areas and years more alike.

## How the Random Forest of Learned Detection in Satellite Images Is Trained

A random forest is a set of decision trees, each grown on a random sample of the training cells and choosing, at each split, among a random few of the bands ([Breiman (2001)](#ref-Bre2001a)). Learned Detection in Satellite Images grows 128 trees with DecisionTree.jl ([JuliaAI Contributors (2026)](#ref-JAIC2026a)). Each tree takes half the training cells, drawn with replacement, and at each split the best of three bands, the square root of ten, drawn at random; the trees grow until their leaves are pure. These are the defaults of Earth Engine's random forest, which the article does not say were changed. The positives are every cell of a known site with all ten bands. The negatives are cells drawn at random, at least the Distance from Sites from every site, ten times as many as the positives by default.

## The Probability of a Site at Each Cell

In probability mode, the random forest gives at each cell the share of its trees that vote for a site, from 0 when none does to 1 when all do. With 128 trees, the probability moves in steps of 1/128. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) chose the threshold of 0.55 after looking at the training data on high-resolution imagery: a higher threshold outlined large and clear mounds better but lost small or partly buried ones, and 0.55 kept those while admitting mostly scattered, isolated cells as false positives. The features of Learned Detection in Satellite Images are the cells at or above the Threshold, joined through their sides.

## What Learned Detection in Satellite Images Leaves Out of the Method

Learned Detection in Satellite Images makes the Sentinel-2 part of the composite of [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) and not its Sentinel-1 part. Radar adds the roughness and moisture of the ground, and sees through cloud. Their training data were drawn by hand in Earth Engine and refined over three rounds of training; here the examples of ground that is not a site are cells drawn at random away from the known sites, in one round. A second round can be made by changing the known sites, the Negatives per Site Cell or the Distance from Sites, and training again.

## References

<a id="ref-Bre2001a"></a>Breiman, L. (2001). Random forests. *Machine Learning* 45(1), 5–32. [doi:10.1023/A:1010933404324](https://doi.org/10.1023/A:1010933404324)

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment* 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-E2026a"></a>Element 84 (2026). Earth Search: Sentinel-2 Level-2A. Dataset, updated continuously. [element84.com/earth-search](https://element84.com/earth-search/)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of decision tree (CART) and random forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
