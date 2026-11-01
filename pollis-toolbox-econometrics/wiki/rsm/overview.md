# Regime Switching Models — Overview

All four tabs share a hidden state s(t) that follows a first-order Markov chain with a transition matrix P, and a likelihood computed with the filter of [Hamilton (1989)](#ref-Ham1989a). Each tab decides what depends on s(t). An accessible textbook account of the framework is in [Guidolin and Pedio (2018)](#ref-GP2018a).

## The Markov-Switching Regression Tab

The **Markov-Switching Regression** tab fits `MSModel` on the **Data variable** with **Regimes k** states. **Intercept** decides whether the constant switches, stays common or is left out. **Switching regressors** have slopes that differ by regime, passed as `exog_switching_vars`, and **Non-switching regressors** share a slope, passed as `exog_vars`. **Variance** sets whether each regime has its own error variance, which is the usual choice, and **Error distribution** sets normal, Student-t or GED errors. `summary_msm` prints the coefficients for each regime, the transition matrix and the expected durations.

## The Markov-Switching Autoregression Tab

The **Markov-Switching Autoregression** tab builds lags with `add_lags`, using **AR lags p**, and treats them as switching regressors, which drops the first p observations. A series can then have a different persistence in each regime, and a different mean-reversion speed. The specification is close to, but not the same as, the original model of [Hamilton (1989)](#ref-Ham1989a), in which the mean itself switches and lagged deviations depend on earlier states. For the dynamic linear models that generalise that case, [Kim (1994)](#ref-Kim1994a) gives an approximate filter.

## The Markov-Switching ARCH Tab

The **Markov-Switching ARCH** tab uses `MSARCHModel`, giving each regime its own ARCH process of **ARCH order q**. Volatility can then cluster inside a regime and also jump when the regime changes, so that a high-volatility crisis state is distinguished from ordinary clustering. A GARCH model with one regime often shows very high persistence when the true cause is a level shift in volatility. [Haas, Mittnik and Paolella (2004)](#ref-HMP2004a) describe regime-specific variance processes that keep the likelihood tractable by avoiding dependence on the entire path of states.

## The Time-Varying Transitions Tab

The **Time-Varying Transitions** tab passes **Transition drivers** as `exog_tvtp`, with a constant added, so that switching probabilities become logistic functions of those variables, as in [Filardo (1994)](#ref-Fil1994a). The chance of moving from calm to crisis may then depend on a credit spread or on a volatility index. Lagging the driver keeps it known at the time of the transition and limits feedback from the regime to the variable. The approach adds parameters to an already hard likelihood, so a small number of well-motivated drivers works best, ideally one.

## Common Workflow for a Switching Model

1. Choose **Regimes k** and fit, starting from two.
2. See the states with **Regime Probabilities** and **Series Coloured by Regime**.
3. Read **Coefficients by Regime** and **Transition Matrix and Durations**.
4. Run **Stability Across Starting Values** and **Residual Checks**.
5. Compare specifications with **Number of Regimes (AIC and BIC)** and **Specification Search**.
6. Forecast with **One-Step-Ahead Forecasts** and **Simulated Paths and Value-at-Risk**.

## References

<a id="ref-Fil1994a"></a>Filardo, A. J. (1994). Business-Cycle Phases and Their Transitional Dynamics. *Journal of Business and Economic Statistics* 12(3), 299–308. [doi:10.1080/07350015.1994.10524545](https://doi.org/10.1080/07350015.1994.10524545)

<a id="ref-GP2018a"></a>Guidolin, M. and Pedio, M. (2018). Markov Switching Models. *Essentials of Time Series for Financial Applications*, 329–379. [doi:10.1016/B978-0-12-813409-2.00009-1](https://doi.org/10.1016/B978-0-12-813409-2.00009-1)

<a id="ref-HMP2004a"></a>Haas, M., Mittnik, S. and Paolella, M. S. (2004). A New Approach to Markov-Switching GARCH Models. *Journal of Financial Econometrics* 2(4), 493–530. [doi:10.1093/jjfinec/nbh020](https://doi.org/10.1093/jjfinec/nbh020)

<a id="ref-Ham1989a"></a>Hamilton, J. D. (1989). A New Approach to the Economic Analysis of Nonstationary Time Series and the Business Cycle. *Econometrica* 57(2), 357. [doi:10.2307/1912559](https://doi.org/10.2307/1912559)

<a id="ref-Kim1994a"></a>Kim, C. (1994). Dynamic Linear Models with Markov-Switching. *Journal of Econometrics* 60(1-2), 1–22. [doi:10.1016/0304-4076(94)90036-1](https://doi.org/10.1016/0304-4076(94)90036-1)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
