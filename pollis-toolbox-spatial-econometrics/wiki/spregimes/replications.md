# Replications

## The Replication of the Regionalisation and Spatial Regimes Panel

The Replicate group of the Next Steps of the Regionalisation and Spatial Regimes panel checks `fit_spatial_regime` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)) against PySAL's spreg ([Rey and Anselin (2007)](#ref-RA2007a)). The step Baltimore Houses: spreg downloads open data, fits the regime spatial lag model in Julia, and prints each estimate beside the value spreg's documentation prints, with the difference. The values of spreg are those the documentation of `ML_Lag_Regimes` prints, so none is computed by the panel's code. Differences in the last printed digit come from rounding.

| Step | Checked against | Data |
|---|---|---|
| Baltimore Houses: spreg | spreg's `ML_Lag_Regimes`, method full | libpysal's `baltim` example |

## The Baltimore House Prices of Dubin (1992)

The Baltimore data hold the sale prices and characteristics of 211 houses in Baltimore, Maryland, from Dubin (1992), who studied spatial autocorrelation in house prices and neighbourhood quality ([Dubin (1992)](#ref-Dub1992a)). PySAL's libpysal ships them as the `baltim` example: a point shapefile of house sales prices and characteristics in 1978, among them the price (PRICE), the number of rooms (NROOM), the age (AGE) and the floor area (SQFT), a column CITCOU that says whether the house lies in the city or in the county, and a GAL file of queen contiguity weights. libpysal is published under the BSD 3-Clause licence, and the panel downloads the files from its GitHub repository.

## The Model Checked: ML_Lag_Regimes of spreg

The documentation of spreg's `ML_Lag_Regimes` fits the price on the number of rooms, the age and the floor area, with CITCOU as the regimes and the queen weights of `baltim_q.gal`, row-standardised. Each regime has its own constant and slopes, and the spatial lag coefficient is shared by both, the default of that function. The documentation prints the eight coefficients, rho, the diagonal of their covariance matrix, the variance of the errors, the log-likelihood, AIC and the Schwarz criterion. `fit_spatial_regime` with `spatial_lag = true` fits the same model. The step also prints the regimes by least squares and their Chow test, for which the documentation prints no values.

## References

<a id="ref-Dub1992a"></a>Dubin, R. A. (1992). Spatial autocorrelation and neighborhood quality. *Regional Science and Urban Economics*, 22(3), 433–452. [doi:10.1016/0166-0462(92)90038-3](https://doi.org/10.1016/0166-0462(92)90038-3)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-RA2007a"></a>Rey, S. J. and Anselin, L. (2007). PySAL: a Python library of spatial analytical methods. *Review of Regional Studies*, 37(1). [doi:10.52324/001c.8285](https://doi.org/10.52324/001c.8285)

## See Also
- [Regimes, Spatial Lag](reglag.md) · [Factsheet](factsheet.md)
