# Regime Switching Models — Diagnostics

Diagnostics check whether the optimiser has found the best solution, whether the states make sense, and whether anything remains in the residuals.

## Stability Across Starting Values

**Stability Across Starting Values** refits the model from random starts and compares log-likelihoods. Identical values across starts suggest a solid optimum, allowing for rounding. Values that disagree show several local maxima, and only the highest should be used. A solution with a slightly lower likelihood can offer a very different regime description, which means the data do not sharply separate states. That check should come first, because the other diagnostics describe whichever solution happened to be found. Models with three or more regimes usually need many more starts.

## Reading Regime Probabilities

**Regime Probabilities** draws filtered probabilities, using data up to each date, above smoothed probabilities, using the whole sample. Good separation shows probabilities near 0 or 1 for most of the sample. Long stretches near 0.5 mean the model cannot tell the regimes apart. A regime that appears only briefly, with sharp spikes, may be capturing outliers rather than a recurrent state. Filtered probabilities show what could have been known in real time, so a recession dated only by the smoothed series was not visible when it happened, which is an important distinction for practical use.

## Reading Residual Checks for a Switching Model

**Residual Checks** computes residuals from the probability-weighted fit and applies Ljung-Box tests to the residuals and their squares, the Jarque-Bera test, and the residual ACF. Treat that output as a rough check only: these residuals are mixtures over regimes, so the tests do not have their textbook distributions. Autocorrelation in the residuals suggests adding lags. Correlation in squares suggests that volatility clustering remains and that **Markov-Switching ARCH** is worth a try. Non-normality alone is expected to some degree, since a mixture is not normal, and is not by itself a failure.

## Checks on the Number of Regimes

**Number of Regimes (AIC and BIC)** refits with 2, 3 and 4 regimes and compares information criteria. The method is a heuristic, because an extra regime has parameters that vanish under the smaller model, and so the regularity conditions behind the criteria fail. BIC typically favours fewer regimes than AIC. Beyond criteria, check that each new regime has a sensible duration, covers a meaningful number of observations, and has an interpretation. If a third regime appears for only a few dates, the likely explanation is outliers, and a heavier-tailed **Error distribution** may remove the need for it.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
