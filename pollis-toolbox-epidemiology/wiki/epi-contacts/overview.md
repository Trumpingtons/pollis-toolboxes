# Overview

Each tab of the Inference on Contact Networks panel simulates an epidemic and its tests, and then runs the inference on the tests alone, so that the result can be compared with what really happened. To use real records, replace the simulated contacts and tests.

## What the Disease and Network Inputs Mean

**Disease** is SI, SIR, SIS or SIRS, in Individual Risk and Changing Contacts. **People** and **Contacts per Person** set the network. **Infection** is the daily chance of passing infection on one contact, and **Recovery** and **Loss of Immunity** apply to the disease chosen. **Days** is the length of the run, and **First Cases** the number infected at the start, a number that inference on the First Cases tab is told.

## What the Test Inputs Mean

**Tested per Day** and **First Day of Testing** set the routine of testing, and **Tested on the Last Day** adds a final round. **False Positive** and **False Negative** are the test errors, used both to produce the results and to read them. A recovered person tests negative, so that a negative result does not mean that a person was never infected.

## What the Solver Inputs Mean

**Largest Number of Iterations** limits the rounds of messages. **Damping** is the share of the old message kept at each round, which should be raised if the messages do not converge. Memory grows with the square of People times the number of days, which sets a limit on the size of network the method can handle on one computer.

## Common Workflow for Inference on Contacts

1. **Run Individual Risk** and look at Risk of Untested People.
2. **Diagnose**: Convergence first, then Calibration.
3. **Predict**: Risk Ahead and Whom to Test First.
4. **Compare**: With a Simple Rule, and with less testing or a wrong rate.
5. **Interpret**: Read the Risk of One Person and Read the Ranking.
6. **Try First Cases or Changing Contacts**, if the question is about the origin or about contacts that change.

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Individual Risk](risk.md) · [First Cases](source.md) · [Changing Contacts](changing.md)
