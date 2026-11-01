# VAR Models — Diagnostics

Diagnostics judge the lag length, stability and long-run structure before any structural reading.

## Reading the Lag Selection Table

**Lag Selection** reports AIC, BIC and HQ for p = 1 to 6, all fitted on the same sample so that the values are comparable. BIC tends to choose fewer lags, and AIC tends to choose more. With quarterly data, a value of four is a common check, and residual autocorrelation is a reason to use more. A disagreement between criteria can be handled by reporting responses for both orders. If the conclusion depends on one extra lag, the sample may not be able to settle the question.

## Reading the Stability Check

**Stability Check** reports the moduli of the companion-matrix eigenvalues, where values below 1 mean that shocks die out. A modulus at or above 1 means a non-stationary system, so impulse responses will not decay and forecast intervals will grow without limit. A modulus only just under 1 makes long-horizon responses very imprecise. An unstable system usually needs different transformations of the data, or a VECM in place of a VAR. A root close to 1 in a system of levels is expected if series are cointegrated.

## Reading the Johansen Cointegration Test

**Johansen Cointegration Test** gives trace and maximum eigenvalue statistics for the number of cointegrating vectors among integrated series. Testing runs sequentially from rank 0 upward, and the first rank not rejected is the estimate, following [Johansen (1991)](#ref-Joh1991a). The two statistics can disagree, and small samples tend to over-reject, so **VAR vs VECM** gives a useful second opinion through AIC and BIC at every rank on the same sample. The panel applies **Constant** as the deterministic term in that comparison, so differences from another setting of **Deterministic Terms** should be checked.

## Choosing Between Levels and an Error Correction Form

A VAR in levels stays consistent even under cointegration, but it does not impose the long-run restrictions, so long horizons are imprecise. A VECM gains precision when the rank is right, and it misleads when the rank is wrong. A low value in **VAR vs VECM** at some rank below n supports the restriction. Economic reasoning also counts: a relation with no theory behind it deserves suspicion. Bootstrap bands are not shown for VECM responses in the panel, because a levels bootstrap would drop the rank restriction.

## References

<a id="ref-Joh1991a"></a>Johansen, S. (1991). Estimation and Hypothesis Testing of Cointegration Vectors in Gaussian Vector Autoregressive Models. *Econometrica* 59(6), 1551. [doi:10.2307/2938278](https://doi.org/10.2307/2938278)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
