# SIS

## The SIS Equations

In the SIS model, recovered people become susceptible again at once:

- dS/dt = -beta S I / N + gamma I
- dI/dt = beta S I / N - gamma I

The system reduces to one logistic equation for I, since S = N - I, and can be solved in closed form. R0 = beta / gamma is the same as in SIR, though the long-run behaviour is entirely different.

## What the SIS Endemic Level Is

Above the threshold, infection settles at I* = N (1 - 1 / R0), and approaches it from any positive start without oscillating. At that level, each case replaces itself exactly. Below the threshold, infection dies out. The result stands in contrast to SIR, where an epidemic always ends: the supply of susceptible people here is never exhausted.

## Which Diseases SIS Describes

SIS fits infections that leave little or no protective immunity: some sexually transmitted bacterial infections are the classic examples, and the model is treated in the review of [Hethcote (2000)](#ref-Het2000a). Any immunity that lasts more than a short time compared with the infectious period is better described by SIRS. The endemic levels of the two models differ, and that difference is the most direct reason to choose between them.

## What Measures Change in an SIS Model

Reducing beta or shortening the infectious period lowers the endemic level continuously and removes the infection once R0 falls below 1. Near the threshold, the level falls steeply: a small push can remove a large share of cases. In a finite population, the disease can also die out by chance even above the threshold, an effect only a stochastic model can capture, such as the SIS tab of the Epidemics on Networks panel.

## References

<a id="ref-Het2000a"></a>Hethcote, H. W. (2000). The Mathematics of Infectious Diseases. *SIAM Review* 42(4), 599–653. [doi:10.1137/S0036144500371907](https://doi.org/10.1137/S0036144500371907)

## See Also
- [SIRS](sirs.md) · [SIR](sir.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
