# Neural Network Time-Series Forecasting — Decision Guide

The architecture should follow the structure of the data, and any choice of architecture should be tested against a simple alternative.

## Which Neural Architecture to Choose

| Structure in the data | Tab | Reason |
|---|---|---|
| Short local patterns plus a long seasonal cycle | **LSTnet** | Convolution, recurrence, a skip for the cycle and a linear term |
| One target with several candidate drivers | **DA-RNN** | Attention over driving series and across time steps |
| Many variables with different periodicities | **TPA-LSTM** | Attention over patterns extracted from hidden states |
| Many correlated series, with parallel training preferred | **DSANet** | Global and local convolutions plus self-attention, no recurrence |

## How to Set the Input Window

**pool length** should cover the longest pattern that the model needs to see directly, and a longer window costs more parameters and slower training. For **LSTnet**, **skip length** should equal the period of the seasonal cycle in steps, since the skip connection links points one cycle apart. Check the autocorrelation function of the target to find a sensible period. When the cycle is long compared with the sample, prefer models with few parameters. Trying a few window lengths against the same test sample helps, but repeated trials reduce the honesty of the test error.

## How to Size and Train the Model

Start small: a few units in each layer and a short training run. Grow capacity only if train and test loss both remain high. Keep training only while test loss keeps falling. The **Training Loss Curve** shows when to stop, and the **Parameter Count** shows what each change costs. In the **DSANet** tab, **d-model** has the strongest effect on size. In the **TPA-LSTM** tab, **layers** adds cost quickly and rarely helps much on short samples, so one layer is the sensible start.

## When to Prefer a Simpler Forecaster

Short series, a single variable, or a need for intervals and explanation all point away from these networks. Choose the ARIMA Models panel or the Automatic Time-Series Forecasting panel when a few hundred observations are available, or when forecast intervals are a requirement. Comparisons reported in the literature often show classical benchmarks doing very well at low frequency. Reach for a network when the sample is large, the data are truly multivariate, and **Naive Baseline** and a linear model have already been beaten. Otherwise, the added cost is hard to justify.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
