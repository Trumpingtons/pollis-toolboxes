# Neural Network Time-Series Forecasting — DA-RNN

The **DA-RNN** tab focuses on one target with several drivers, and it reveals which drivers and which lags the model uses.

## How the Dual-Stage Attention Works

[Qin, Song, Chen, Cheng, Jiang and Cottrell (2017)](#ref-QSCCJ...2017a) use two attention stages. The encoder has **encoder size** units, and at each step, input attention assigns a weight to each driving series based on the previous encoder state, so that irrelevant series are downweighted. The decoder has **decoder size** units, and temporal attention assigns a weight to each encoder state across the window, so that relevant past steps count more. A prediction then combines the decoder state with its attention context. The architecture is close to the encoder-decoder design used in translation.

## Choosing Inputs for DA-RNN

Set **encoder size** and **decoder size** to similar, modest values, and increase them only with evidence of underfitting. The window from **pool length** bounds the lags temporal attention can reach. A recurrent model processes the steps in order, so training slows with long windows and many drivers. If only a few drivers matter, removing the others often helps more than attention does. **Attention Weights** gives a practical check, since permuting a series with no effect on test error suggests that the series can be dropped.

## References

<a id="ref-QSCCJ...2017a"></a>Qin, Y., Song, D., Chen, H., Cheng, W., Jiang, G. and Cottrell, G. W. (2017). A Dual-Stage Attention-Based Recurrent Neural Network for Time Series Prediction (DA-RNN). *IJCAI*, 2627–2633. [doi:10.24963/ijcai.2017/366](https://doi.org/10.24963/ijcai.2017/366)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [LSTnet](lstnet.md)
