# Neural Network Time-Series Forecasting — Overview

All four tabs train with the same recipe. Each turns the series into overlapping windows of **pool length** steps, trains for a set number of **epochs** on the earlier windows with the Adam optimiser and mean squared error, and tests on the later windows.

## The LSTnet Tab

The **LSTnet** tab builds `LSTnet(inputsize, conv filters, recur size, pool length, skip length)`, the design of [Lai, Chang, Yang and Liu (2018)](#ref-LCYL2018a). A convolution finds short local patterns across the series. A GRU summarises them over time, and a second recurrent component with a **skip length** jumps across whole seasonal cycles, so that very long dependencies do not have to pass through many steps. A linear autoregressive term is added to the output, which keeps forecasts on the right scale when the series shifts in level.

## The DA-RNN Tab

The **DA-RNN** tab builds `DARNN(inputsize, encoder size, decoder size, pool length, 1)`, in which 1 marks the target series. The dual-stage architecture of [Qin, Song, Chen, Cheng, Jiang and Cottrell (2017)](#ref-QSCCJ...2017a) applies attention twice. An input attention stage weighs the driving series at each step before encoding, and a temporal attention stage in the decoder weighs the encoder states across the time steps of the window. The design fits a setting with one clear target and several candidate drivers, where both variable selection and lag selection matter.

## The TPA-LSTM Tab

The **TPA-LSTM** tab builds `TPALSTM(inputsize, hidden size, pool length, layers, filters, 1)`, whose final argument fixes the filter size. [Shih, Sun and Lee (2019)](#ref-SSL2019a) first run an LSTM and then apply convolutional filters across its hidden states over time. Attention then selects among those filtered patterns, instead of among single time steps. That arrangement suits many series with different periodicities, because attention can weigh variables differently and can detect patterns that spread across several steps. **layers** adds depth to the LSTM, and **filters** sets the number of patterns attention can select.

## The DSANet Tab

The **DSANet** tab builds `DSANet(inputsize, pool length, local length, kernels, d-model, 1, 1, 1, 1)`, following [Huang, Wang, Wu and Tang (2019)](#ref-HWWT2019a). Each series first passes through two parallel convolutions, a global one covering the entire window and a local one of **local length** steps. Self-attention then relates the series to each other, and an autoregressive component handles scale. The architecture has no recurrence, so it can be parallelised. The panel fixes the remaining arguments at a hidden size of 1, one layer, one attention head and one output series, keeping the model small.

## Common Workflow for Training a Neural Forecaster

1. Choose an architecture, a **pool length** and **epochs**.
2. Check training with **Training Loss Curve** and **Gradient Norms**.
3. See the fit with **Prediction vs Target** and **Residual Plot**.
4. Test the value of the model with **Naive Baseline** and **Swap Architecture**.
5. Read **Parameter Count** and **Attention Weights**.
6. Use **Forecast Horizon**, and store the result with **Save Model**.

## References

<a id="ref-HWWT2019a"></a>Huang, S., Wang, D., Wu, X. and Tang, A. (2019). DSANet: Dual Self-Attention Network for Multivariate Time Series Forecasting. *CIKM*, 2129–2132. [doi:10.1145/3357384.3358132](https://doi.org/10.1145/3357384.3358132)

<a id="ref-LCYL2018a"></a>Lai, G., Chang, W., Yang, Y. and Liu, H. (2018). Modeling Long- and Short-Term Temporal Patterns with Deep Neural Networks (LSTNet). *SIGIR*, 95–104. [doi:10.1145/3209978.3210006](https://doi.org/10.1145/3209978.3210006)

<a id="ref-QSCCJ...2017a"></a>Qin, Y., Song, D., Chen, H., Cheng, W., Jiang, G. and Cottrell, G. W. (2017). A Dual-Stage Attention-Based Recurrent Neural Network for Time Series Prediction (DA-RNN). *IJCAI*, 2627–2633. [doi:10.24963/ijcai.2017/366](https://doi.org/10.24963/ijcai.2017/366)

<a id="ref-SSL2019a"></a>Shih, S., Sun, F. and Lee, H. (2019). Temporal Pattern Attention for Multivariate Time Series Forecasting (TPA-LSTM). *Machine Learning* 108(8-9), 1421–1441. [doi:10.1007/s10994-019-05815-0](https://doi.org/10.1007/s10994-019-05815-0)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
