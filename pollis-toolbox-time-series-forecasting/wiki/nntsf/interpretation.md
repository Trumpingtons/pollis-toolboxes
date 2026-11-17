# Neural Network Time-Series Forecasting — Interpretation

Interpreting a network focuses on forecast skill and on input importance, because individual weights carry no meaning.

## Reading Test Error

Test mean squared error is measured on later windows that training did not use, in the normalised units of the data. Absolute values therefore depend on scaling, so compare models on the same target only, and convert to original units before reporting a figure. A ratio to the **Naive Baseline** error is the most useful summary: below 1 means real skill over a last-value forecast. A small improvement might not survive a different split, and a single split offers no indication of uncertainty.

## What the Attention Weights Action Shows

**Attention Weights** does not read the internal attention layers. The action reports permutation importance instead: shuffle one series, or one time step, across test windows, and record how much the test error rises. A large rise means that the model relies on that input, and a rise near zero means that it does not. Correlated inputs can substitute for one another, so a useful series may appear unimportant. Importance also describes what this trained network uses, not what is causally relevant in the world.

## Reading Parameter Count

**Parameter Count** totals the trainable parameters. Compare the count with the number of training windows, keeping in mind that windows overlap. A count far above the number of independent observations calls for careful attention to test performance. Counts also make architectures comparable on cost, because two models with similar test error but very different sizes should favour the smaller. DA-RNN and TPA-LSTM grow with their attention sizes, while LSTnet grows with its filters and recurrent units.

## Reading Forecasts and Saved Models

**Forecast Horizon** forecasts the target a fixed number of steps after the latest window, beyond every label used, on the normalised scale. The output is a single value without an interval. Direct uncertainty can be approximated by training several seeds and looking at the spread, though this reflects training variation and not the full forecast error. **Save Model** serialises the network with BSON.jl, and the same scaling and window length must be applied when the model is loaded again, or its forecasts will be meaningless.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
