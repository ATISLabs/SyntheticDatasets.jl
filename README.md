# SyntheticDatasets.jl
[![][travis-img]][travis-url] [![][codecov-img]][codecov-url] [![][coverage-img]][coverage-url]

The SyntheticDatasets.jl package is a library with functions for generating synthetic artificial datasets.

## Installation

The package can be installed with the Julia package manager.
From the Julia REPL, type `]` to enter the Pkg REPL mode and run:

```
pkg> add SyntheticDatasets
```

Or, equivalently, via the `Pkg` API:

```julia
julia> import Pkg; Pkg.add("SyntheticDatasets")
```

## Datasets

The package has an interface for the dataset generator of the [ScikitLearn](https://scikit-learn.org/stable/modules/classes.html#samples-generator) and in the future it will have its own functions.

### ScikitLearn
List of package datasets:

Dataset         | Title                                                                  | Reference
----------------|------------------------------------------------------------------------|--------------------------------------------------
make_blobs      | Generate isotropic Gaussian blobs for clustering.                      | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_moons.html)
make_moons      | Make two interleaving half circles                                     | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html)
make_s_curve    | Generate an S curve dataset.                                           | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_s_curve.html)
make_circles    | Make a large circle containing a smaller circle in 2d                  | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_circles.html])

**Disclaimer**: SyntheticDatasets.jl borrows code and documentation from
[scikit-learn](https://scikit-learn.org/stable/modules/classes.html#samples-generator) in the dataset module, but *it is not an official part
of that project*. It is licensed under [MIT](LICENSE).

[travis-img]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl.svg?branch=master
[travis-url]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl

[codecov-img]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl/branch/master/graph/badge.svg?token=13TrPsgakO
[codecov-url]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl

[coverage-img]: https://coveralls.io/repos/github/ATISLabs/SyntheticDatasets.jl/badge.svg?branch=master
[coverage-url]: https://coveralls.io/github/ATISLabs/SyntheticDatasets.jl?branch=master
