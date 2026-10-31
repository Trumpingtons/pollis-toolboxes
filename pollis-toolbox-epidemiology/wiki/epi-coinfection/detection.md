# Detection

## How a Survey Is Simulated

At each time step, a share of hosts is drawn without replacement, and each is tested for each strain by `sample_populations`. A host infected with the strain tests negative with the False Negative Rate, and a host without it tests positive with the False Positive Rate. A strain counts as detected at that step if at least one sampled host tests positive, giving a table of strains by steps.

## False Positives Add Up Across a Survey

A small error per test becomes a large one for a survey. With n hosts tested for one strain at one step, the chance of at least one false positive is 1 - (1 - fp)^n, which climbs quickly with n. With many strains and steps, some false detections are nearly certain. Next Steps > False Positives Add Up shows the calculation. Declaring presence from a single positive is therefore unsafe unless it is confirmed.

## Sampling Against Test Quality

A strain is missed either because no infected host was sampled or because the test failed. At low prevalence, the first is the larger problem, and sampling more does more than a better test. Occupancy models treat the same question in ecology, by separating whether a species is present from whether it is detected ([MacKenzie, Nichols, Lachman, Droege, Royle and Langtimm (2002)](#ref-MNLDR...2002a)). Next Steps > Compare Sampling Effort and Compare Test Errors show each one separately.

## Correcting a Prevalence for Test Errors

Sampled positives give an apparent prevalence, and not the true one. The estimator of [Rogan and Gladen (1978)](#ref-RG1978a) corrects it with known sensitivity and specificity: true = (apparent + specificity - 1) / (sensitivity + specificity - 1). At low true prevalence, a small error in the stated specificity moves the result greatly, and the answer can even fall below zero. Test performance measured in another population may not apply to the one sampled.

## Why Co-occurrence in Detections Misleads

Two strains detected in the same step are not necessarily in the same host, because a survey that reports strains by step cannot say so. Both may also be detected falsely, or both be common for separate reasons. Next Steps > Apparent Co-occurrence compares how often two strains seem to circulate together in the survey with the truth, and Delay to First Detection gives the steps from a strain's real arrival to its first report.

## References

<a id="ref-MNLDR...2002a"></a>MacKenzie, D. I., Nichols, J. D., Lachman, G. B., Droege, S., Royle, J. A. and Langtimm, C. A. (2002). Estimating Site Occupancy Rates When Detection Probabilities Are Less Than One. *Ecology* 83(8), 2248–2255. [doi:10.1890/0012-9658(2002)083[2248:ESORWD]2.0.CO;2](https://doi.org/10.1890/0012-9658(2002)083[2248:ESORWD]2.0.CO;2)

<a id="ref-RG1978a"></a>Rogan, W. J. and Gladen, B. (1978). Estimating Prevalence from the Results of a Screening Test. *American Journal of Epidemiology* 107(1), 71–76. [doi:10.1093/oxfordjournals.aje.a112510](https://doi.org/10.1093/oxfordjournals.aje.a112510)

## See Also
- [Two Strains](two.md) · [Strain Community](community.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md)
