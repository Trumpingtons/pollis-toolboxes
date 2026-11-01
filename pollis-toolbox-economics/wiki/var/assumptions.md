# VAR Models — Assumptions

A VAR's few restrictions do not make it assumption-free. Stationarity, the lag structure and, above all, identification carry the results.

## Stationarity and the Stability Condition

Inference in a VAR assumes a stable system: every root of the characteristic polynomial lies outside the unit circle, and shocks die out. Non-stationary series in levels give non-standard distributions for many tests, and impulse responses that do not decay. Differencing restores stationarity but discards long-run information when series are cointegrated, which is what makes the VECM a separate model. [Lütkepohl (2005)](#ref-Lt2005a) covers the conditions. Structural breaks, frequent in macroeconomic samples, can look like unit roots and invalidate a single constant-parameter system.

## Lag Length and Omitted Variables

The lag order must be long enough that residuals are white noise, but each extra lag adds n squared coefficients. Too short a lag leaves serial correlation and biased responses, while too long a lag inflates the variance of impulse responses. A more important omission concerns variables: any relevant series left out of the system loads onto the shocks, and a so-called policy shock may then be a reaction to information the system misses. The FAVAR of [Bernanke, Boivin and Eliasz (2005)](#ref-BBE2005a) was motivated by that problem, which is called the information problem.

## Identifying Assumptions Are Not Testable

A reduced form cannot tell which shock is which, as many structural models produce the same fit. Recursive ordering assumes that certain variables do not respond within the period, a claim that depends on data frequency and is rarely beyond doubt. Long-run restrictions rely on a poorly measured infinite-horizon quantity, and they can be sensitive to small changes in low-frequency dynamics. [Kilian and Lütkepohl (2017)](#ref-KL2017a) treat all these approaches at length. Sign restrictions avoid zero assumptions but give a set of models instead of one, and they should be read that way.

## Cointegration Assumptions in a VECM

A VECM assumes that series are integrated of order one and that a stable linear combination exists. A chosen **r (Rank)** is a claim about economic structure, and the rest of the model depends on it. Short samples give tests with low power, and results may change with **Deterministic Terms**, which alter the limiting distribution of the Johansen test. Treating a long-run relation as real when it is not creates spurious equilibrium behaviour. Identifying beta needs a normalisation, so individual coefficients need care when r exceeds one.

## References

<a id="ref-BBE2005a"></a>Bernanke, B. S., Boivin, J. and Eliasz, P. (2005). Measuring the Effects of Monetary Policy: A Factor-Augmented Vector Autoregressive (FAVAR) Approach. *The Quarterly Journal of Economics* 120(1), 387–422. [doi:10.1162/0033553053327452](https://doi.org/10.1162/0033553053327452)

<a id="ref-KL2017a"></a>Kilian, L. and Lütkepohl, H. (2017). Structural Vector Autoregressive Analysis. *Cambridge University Press*. [doi:10.1017/9781108164818](https://doi.org/10.1017/9781108164818)

<a id="ref-Lt2005a"></a>Lütkepohl, H. (2005). New Introduction to Multiple Time Series Analysis. *Springer Berlin Heidelberg*. [doi:10.1007/978-3-540-27752-1](https://doi.org/10.1007/978-3-540-27752-1)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
