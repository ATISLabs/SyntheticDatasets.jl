# SyntheticDatasets.jl
[![][travis-img]][travis-url] [![][codecov-img]][codecov-url] [![][coverage-img]][coverage-url]

The SyntheticDatasets.jl package is a lib with functions for generating synthetic artificial datasets.

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

Dataset         | Title
----------------|------------------------------------------------------------------------
make_blobs      | Generate isotropic Gaussian blobs for clustering.
make_moons      | Make two interleaving half circles


[travis-img]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl.svg?branch=master
[travis-url]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl

[codecov-img]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl/branch/master/graph/badge.svg?token=13TrPsgakO
[codecov-url]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl

[coverage-img]: https://coveralls.io/repos/github/ATISLabs/SyntheticDatasets.jl/badge.svg?branch=master
[coverage-url]: https://coveralls.io/github/ATISLabs/SyntheticDatasets.jl?branch=master
