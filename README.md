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

Dataset                 | Title                                                                   | Reference
------------------------|-------------------------------------------------------------------------|--------------------------------------------------
make_blobs              | Generate isotropic Gaussian blobs for clustering.                       | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_moons.html)
make_moons              | Make two interleaving half circles                                      | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html)
make_s_curve            | Generate an S curve dataset.                                            | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_s_curve.html)
make_regression         | Generate a random regression problem.                                   | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_regression.html)
make_classification     | Generate a random n-class classification problem.                       | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.html)
make_friedman1          | Generate the “Friedman #1” regression problem.                          | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman1.html)
make_friedman2          | Generate the “Friedman #2” regression problem.                          | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman2.html)
make_friedman3          | Generate the “Friedman #3” regression problem.                          | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman3.html)
make_circles            | Make a large circle containing a smaller circle in 2d                   | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_circles.html)
make_regression         | Generate a random regression problem.                                   | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_regression.html)
make_classification     | Generate a random n-class classification problem.                       | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.html)
make_low_rank_matrix    | Generate a mostly low rank matrix with bell-shaped singular values.     | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_low_rank_matrix.html)
make_swiss_roll         | Generate a swiss roll dataset.                                          | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_swiss_roll.html)
make_hastie_10_2        | Generates data for binary classification used in Hastie et al.          |[link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_hastie_10_2.html)
make_gaussian_quantiles | Generate isotropic Gaussian and label samples by quantile.           | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_gaussian_quantiles.html)

**Disclaimer**: SyntheticDatasets.jl borrows code and documentation from
[scikit-learn](https://scikit-learn.org/stable/modules/classes.html#samples-generator) in the dataset module, but *it is not an official part
of that project*. It is licensed under [MIT](LICENSE).

### Other Functions

Dataset          | Title                                                                   | Reference
-----------------|-------------------------------------------------------------------------|--------------------------------------------------
make_twospirals  | Generate two spirals dataset.                                           | [link](https://la.mathworks.com/matlabcentral/fileexchange/41459-6-functions-for-generating-artificial-datasets)
make_halfkernel  | Generate two half kernel dataset.                                       | [link](https://la.mathworks.com/matlabcentral/fileexchange/41459-6-functions-for-generating-artificial-datasets)
make_outlier     | Generate outlier dataset.                                       | [link](https://la.mathworks.com/matlabcentral/fileexchange/41459-6-functions-for-generating-artificial-datasets)

[travis-img]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl.svg?branch=master
[travis-url]: https://travis-ci.com/ATISLabs/SyntheticDatasets.jl

[codecov-img]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl/branch/master/graph/badge.svg?token=13TrPsgakO
[codecov-url]: https://codecov.io/gh/ATISLabs/SyntheticDatasets.jl

[coverage-img]: https://coveralls.io/repos/github/ATISLabs/SyntheticDatasets.jl/badge.svg?branch=master
[coverage-url]: https://coveralls.io/github/ATISLabs/SyntheticDatasets.jl?branch=master
