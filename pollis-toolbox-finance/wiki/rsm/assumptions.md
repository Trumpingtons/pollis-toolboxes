# Regime Switching Models — Assumptions

A switching model assumes a particular kind of hidden structure, which the data can only partly confirm. Four assumptions deserve attention.

## First-Order Markov Dynamics

The current regime is taken to depend only on the previous regime, through fixed transition probabilities. Durations then follow a geometric distribution, so the chance of leaving a regime does not depend on how long the regime has lasted. Real recessions and crises may not behave that way. Time-varying transitions relax the fixed probabilities but keep the Markov structure given the drivers. Regimes must also be recurrent, with more than one visit in the sample, or the transition probabilities out of a state are effectively estimated from one event.

## Within-Regime Stability

Within a regime, parameters are taken as constant and errors as independent draws from the chosen distribution. A two-regime model then implies a mixture distribution, so fat tails can arise purely from switching. If real variance also clusters within regimes, the plain regression will force the extra clustering into its regime probabilities, and the states will end up tracking volatility rather than the mean relationship of interest. Use **Markov-Switching ARCH** in that case. Autocorrelated residuals within regimes similarly call for lags through **Markov-Switching Autoregression**.

## Identification and Local Maxima

Regime numbering is arbitrary, since swapping two labels leaves the likelihood unchanged, so a fit can return the same model with the labels reversed. The likelihood often has several local maxima, and a poor start can yield a regime that captures only a handful of observations. A regime variance close to zero is a warning of such a spurious solution, since the likelihood can grow without limit around one observation. The panel fixes a random seed for reproducibility, but a fixed seed does not ensure a global optimum, so repeated starts remain necessary.

## Exogenous Drivers and Regressors

**Transition drivers** are assumed to be exogenous to the current regime. A volatility index measured at the same date as a crisis partly reflects the crisis and will appear to predict it; a lag is the simplest remedy, though it does not remove all feedback. Switching and non-switching regressors must have the same number of rows as the data, and they are treated as fixed. With endogenous regressors, the regime coefficients inherit the usual bias, which the hidden state cannot correct. **Non-switching regressors** should be used where theory says a slope is stable, because each switching slope costs k parameters.

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
