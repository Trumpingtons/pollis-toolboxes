# Curvature

## What Curvature Measures

Curvature measures how the land surface bends: how the slope changes from one place to the next. Of the many curvatures defined in geomorphometry, two describe the movement of water and soil best ([Minár, Evans and Jenčo (2020)](#ref-MEJ2020a)). Profile curvature, the normal slope line curvature, measures the bending along the line of steepest descent; tangential curvature, the normal contour curvature, measures the bending across it, along the contour. Both are in 1/m, the inverse of the radius of the curve: a curvature of 0.01 is a bend of radius 100 metres. Both are positive where the surface is convex, bulging upwards, and negative where it is concave.

## Profile and Tangential Curvature

Profile curvature is negative where the slope eases downhill, as at the foot of a slope or on a valley floor, where flowing water slows and deposits what it carries. Profile curvature is positive where the slope steepens downhill, as below a crest, where water speeds up. Tangential curvature is negative in hollows and valleys, where the flow lines converge and water and soil gather, and positive on spurs and ridges, where they diverge ([Minár, Evans and Jenčo (2020)](#ref-MEJ2020a)). Convex and Concave Ground of the Curvature tab classes the land by both signs at once, with ground close to flat in either direction as plain.

## A Quadratic Surface Fitted to a Window

The Curvature tab fits the quadratic z = a x^2 + b y^2 + c x y + d x + e y + f by least squares to the heights of a square window around each cell, x east and y north of the centre in metres, and computes the two curvatures from its coefficients: d and e give the gradient, and a, b and c the second derivatives ([Minár, Evans and Jenčo (2020)](#ref-MEJ2020a)). On a full square window the six terms, once centred, are orthogonal, so each coefficient is a fixed weighted sum of the window's heights, and `mapstencil` of Stencils.jl applies those sums to every window ([Schouten (2026)](#ref-Sch2026c)). The fit is the method of `Qfit` of MultiscaleDTM, which Replicate with MultiscaleDTM sets beside it ([Ilich, Misiuk, Lecours and Murawski (2023)](#ref-IMLM2023a)).

## Curvature at Several Scales

The window of the fit sets the scale of the curvature. At 3 by 3 cells the curvature follows forms a few cells across, and reacts to noise in single cells; at 5 by 5 or 7 by 7 cells it follows broader forms, and the noise averages out. Ilich, Misiuk, Lecours and Murawski show that land surface parameters measured at several scales describe a landscape better than one scale alone ([Ilich, Misiuk, Lecours and Murawski (2023)](#ref-IMLM2023a)). Window Sizes Compared of the Curvature tab prints how the spread of the curvature narrows as the window grows.

## References

<a id="ref-IMLM2023a"></a>Ilich, A. R., Misiuk, B., Lecours, V. and Murawski, S. A. (2023). MultiscaleDTM: an open-source R package for multiscale geomorphometric analysis. *Transactions in GIS* 27(4), 1164–1204. [doi:10.1111/tgis.13067](https://doi.org/10.1111/tgis.13067)

<a id="ref-MEJ2020a"></a>Minár, J., Evans, I. S. and Jenčo, M. (2020). A comprehensive system of definitions of land surface (topographic) curvatures, with implications for their application in geoscience modelling and prediction. *Earth-Science Reviews* 211, 103414. [doi:10.1016/j.earscirev.2020.103414](https://doi.org/10.1016/j.earscirev.2020.103414)

<a id="ref-Sch2026c"></a>Schouten, R. (2026). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Relief Indices](relief.md)
