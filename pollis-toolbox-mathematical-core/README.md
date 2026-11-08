# Core Mathematics Toolbox

The Pollis Core Mathematics Toolbox brings symbolic and numerical mathematics to Pollis: symbolic math, linear algebra, nonlinear systems, automatic and numerical differentiation, numerical integration, and ordinary, partial and stochastic differential equations.

Installing it adds the **Core Mathematics** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Symbolic Math | Algebra, symbolic differentiation and integration, limits and series, equation solving | [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl), [SymbolicNumericIntegration.jl](https://github.com/SciML/SymbolicNumericIntegration.jl) |
| Linear Algebra | Linear systems, matrix factorisations, eigenvalues, the singular value decomposition and least squares | [LinearAlgebra](https://github.com/JuliaLang/LinearAlgebra.jl) (Julia standard library) |
| Nonlinear Systems | Scalar equations, bracketing methods and systems of nonlinear equations | [NonlinearSolve.jl](https://github.com/SciML/NonlinearSolve.jl) |
| Automatic Differentiation | Derivatives, gradients, Hessians, Jacobians, pushforwards and pullbacks by forward and reverse mode | [DifferentiationInterface.jl](https://github.com/JuliaDiff/DifferentiationInterface.jl), [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl), [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl), [Mooncake.jl](https://github.com/chalk-lab/Mooncake.jl), [TaylorSeries.jl](https://github.com/JuliaDiff/TaylorSeries.jl) |
| Numerical Differentiation | Finite differences, higher derivatives, Jacobians and Hessians, the complex step, and the choice of step | [FiniteDifferences.jl](https://github.com/JuliaDiff/FiniteDifferences.jl), [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl), [DifferentiationInterface.jl](https://github.com/JuliaDiff/DifferentiationInterface.jl) |
| Numerical Integration | Definite and multiple integrals, and integration of sampled data | [QuadGK.jl](https://github.com/JuliaMath/QuadGK.jl), [HCubature.jl](https://github.com/JuliaMath/HCubature.jl), [FastGaussQuadrature.jl](https://github.com/JuliaApproximation/FastGaussQuadrature.jl), [SymbolicNumericIntegration.jl](https://github.com/SciML/SymbolicNumericIntegration.jl) |
| Ordinary Differential Equations | First-order equations, systems and second-order equations | [OrdinaryDiffEq.jl](https://github.com/SciML/OrdinaryDiffEq.jl), [NonlinearSolve.jl](https://github.com/SciML/NonlinearSolve.jl), [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl) |
| Partial Differential Equations | Heat, wave and Poisson equations | [OrdinaryDiffEq.jl](https://github.com/SciML/OrdinaryDiffEq.jl), [MethodOfLines.jl](https://github.com/SciML/MethodOfLines.jl), [Krylov.jl](https://github.com/JuliaSmoothOptimizers/Krylov.jl), [Gridap.jl](https://github.com/gridap/Gridap.jl) |
| Stochastic Differential Equations | Itô and Stratonovich calculus, exact solutions, systems with general or correlated noise, and stiff equations | [StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl), [DiffEqNoiseProcess.jl](https://github.com/SciML/DiffEqNoiseProcess.jl), [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl), [DiffEqDevTools.jl](https://github.com/SciML/DiffEqDevTools.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
