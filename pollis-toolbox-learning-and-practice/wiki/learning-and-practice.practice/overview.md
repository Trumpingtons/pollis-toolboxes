# Practice

Multiple-choice exercises whose data and answers Julia computes. Each topic is a tab; each exercise asks one question with four choices.

## How an Exercise Is Made

- **The data** come from a random number generator started from the **Seed**. The same seed gives the same exercise again; another seed gives other data.
- **The answers** are computed from those data, so they are always right, whatever the numbers.
- **The wrong choices** are the usual mistakes: dividing by $n$ instead of $n - 1$, the variance instead of the standard deviation, the one-sided instead of the two-sided p-value, the slope of the wrong regression.
- **The order of the choices** is shuffled, so the correct one is not always in the same place.

## A Practice Session

1. Pick a topic (the tab) and an exercise.
2. Run the Example Code: the question and the choices A to D appear in the Julia REPL.
3. Work the answer out, on paper or in Julia, and pick it under **Your Answer**.
4. Under Next Steps, **Check My Answer** says whether it is correct and explains the answer. **Show the Answer** gives the explanation without answering.
5. Change the **Seed** and run again for new data.

## Working the Answer Out in Julia

The Example Code leaves the data in the REPL, so you can compute the answer yourself before you check it, with the functions of the Statistics standard library (`mean`, `median`, `std`, `var`, `cor`, `cov`) and of Distributions.jl (`cdf`, `ccdf`, `quantile`).

## See Also

- [Descriptive Statistics](descriptive-statistics.md)
- [Hypothesis Tests](hypothesis-tests.md)
- [Linear Regression](linear-regression.md)
