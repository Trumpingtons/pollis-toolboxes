# Direct and Indirect Effects

## Why Coefficients Are Not Effects in a Spatial Lag Model

In a spatial lag model, a change in an explanatory variable in one area changes that area's outcome, which changes its neighbours' outcomes through the spatial lag, which change their neighbours' and feed back to the first area. The reduced form `y = (I - rho W)^-1 (X beta + e)` holds the whole chain: the effect of the k-th variable is the n by n matrix `(I - rho W)^-1 beta_k`, not the coefficient `beta_k` ([LeSage and Pace (2009)](#ref-LP2009a)). The coefficient is only the first round of the change. Reading it as a marginal effect, as in least squares, misses both the feedback to the area itself and the spillovers to the other areas.

## Average Direct, Indirect and Total Effects

LeSage and Pace (2009) summarise the n by n matrix of effects of each variable by three numbers. The average direct effect is the mean of its diagonal: the change in an area's own outcome after a change in its own explanatory variable, feedback included. The average total effect is the mean of its row sums: the change in an area's outcome after the same change in every area. The average indirect effect is their difference, the spillover: the change in all the other areas' outcomes together ([LeSage and Pace (2009)](#ref-LP2009a)). In SpatialEconometrics.jl, `spatial_effects(m)` returns them for a spatial lag or spatial Durbin model, with standard errors ([Randsley (2026)](#ref-Ran2026a)).

## Effects in the Spatial Durbin and SLX Models

In the spatial Durbin model the effect matrix of the k-th variable is `(I - rho W)^-1 (beta_k I + theta_k W)`, so the indirect effects come both from the multiplier and from the neighbours' explanatory variables ([LeSage and Pace (2009)](#ref-LP2009a)). In the SLX model there is no multiplier: the direct effect of the k-th variable is `beta_k` and its indirect effect is `theta_k`, the coefficient of its spatial lag, which Halleck Vega and Elhorst (2015) note can be read and tested directly ([Halleck Vega and Elhorst (2015)](#ref-HE2015a)). In the spatial error model and in least squares the indirect effects are zero.

## The Spatial Multiplier

With row-standardised weights, the rows of `(I - rho W)^-1` sum to `1/(1 - rho)`, the spatial multiplier. The total effect of a variable in the spatial lag model is its coefficient times the multiplier, `beta_k / (1 - rho)`, and in the spatial Durbin model `(beta_k + theta_k) / (1 - rho)` ([LeSage and Pace (2009)](#ref-LP2009a)). Elhorst (2014) points out that in the spatial lag model the ratio of the indirect to the direct effect is the same for every variable, which the spatial Durbin model does not impose ([Elhorst (2014)](#ref-Elh2014a)). The Spatial Multiplier and Change One Area steps of the Spatial Lag and Error Models panel show the multiplier at work.

## References

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-HE2015a"></a>Halleck Vega, S. and Elhorst, J. P. (2015). The SLX model. *Journal of Regional Science*, 55(3), 339–363. [doi:10.1111/jors.12188](https://doi.org/10.1111/jors.12188)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spatial Lag (SAR)](sar.md) · [Spatial Durbin (SDM)](sdm.md) · [Lag of X (SLX)](slx.md) · [Overview](overview.md)
