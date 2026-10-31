# Interpretation

## What R0 Means, and What It Does Not

The basic reproduction number R0 is the mean number of secondary cases from one case in a fully susceptible population. It is a threshold: above 1 an epidemic can grow, and below 1 it cannot. Its general definition for models with many states is the next-generation matrix of [van den Driessche and Watmough (2002)](#ref-DW2002a). R0 is not a constant of the disease alone, since it depends on the contacts and conditions of each population ([Anderson and May (1991)](#ref-AM1991a)), and it says nothing by itself about speed.

## The Effective Reproduction Number During a Wave

As susceptible people are used up, each case infects fewer others. The effective number is R0 S / N, and an epidemic turns from growth to decline exactly when this crosses 1. The turning point therefore does not need any intervention, which is why a falling curve alone is not evidence that a measure worked.

## What the Herd Immunity Threshold Measures

The threshold 1 - 1 / R0 is the immune share at which a new case infects fewer than one other, on average. It assumes random mixing and evenly distributed immunity. It is not the same as the final size: an uncontrolled epidemic goes past the threshold, because cases that exist at the turning point still infect others. [Fine (1993)](#ref-Fin1993a) traces how the idea has been used and misused.

## Reading Peak Height, Peak Timing and Final Size

Peak height decides the load on hospitals, and final size decides the total burden. Peak timing depends strongly on the seed and on early chance, and is the least reliable. Slowing transmission a little lowers the peak a lot more than the final size, which is the reasoning behind flattening a curve. A measure lifted early only delays the wave, as the Intervention Timing action can show.

## How Far a Model Result Can Be Taken as a Forecast

A compartmental run is a statement about its assumptions, and not a forecast. Reported results are best kept as comparisons between scenarios under the same assumptions: the differences are more stable than the levels. An operational forecast needs data and a way to update parameters from them, as in [Ghostine, Gharamti, Hassrouny and Hoteit (2021)](#ref-GGHH2021a), who combine an extended SEIR model with an ensemble Kalman filter.

## References

<a id="ref-AM1991a"></a>Anderson, R. M. and May, R. M. (1991). *Infectious Diseases of Humans: Dynamics and Control*. Oxford University Press.

<a id="ref-DW2002a"></a>van den Driessche, P. and Watmough, J. (2002). Reproduction numbers and sub-threshold endemic equilibria for compartmental models of disease transmission. *Mathematical Biosciences* 180(1-2), 29–48. [doi:10.1016/S0025-5564(02)00108-6](https://doi.org/10.1016/S0025-5564(02)00108-6)

<a id="ref-Fin1993a"></a>Fine, P. E. M. (1993). Herd Immunity: History, Theory, Practice. *Epidemiologic Reviews* 15(2), 265–302. [doi:10.1093/oxfordjournals.epirev.a036121](https://doi.org/10.1093/oxfordjournals.epirev.a036121)

<a id="ref-GGHH2021a"></a>Ghostine, R., Gharamti, M., Hassrouny, S. and Hoteit, I. (2021). An Extended SEIR Model with Vaccination for Forecasting the COVID-19 Pandemic in Saudi Arabia Using an Ensemble Kalman Filter. *Mathematics* 9(6), 636. [doi:10.3390/math9060636](https://doi.org/10.3390/math9060636)

## See Also
- [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
