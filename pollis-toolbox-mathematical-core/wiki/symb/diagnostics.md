# Symbolic Math — Diagnostics

Checks exist because simplification heuristics and regression can both fail silently. Two independent checks, one symbolic and one numeric, are inexpensive.

## Reading the Symbolic Check

**Symbolic Check** verifies the result symbolically: the simplified and expanded forms equal the original, the antiderivative differentiates back to the integrand, and the roots make the equation hold. Zero means verified. A non-zero result does not always mean a wrong answer, since `simplify` may fail to recognise that a complicated expression is zero, for example a trigonometric identity. In that situation, rely on **Numeric Check** at several points. A verified zero is good evidence of correctness, within the domain where the expression is defined.

## Reading the Numeric Check

**Numeric Check** compares the symbolic result with a plain numerical method at points in the interval: finite differences for derivatives, the trapezoid rule for integrals, evaluation near the point for limits, and evaluation at the roots. Small errors confirm the result. The errors should be in line with the accuracy of the numerical method rather than machine precision, because finite differences and the trapezoid rule have errors of their own. Choose **From** and **To** to avoid singularities, since a large error at a pole says nothing about the formula.

## Reading the Unintegrated Part

An integral in the **Integration** tab returns an unintegrated part and a numerical error along with the antiderivative. An empty remainder and a small error indicate a success. A non-zero remainder means the method could not express part of the integrand, so the antiderivative is partial, and a plain definite integral value may then be `nothing`. Rewriting the integrand can help, since the candidate terms depend on its form: expanding a product or substituting by hand sometimes brings an integral into reach. A numerical integral remains available when no formula is found.

## Spotting Domain Problems

A formula can look fine and still fail at some points. **Function Plot** shows the expression over the interval, overlaid with the result, so vertical lines at poles and jumps in a supposed antiderivative are visible. **Value Table** shows values at evenly spaced points, which reveals infinities or `NaN`. A definite integral across a singularity can give a finite number that has no meaning, because the fundamental theorem of calculus needs a continuous integrand. Check the interval in such cases before reporting any value, and treat the result with suspicion if a pole lies inside it.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
