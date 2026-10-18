# Write an Exercise

A multiple-choice exercise whose data and answers Julia computes is a function: from a random number generator it returns the question, the choices with the correct one first, and the explanation. Each seed gives a version with other data and another order of the choices, so every student, or every attempt, can get its own.

## Two Kinds

| Kind | Data | Use for |
|---|---|---|
| Computed from data | Drawn from the generator; the choices are computed from them | Calculations: a statistic, a p-value, a prediction |
| Conceptual | None; the text is fixed and only the order of the choices changes | Concepts: choosing a method, reading a result |

## A Good Exercise

- **One question, one skill.** A question that needs two steps hides which step went wrong.
- **Data that look real.** Round the values to the precision people would record, and keep them in a plausible range.
- **Answers to a stated precision.** Give every numeric choice the same number of decimals, so the format gives nothing away.
- **An explanation that teaches.** Show the computation with the numbers of the version, and say which mistake each wrong choice comes from.

## Before Using It

1. Preview a few versions and read them as a student would.
2. Look for choices that coincide in many versions, and change the data until none do.
3. Look at the range of the correct answer across versions: extreme values make an exercise harder than intended.

## See Also

- [Writing the Choices](writing-the-choices.md)
