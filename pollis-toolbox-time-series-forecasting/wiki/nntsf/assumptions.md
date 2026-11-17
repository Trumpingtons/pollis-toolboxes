# Neural Network Time-Series Forecasting — Assumptions

A neural forecaster makes few explicit statistical assumptions, but several practical ones determine whether its forecasts can be trusted.

## Stable Patterns Over Time

Training assumes that patterns in the earlier windows persist into later ones. A network learns no causal structure, so a change in the process that generated the data can make its forecasts much worse with no warning from training metrics. Rolling retraining reduces the problem and costs compute. Trending or non-stationary series are especially hard, since test values may fall outside the range seen in training, and an autoregressive term helps only partly. Differencing or scaling before training often matters as much as the architecture itself.

## Window and Horizon Choices

Each input is a window of **pool length** steps, so anything older than that window is visible only through the skip connection or not at all. A window should cover at least the main cycles of the series, otherwise the network cannot use them. The label must lie strictly after the window, or the model would see the value it should predict. Windows overlap heavily, so their number overstates the amount of independent information. For that reason, a chronological split is necessary, and a random split would leak future values into training.

## Enough Data for the Capacity

Deep architectures need many observations relative to their parameters. [Goodfellow, Bengio and Courville (2016)](#ref-GBC2016a) treat capacity and generalisation at length: a model with more parameters than windows can fit the training data almost exactly and learn nothing useful. **Parameter Count** gives the relevant number. Larger sizes for **hidden size**, **recur size**, **encoder size** or **d-model** raise capacity quickly, especially in attention layers. Short samples call for small models, few **epochs**, and comparison against a linear benchmark before more complexity is added.

## Reproducibility and Optimisation

Weights begin at random values, and training reaches a local minimum, not a unique solution. Results therefore vary with the seed, the learning rate and the number of **epochs**. Fixing a seed makes a run repeatable, but it does not show how much the outcome depends on that seed. A comparison between architectures should use several seeds, because one lucky initialisation can reverse a ranking. The panel uses FluxArchitectures.jl, which pins Flux 0.13, so its code uses the implicit parameter style of that version and not the newer explicit form.

## References

<a id="ref-GBC2016a"></a>Goodfellow, I., Bengio, Y. and Courville, A. (2016). Deep Learning. *MIT Press*. [Link](https://www.deeplearningbook.org)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
