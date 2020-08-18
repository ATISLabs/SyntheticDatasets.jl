# SyntheticDatasets.jl

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
