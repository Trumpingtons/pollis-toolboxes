# Neural Network Time-Series Forecasting — TPA-LSTM

The **TPA-LSTM** tab directs attention at patterns rather than at particular time steps, which suits variables with several periodicities.

## How Temporal Pattern Attention Works

[Shih, Sun and Lee (2019)](#ref-SSL2019a) note that standard temporal attention picks single steps and averages over variables, so it struggles when variables matter at different frequencies. An LSTM with **hidden size** units therefore runs first, with hidden states collected across the window. **filters** one-dimensional convolutions then slide over each row of that hidden-state matrix, extracting patterns over time. Attention is applied to those patterns, weighting each by its relevance to the current state. Attention can then pick out a variable and a frequency together.

## Choosing Inputs for TPA-LSTM

**filters** sets how many patterns attention can select from, and more filters mean more parameters in the attention step. **hidden size** sets the number of rows in the hidden-state matrix, and it has the same effect on cost. The filter size is fixed at 1 in the panel, so each filter works on one step at a time rather than across a longer span. **layers** adds LSTM depth, which is rarely needed for short samples. The window from **pool length** should include several cycles of the slowest period of interest.

## References

<a id="ref-SSL2019a"></a>Shih, S., Sun, F. and Lee, H. (2019). Temporal Pattern Attention for Multivariate Time Series Forecasting (TPA-LSTM). *Machine Learning* 108(8-9), 1421–1441. [doi:10.1007/s10994-019-05815-0](https://doi.org/10.1007/s10994-019-05815-0)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [LSTnet](lstnet.md)
