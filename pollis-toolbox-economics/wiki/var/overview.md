# VAR Models — Overview

The panel holds four related systems. **VAR** and **SVAR** share a reduced form, **FAVAR** adds factors from a large panel, and **VECM** imposes long-run relations among non-stationary series.

## The VAR Tab

The **VAR** tab fits a reduced-form system by ordinary least squares, equation by equation, with an intercept in each. **Data Variable** is a T by n matrix with one column per series, and **p (Lags)** sets the lag order. A VAR needs stationary series unless cointegration is handled explicitly. Next Steps use orthogonalised shocks in column order and residual-bootstrap bands, so that responses appear with this tab too, but those responses inherit the Cholesky ordering. Use the tab for forecasting, for **Granger Causality**, and as the reference point for identification.

## The SVAR Tab

The **SVAR** tab keeps the reduced form and adds **Identification**. Under **Recursive (Cholesky)**, shock j moves only variables j to n on impact, so column order matters and slow-moving series go first. Under **Long-Run (Blanchard-Quah)**, the scheme of [Blanchard and Quah (1989)](#ref-BQ1989a), shock j has no cumulative effect on variables 1 to j - 1, which suits growth rates. **Sign Restrictions** draws rotations and keeps those satisfying a sign pattern, as in [Uhlig (2005)](#ref-Uhl2005a), using an algorithm of the kind in [Rubio-Ramírez, Waggoner and Zha (2010)](#ref-RWZ2010a). The panel's pattern reads a monetary tightening from the last shock over two quarters.

## The FAVAR Tab

The **FAVAR** tab adds information from many indicators without estimating a huge system. **Panel Data (X)** is a T by N matrix of stationary series, and **Factors** sets how many principal components to extract. Estimation has two steps: factors are extracted from the panel and purged of the key series, then a VAR of order **p (Lags)** runs on factors and key series together. [Bernanke, Boivin and Eliasz (2005)](#ref-BBE2005a) proposed the model to address the problem of a central bank or analyst looking at far more series than a small VAR can hold.

## The VECM Tab

The **VECM** tab handles series that are non-stationary but tied by long-run relations. **r (Rank)** sets the number of relations, between 1 and n - 1, and **Deterministic Terms** selects **Constant**, **Constant + Trend** or **None**. **p (Lags)** is the order in levels, so the model has p - 1 lagged differences. Maximum likelihood follows [Johansen (1991)](#ref-Joh1991a). The output gives alpha, for adjustment speeds, beta, for the cointegrating vectors, and Gamma, for short-run dynamics. [Engle and Granger (1987)](#ref-EG1987a) established the equivalence between cointegration and an error correction form.

## Common Workflow for a VAR Analysis

1. Look at the data with **Series Plot** and decide on stationarity.
2. Choose the order with **Lag Selection**, then check **Stability Check**.
3. For series in levels, run **Johansen Cointegration Test** and **VAR vs VECM**.
4. Choose the identification, then read **Impulse Responses** with its bands.
5. Read **Variance Decomposition** and **Historical Decomposition**.
6. Use **Forecast** and **Granger Causality** where needed.

## References

<a id="ref-BBE2005a"></a>Bernanke, B. S., Boivin, J. and Eliasz, P. (2005). Measuring the Effects of Monetary Policy: A Factor-Augmented Vector Autoregressive (FAVAR) Approach. *The Quarterly Journal of Economics* 120(1), 387–422. [doi:10.1162/0033553053327452](https://doi.org/10.1162/0033553053327452)

<a id="ref-BQ1989a"></a>Blanchard, O. J. and Quah, D. (1989). The Dynamic Effects of Aggregate Demand and Supply Disturbances. *American Economic Review* 79(4), 655–673. [Link](https://ideas.repec.org/a/aea/aecrev/v79y1989i4p655-73.html)

<a id="ref-EG1987a"></a>Engle, R. F. and Granger, C. W. J. (1987). Co-Integration and Error Correction: Representation, Estimation, and Testing. *Econometrica* 55(2), 251. [doi:10.2307/1913236](https://doi.org/10.2307/1913236)

<a id="ref-Joh1991a"></a>Johansen, S. (1991). Estimation and Hypothesis Testing of Cointegration Vectors in Gaussian Vector Autoregressive Models. *Econometrica* 59(6), 1551. [doi:10.2307/2938278](https://doi.org/10.2307/2938278)

<a id="ref-RWZ2010a"></a>Rubio-Ramírez, J. F., Waggoner, D. F. and Zha, T. (2010). Structural Vector Autoregressions: Theory of Identification and Algorithms for Inference. *Review of Economic Studies* 77(2), 665–696. [doi:10.1111/j.1467-937X.2009.00578.x](https://doi.org/10.1111/j.1467-937X.2009.00578.x)

<a id="ref-Uhl2005a"></a>Uhlig, H. (2005). What are the effects of monetary policy on output? Results from an agnostic identification procedure. *Journal of Monetary Economics* 52(2), 381–419. [doi:10.1016/j.jmoneco.2004.05.007](https://doi.org/10.1016/j.jmoneco.2004.05.007)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
