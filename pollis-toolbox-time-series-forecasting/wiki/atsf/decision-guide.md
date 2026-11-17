# Advanced Time-Series Forecasting — Decision Guide

The first choice in Advanced Time-Series Forecasting is the tab, and the shape of the series decides it. The choices inside each tab come after.

## Which Advanced Forecasting Tab Fits a Series

| Shape of the series | Tab | Why |
|---|---|---|
| Several seasonal cycles, or a non-integer period | **BATS / TBATS** | Fits many cycles in one model |
| A trend with no strong cycle, and a quick benchmark wanted | **Theta Method** | Few parameters and fast |
| Many periods of zero | **Intermittent Demand** | Treats size and interval apart |
| One regular cycle with a monthly or quarterly period | A standard ETS or ARIMA model first | Simpler models suit the simple case |
| Regressors such as prices or holidays | Another model | None of the three takes regressors here |

## Should I Use BATS or TBATS

Choose TBATS through the **Model** input in most cases: non-integer periods, long cycles and several cycles at once are all easier in trigonometric form. BATS is a reasonable choice for short, whole-number periods where the seasonal shape is sharp, since it estimates one state for each point of the cycle. On a long period such as 168 or 8766, BATS has many initial values to estimate and fits slowly. When both are possible, compare their `aic` values on the same series, then check the result with **Holdout Accuracy**.

## Which Theta Variant Should I Choose

| **Variant** | Theta | Trend line | Use when |
|---|---|---|---|
| STM | Fixed at 2 | One line over the sample | A quick benchmark is wanted, or the series is short |
| OTM | Estimated | One line over the sample | The trend is steady and a better fit is worth one more parameter |
| DSTM | Fixed at 2 | Updated each period | The trend changes slowly and the series is short |
| DOTM | Estimated | Updated each period | The trend changes and the series is long |

`auto_theta(y, period)` chooses among the four by in-sample mean squared error and adjusts for seasonality when a test finds it, so it is the better call on a seasonal series. The variants were set out by [Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-FPLPK2016a).

## How to Tell Whether Demand Is Intermittent

**Demand Pattern** computes two numbers: ADI, the average interval between demands, and CV2, the squared coefficient of variation of the demand sizes. The cut-offs of ADI 1.32 and CV2 0.49 come from [Syntetos, Boylan and Croston (2005)](#ref-SBC2005a).

| Pattern | ADI | CV2 | Reading |
|---|---|---|---|
| Smooth | Below 1.32 | Below 0.49 | Demand most periods, of similar size: ordinary smoothing suits |
| Erratic | Below 1.32 | 0.49 or above | Demand most periods, of varying size |
| Intermittent | 1.32 or above | Below 0.49 | Demand in few periods, of similar size |
| Lumpy | 1.32 or above | 0.49 or above | Demand in few periods, of varying size: the hardest case |

## Which Croston Method Should I Choose

Start from `sba`, the default of the **Method** input, which removes most of the upward bias of the classic rate ([Syntetos and Boylan (2005)](#ref-SB2005a)). The `classic` method suits a comparison, or a very low smoothing parameter where the bias is small. The `sbj` method applies another correction for the same bias ([Shale, Boylan and Johnston (2006)](#ref-SBJ2006a)), and differs little from `sba` unless the smoothing parameter of the interval is large.

## When These Methods Are Not the Right Choice

Do not use Croston's method for a product with a clear trend or an end of life, as the flat rate will keep forecasting the past average. Do not fit `theta` directly to a seasonal series, as it makes no seasonal adjustment. A very short series gives BATS and TBATS too little to choose among, so prefer a Theta benchmark until two or more full cycles are available. For several related series, or when a neural network is wanted, the other forecasting panels are a better start.

## References

<a id="ref-FPLPK2016a"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for optimising the theta method and their relationship to state space models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

<a id="ref-SBJ2006a"></a>Shale, E. A., Boylan, J. E. and Johnston, F. R. (2006). Forecasting for intermittent demand: the estimation of an unbiased average. *Journal of the Operational Research Society* 57(5), 588–592. [doi:10.1057/palgrave.jors.2602031](https://doi.org/10.1057/palgrave.jors.2602031)

<a id="ref-SB2005a"></a>Syntetos, A. A. and Boylan, J. E. (2005). The accuracy of intermittent demand estimates. *International Journal of Forecasting* 21(2), 303–314. [doi:10.1016/j.ijforecast.2004.10.001](https://doi.org/10.1016/j.ijforecast.2004.10.001)

<a id="ref-SBC2005a"></a>Syntetos, A. A., Boylan, J. E. and Croston, J. D. (2005). On the categorization of demand patterns. *Journal of the Operational Research Society* 56(5), 495–503. [doi:10.1057/palgrave.jors.2601841](https://doi.org/10.1057/palgrave.jors.2601841)

## See Also

- [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md)
