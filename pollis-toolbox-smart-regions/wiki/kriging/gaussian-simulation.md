# Gaussian Simulation

## What the Gaussian Simulation Tab Computes

The Gaussian Simulation tab of the Kriging panel draws as many maps of the Column input as the Realisations input asks for, over the cells of the grid, from a Gaussian random field with the variogram model fitted on the Variogram tab and the mean of the stations ([Chilès and Delfiner (2012)](#ref-CD2012a)). The simulation is conditional: every realisation equals the measured value at the stations' cells and reproduces the variogram between them. The computation is `rand(Xoshiro(2026), GaussianProcess(vario, mean), grid, realisations; data)` of GeoStats.jl, which chooses a simulation method for the grid and the data, such as sequential Gaussian simulation ([Hoffimann (2026)](#ref-Hof2026a)). The fixed seed gives the same realisations on every run. The tab maps the first realisation; the others are columns of the matrix `realisations`, one row per cell.

## Sequential Gaussian Simulation

Sequential Gaussian simulation visits the cells in a random order. At each cell it computes, by simple kriging from the stations and the cells already simulated, the mean and variance of a normal distribution, draws a value from it, and adds that value to the data for the cells that follow ([Goovaerts (1997)](#ref-Goo1997a)). Because each value is drawn rather than estimated, the realisation keeps the variability that kriging smooths out, and because the simulated values join the data, the realisation reproduces the variogram. A different random path and different draws give a different realisation, each equally likely given the stations and the model. The method assumes that the variable is Gaussian; a skewed variable is usually transformed to normal scores first and back afterwards.

## Probabilities and the Mean of the Realisations

The realisations together describe the uncertainty of the map: in each cell, their spread is the uncertainty of the value, and over the whole grid they show which cells are likely to be high or low together ([Goovaerts (1997)](#ref-Goo1997a)). Probability above a Threshold maps the share of realisations in which each cell exceeds the Threshold input, which answers questions such as where a limit value is likely to be exceeded. Map of the Mean of the Realisations maps their mean in each cell, which approaches the simple kriging estimate as the realisations grow in number, with their standard deviation. Probabilities computed from 20 realisations are coarse, multiples of 0.05; more realisations make them finer, at the cost of time.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Ordinary Kriging](ordinary-kriging.md)
