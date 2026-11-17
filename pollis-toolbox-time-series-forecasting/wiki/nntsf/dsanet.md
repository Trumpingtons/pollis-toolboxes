# Neural Network Time-Series Forecasting — DSANet

The **DSANet** tab replaces recurrence entirely with convolution and self-attention, which allows parallel computation.

## How the Dual Self-Attention Network Works

[Huang, Wang, Wu and Tang (2019)](#ref-HWWT2019a) process each series through two paths. A global temporal convolution covers the whole window and produces one feature vector per series. A local temporal convolution with a short kernel of **local length** captures recent patterns and pools them. Each path then has self-attention across the series, which learns how the variables depend on each other. The outputs combine through a dense layer, and an autoregressive component is added to keep the output scale responsive to the input scale.

## Choosing Inputs for DSANet

**kernels** sets the number of convolutional filters in each path, and **d-model** sets the width of the attention module, usually the input with the greatest effect on size. **local length** should be short relative to **pool length**, enough to capture a recent pattern. The panel fixes one attention layer, one head and a hidden size of 1, so capacity is deliberately limited. Models with no recurrence still train with the same recipe here, and the benefit of parallelism depends on hardware rather than on the architecture alone.

## References

<a id="ref-HWWT2019a"></a>Huang, S., Wang, D., Wu, X. and Tang, A. (2019). DSANet: Dual Self-Attention Network for Multivariate Time Series Forecasting. *CIKM*, 2129–2132. [doi:10.1145/3357384.3358132](https://doi.org/10.1145/3357384.3358132)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [LSTnet](lstnet.md)
