# Diagnostics

## Did the Messages Converge

Next Steps > Convergence shows how the change in the messages falls from one iteration to the next. A run that reaches its Largest Number of Iterations without settling should not be read. The usual remedy is to raise Damping, which makes each round change less, and to allow more iterations. A message cutoff keyword is also used in the Example Code, and needs to be kept for the runs to converge.

## Are the Risks Calibrated

Next Steps > Calibration groups people by estimated risk and compares each group with the share really infected. A calibrated method gives about one infected person in five among those given a risk of about one in five. Calibration can only be checked where the truth is known, so that it is done on simulations with the same contacts and rates as the real problem. Sparse groups at high risk make those points noisy.

## Comparing the No-Tests Estimate with Simulation

With no tests at all, inference reduces to prediction, and should match the mean of many simulated epidemics. Next Steps > Against Simulation, With No Tests makes this comparison. The small-coupling estimate can come out too high against simulation, and a clear gap at a chosen infection rate is a warning about the approximation. Tests pull the estimates toward the truth, so that the gap usually narrows as tests are added.

## Measuring a Ranking with an ROC Curve

The ranking of people by risk is measured by the ROC curve ([Fawcett (2006)](#ref-Faw2006a)), which plots infected people found against uninfected people wrongly flagged, along the ranked list. Its area is the chance that a randomly chosen infected person ranks above a randomly chosen uninfected one ([Hanley and McNeil (1982)](#ref-HM1982a)), so that 0.5 means no information. The area is computed only on people never tested, since the tests themselves would otherwise flatter it. It is undefined if nobody untested is infected.

## Testing the Result Against a Simple Rule

Next Steps > Compare With a Simple Rule sets the method against counting each person's contacts who tested positive. If the simple rule does as well, the result is not worth the method's memory and time. The difference usually grows when tests are few and epidemics are at an early stage, and often shrinks when most contacts of a person have already tested positive.

## References

<a id="ref-Faw2006a"></a>Fawcett, T. (2006). An introduction to ROC analysis. *Pattern Recognition Letters* 27(8), 861–874. [doi:10.1016/j.patrec.2005.10.010](https://doi.org/10.1016/j.patrec.2005.10.010)

<a id="ref-HM1982a"></a>Hanley, J. A. and McNeil, B. J. (1982). The meaning and use of the area under a receiver operating characteristic (ROC) curve. *Radiology* 143(1), 29–36. [doi:10.1148/radiology.143.1.7063747](https://doi.org/10.1148/radiology.143.1.7063747)

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
