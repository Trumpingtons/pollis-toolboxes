# Neural Network Time-Series Forecasting — Diagnostics

Diagnostics answer two questions: whether training worked, and whether the trained model is any better than something trivial.

## Reading the Training Loss Curve

**Training Loss Curve** continues training and plots train and test loss per epoch. Both falling together means that training is working and that more **epochs** may help. Train falling while test rises indicates overfitting, and suggests stopping earlier or using a smaller model. Both flat at a high value means underfitting or an optimiser problem. A loss that jumps about suggests a learning rate that is too high. Any test metric used to select epochs is no longer an honest estimate, so keep a separate final sample for serious work.

## Checking Gradient Norms

**Gradient Norms** runs one backward pass and prints the L2 norm of each parameter array's gradient. Values near zero in early layers suggest vanishing gradients, in which case those layers barely learn. Very large values indicate exploding gradients, which can make loss jump or become `NaN`, and which gradient clipping or a lower learning rate can address. A message of no gradient means that a parameter array does not contribute to the loss, which often points to a wiring problem in a custom model.

## Reading Residuals and Prediction Plots

**Prediction vs Target** overlays in-sample fit and out-of-sample forecasts on the target. A forecast that looks like the target shifted by the horizon is a warning: the model has learned to repeat the latest value, which a good-looking plot can hide. **Residual Plot** shows out-of-sample errors and their distribution. Runs of same-sign errors suggest a level shift or a missed cycle. Errors that grow toward the end of the test sample suggest a change in the process, or drift away from the range seen in training.

## Testing Against a Naive Baseline

**Naive Baseline** compares test mean squared error with a last-value forecast, the random walk benchmark commonly recommended by [Hyndman and Athanasopoulos (2021)](#ref-HA2021a). For many financial and exchange-rate series, that benchmark is very hard to beat, and a network that loses to it adds nothing regardless of its complexity. **Swap Architecture** trains all four models with one split and one loop for an even comparison, using fixed default sizes rather than the current inputs. Differences between models should be read in light of variation across seeds.

## References

<a id="ref-HA2021a"></a>Hyndman, R. J. and Athanasopoulos, G. (2021). Forecasting: Principles and Practice. *OTexts*. [Link](https://otexts.com/fpp3/)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
