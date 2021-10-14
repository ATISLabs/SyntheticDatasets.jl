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

## Examples
A set of pluto notebooks and codes demonstrating the project's current functionality is available in [the examples folder](examples/).

Here are a few examples to show the Package capabilities:
```julia
using StatsPlots, SyntheticDatasets

blobs = SyntheticDatasets.make_blobs(   n_samples = 1000, 
                                        n_features = 2,
                                        centers = [-1 1; -0.5 0.5], 
                                        cluster_std = 0.25,
                                        center_box = (-2.0, 2.0), 
                                        shuffle = true,
                                        random_state = nothing);

@df blobs scatter(:feature_1, :feature_2, group = :label, title = "Blobs")

gauss = SyntheticDatasets.make_gaussian_quantiles(  mean = [10,1], 
                                                    cov = 2.0,
                                                    n_samples = 1000, 
                                                    n_features = 2,
                                                    n_classes = 3, 
                                                    shuffle = true,
						    random_state = 2);

@df gauss scatter(:feature_1, :feature_2, group = :label, title = "Gaussian Quantiles")

spirals = SyntheticDatasets.make_twospirals(n_samples = 2000, 
                                            start_degrees = 90,
                                            total_degrees = 570, 
                                            noise =0.1);

@df spirals scatter(:feature_1, :feature_2, group = :label, title = "Two Spirals")

kernel = SyntheticDatasets.make_halfkernel( n_samples = 1000, 
                                            minx = -20,
                                            r1 = 20, 
                                            r2 = 35,
                                            noise = 3.0, 
                                            ratio = 0.6);

@df kernel scatter(:feature_1, :feature_2, group = :label, title = "Half Kernel")
```
<p align="center">
  <img width="460" height="300" src="https://github.com/ATISLabs/SyntheticDatasets.jl/blob/4b90b37ea57e38c3a7a05f9917912023f8aa5361/examples/subplot.png">
</p>

## Datasets

The SyntheticDatasets.jl is a library with functions for generating synthetic artificial datasets. The package has some functions are interfaces to the dataset generator of the [ScikitLearn](https://scikit-learn.org/stable/modules/classes.html#samples-generator).

### ScikitLearn
List of package datasets:

Dataset                 | Title                                                                   | Reference
------------------------|-------------------------------------------------------------------------|--------------------------------------------------
make_blobs              | Generate isotropic Gaussian blobs for clustering.                       | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html)
make_moons              | Make two interleaving half circles                                      | [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_moons.html)
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
