# Neural Network Time-Series Forecasting — LSTnet

The **LSTnet** tab combines convolutional, recurrent and linear components, each aimed at a different time scale.

## How the LSTnet Architecture Works

[Lai, Chang, Yang and Liu (2018)](#ref-LCYL2018a) stack four parts. A convolutional layer with **conv filters** filters finds short patterns across series. A GRU of **recur size** units handles medium-term dependencies. A second recurrent part with **skip length** connects points one cycle apart, so a daily cycle in hourly data links every 24th step. A linear autoregressive part is added at the end, keeping the scale of the output responsive to the scale of the input, which nonlinear parts handle poorly. The final prediction sums the neural and linear components.

## Choosing Inputs for LSTnet

**skip length** matters most, and it should match the dominant period of the data in steps. A value larger than the window has little to act on, and data with no clear cycle gain little from the skip part. **conv filters** and **recur size** set capacity, and small values are a sensible start. Keep **pool length** long enough to include several local patterns. If forecasts miss the level after a shift, look at the autoregressive component, and check the scaling of inputs before enlarging the network.

## References

<a id="ref-LCYL2018a"></a>Lai, G., Chang, W., Yang, Y. and Liu, H. (2018). Modeling Long- and Short-Term Temporal Patterns with Deep Neural Networks (LSTNet). *SIGIR*, 95–104. [doi:10.1145/3209978.3210006](https://doi.org/10.1145/3209978.3210006)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [DA-RNN](darnn.md)
