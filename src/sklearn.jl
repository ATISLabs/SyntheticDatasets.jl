"""
    make_moons(;    n_samples::Union{Tuple{Int, Int}, Int} = 100, 
                    shuffle = true, 
                    noise = nothing, 
                    random_state = nothing)::DataFrame
Make two interleaving half circles. Sklearn interface to make_moons. 
# Arguments
- `n_samples::Union{Tuple{Int, Int}, Int} = 100`: If int, the total number of points generated. If two-element tuple, number of points in each of two moons.
- `shuffle::Bool = true`: Whether to shuffle the samples.
- `noise::Union{Nothing, Float64} = nothing`: Standard deviation of Gaussian noise added to the data.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset shuffling and noise.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_moons.html)
"""
function make_moons(;   n_samples::Union{Tuple{Int, Int}, Int} = 100, 
                        shuffle::Bool = true, 
                        noise::Union{Nothing, Float64} = nothing, 
                        random_state::Union{Int, Nothing} = nothing)::DataFrame

    (features, labels) = datasets.make_moons(   n_samples=n_samples, 
                                                shuffle = shuffle, 
                                                noise = noise, 
                                                random_state = random_state)

    return convert(features, labels)
end

"""
    make_blobs(;    n_samples::Union{Int, Array{Int, 1}} = 100, 
                    n_features::Int = 2,
                    centers::Union{Int, Union{Nothing, Array{Float64, 2}}} = nothing,
                    cluster_std::Union{Float64, Array{Float64, 1}} = 1.0,
                    center_box = (-10.0, 10.0),
                    shuffle::Bool = true, 
                    random_state::Union{Int, Nothing} = nothing)::DataFrame
Generate isotropic Gaussian blobs for clustering. Sklearn interface to make_blobs. 
# Arguments
- `n_samples = 100`: If int, it is the total number of points equally divided among clusters. If array-like, each element of the sequence indicates the number of samples per cluster. 
- `n_features = 2`: The number of features for each sample.
- `centers::Union{Int, Union{Nothing, Array{Float64, 2}}} = nothing`: The number of centers to generate, or the fixed center locations. If n_samples is an int and centers is None, 3 centers are generated. If n_samples is array-like, centers must be either None or an array of length equal to the length of n_samples.
- `cluster_std::Union{Float64, Array{Float64, 1}} = 1.0`: The standard deviation of the clusters.
- `center_box::Tuple{Float64, Float64} = (-10.0, 10.0)`: The bounding box for each cluster center when centers are generated at random.
- `shuffle::Bool = true`: Shuffle the samples.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset shuffling and noise.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html)
"""
function make_blobs(;   n_samples::Union{Int, Array{Int, 1}} = 100, 
                        n_features::Int = 2,
                        centers::Union{Int, Union{Nothing, Array{Float64, 2}}} = nothing,
                        cluster_std::Union{Float64, Array{Float64, 1}} = 1.0,
                        center_box::Tuple{Float64, Float64} = (-10.0, 10.0),
                        shuffle::Bool = true, 
                        random_state::Union{Int, Nothing} = nothing)::DataFrame

    (features, labels) = datasets.make_blobs(   n_samples = n_samples, 
                                                n_features = n_features, 
                                                centers = centers, 
                                                cluster_std = cluster_std, 
                                                center_box = center_box, 
                                                shuffle = shuffle, 
                                                random_state = random_state, 
                                                return_centers = false)

    return convert(features, labels)
end

"""
    make_s_curve(;  n_samples::Int = 100, 
                    noise = nothing, 
                    random_state = nothing)::DataFrame
Generate an S curve dataset. Sklearn interface to make_s_curve. 
# Arguments
- `n_samples::Int = 100`: The number of sample points on the S curve.
- `noise::Union{Nothing, Float64} = nothing`: Standard deviation of Gaussian noise added to the data.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_s_curve.html)
"""
function make_s_curve(; n_samples::Int = 100,
                        noise::Float64 = 0.0, 
                        random_state::Union{Int, Nothing} = nothing)::DataFrame
        
    (features, labels) = datasets.make_s_curve( n_samples = n_samples,
                                                noise = noise, 
                                                random_state = random_state)
    
    return convert(features, labels)
end

"""
    function make_circles(; n_samples::Int = 100,
                            shuffle::Bool = true,
                            noise::Float64 = 0.0, 
                            random_state::Union{Int, Nothing} = nothing,
                            factor::Float64 = 0.8)::DataFrame
Make a large circle containing a smaller circle in 2d. Sklearn interface to make_circles.
# Arguments
- `n_samples::Union{Int, Tuple{Int, Int}} = 100`: If int, it is the total number of points generated. For odd numbers, the inner circle will have one point more than the outer circle. If two-element tuple, number of points in outer circle and inner circle.
- `shuffle::Bool = true`: Whether to shuffle the samples.
- `noise::Union{Nothing, Float64} = nothing`: Standard deviation of Gaussian noise added to the data.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset shuffling and noise. Pass an int for reproducible output across multiple function calls. 
- `factor::Float64 = 0.8`: Scale factor between inner and outer circle.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_circles.html)

"""
function make_circles(; n_samples::Union{Int, Tuple{Int, Int}} = 100,
                        shuffle::Bool = true,
                        noise::Union{Nothing, Float64} = nothing, 
                        random_state::Union{Int, Nothing} = nothing,
                        factor::Float64 = 0.8)::DataFrame

    (features, labels) = datasets.make_circles( n_samples = n_samples,
                            shuffle = shuffle, 
                            noise = noise,
                            random_state = random_state,
                            factor = factor)

    return convert(features, labels)
end

"""
    make_regression(;   n_samples::Int = 100,
                        n_features::Int = 100,
                        n_informative::Int = 10,
                        n_targets::Int = 1,
                        bias::Float64 = 0.0,
                        effective_rank::Union{Int, Nothing} = nothing, 
                        tail_strength::Float64 = 0.5, 
                        noise::Float64 = 0.0, 
                        shuffle::Bool = true, 
                        coef::Bool = false, 
                        random_state::Union{Int, Nothing}= nothing)
Generate a random regression problem. Sklearn interface to make_regression.
# Arguments
- `n_samples::Int = 100`: The number of samples.
- `n_features::Int = 2`: The number of features.
- `n_informative::Int = 10`: The number of informative features, i.e., the number of features used to build the linear model used to generate the output.
- `n_targets::Int = 1`: The number of regression targets, i.e., the dimension of the y output vector associated with a sample. By default, the output is a scalar.
- `bias::Float = 0.0`: The bias term in the underlying linear model.
- `effective_rank::Union{Int, Nothing} = nothing`: If not `nothing`, the approximate number of singular vectors required to explain most of the input data by linear combinations. Using this kind of singular spectrum in the input allows the generator to reproduce the correlations often observed in practice. If `nothing`, the input set is well conditioned, centered and gaussian with unit variance.
- `tail_strength::Float = 0.5`: The relative importance of the fat noisy tail of the singular values profile if effective_rank is not None.
- `noise::Union{Nothing, Float64} = nothing`: Standard deviation of Gaussian noise added to the data.
- `shuffle::Bool = true`: Shuffle the samples and the features.
- `coef::Bool = false`: If `true`, the coefficients of the underlying linear model are returned.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset shuffling and noise.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_regression.html)
"""
function make_regression(;  n_samples::Int = 100,
                            n_features::Int = 100,
                            n_informative::Int = 10,
                            n_targets::Int = 1,
                            bias::Float64 = 0.0,
                            effective_rank::Union{Int, Nothing} = nothing,
                            tail_strength::Float64 = 0.5,
                            noise::Float64 = 0.0,
                            shuffle::Bool = true,
                            coef::Bool = false,
                            random_state::Union{Int, Nothing}= nothing)

    (features, labels) = datasets.make_regression(  n_samples = n_samples,
                                                    n_features = n_features,
                                                    n_informative = n_informative, 
                                                    n_targets = n_targets,
                                                    bias = bias,
                                                    effective_rank = effective_rank,
                                                    tail_strength = tail_strength,
                                                    noise = noise,
                                                    shuffle = shuffle,
                                                    coef = coef,
                                                    random_state = random_state)

    return convert(features, labels)
end

"""
    function make_classification(;  n_samples::Int = 100,
                                    n_features::Int = 20,
                                    n_informative::Int = 2,
                                    n_redundant::Int = 2,
                                    n_repeated::Int = 0,
                                    n_classes::Int = 2,
                                    n_clusters_per_class::Int = 2,
                                    weights::Union{Nothing, Array{Float64,1}} = nothing,
                                    flip_y::Float64 = 0.01,
                                    class_sep::Float64 = 1.0,
                                    hypercube::Bool = true, 
                                    shift::Union{Nothing, Array{Float64,1}} = 0.0,
                                    scale::Union{Nothing, Array{Float64,1}} = 1.0, 
                                    shuffle::Bool = true, 
                                    random_state::Union{Int, Nothing} = nothing)
Generate a random n-class classification problem. Sklearn interface to make_classification.
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `n_features::Int = 20`: The total number of features. These comprise `n_informative` informative features, `n_redundant` redundant features, `n_repeated` duplicated features and `n_features-n_informative-n_redundant-n_repeated` useless features drawn at random.
- `n_informative::Int = 2`: The number of informative features. Each class is composed of a number of gaussian clusters each located around the vertices of a hypercube in a subspace of dimension `n_informative`. For each cluster, informative features are drawn independently from N(0, 1) and then randomly linearly combined within each cluster in order to add covariance. The clusters are then placed on the vertices of the hypercube.
- `n_redundant::Int = 2`: The number of redundant features. These features are generated as random linear combinations of the informative features.
- `n_repeated::Int = 0`: The number of duplicated features, drawn randomly from the informative and the redundant features.
- `n_classes::Int = 2`: The number of classes (or labels) of the classification problem.
- `n_clusters_per_class::Int = 2`: The number of clusters per class.
- `weights::Union{Nothing, Array{Float64,1}} = nothing`: 
- `flip_y::Float64 = 0.01`: The fraction of samples whose class is assigned randomly. Larger values introduce noise in the labels and make the classification task harder. Note that the default setting flip_y > 0 might lead to less than n_classes in y in some cases.
- `class_sep::Float64 = 1.0`: The factor multiplying the hypercube size. Larger values spread out the clusters/classes and make the classification task easier.
- `hypercube::Bool = true`: If True, the clusters are put on the vertices of a hypercube. If False, the clusters are put on the vertices of a random polytope.
- `shift::Union{Nothing, Array{Float64,1}} = 0.0`: Shift features by the specified value. If None, then features are shifted by a random value drawn in [-class_sep, class_sep].
- `scale::Union{Nothing, Array{Float64,1}} = 1.0`: Multiply features by the specified value. If None, then features are scaled by a random value drawn in [1, 100]. Note that scaling happens after shifting.
- `shuffle::Bool = true`: Shuffle the samples and the features.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls. See Glossary.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.html)
"""
function make_classification(;  n_samples::Int = 100,
                                n_features::Int = 20,
                                n_informative::Int = 2,
                                n_redundant::Int = 2,
                                n_repeated::Int = 0,
                                n_classes::Int = 2,
                                n_clusters_per_class::Int = 2,
                                weights::Union{Nothing, Array{Float64,1}} = nothing,
                                flip_y::Float64 = 0.01,
                                class_sep::Float64 = 1.0,
                                hypercube::Bool = true, 
                                shift::Union{Nothing, Float64, Array{Float64,1}} = 0.0,
                                scale::Union{Nothing, Float64, Array{Float64,1}} = 1.0, 
                                shuffle::Bool = true, 
                                random_state::Union{Int, Nothing} = nothing)

    (features, labels) = datasets.make_classification(  n_samples = n_samples,
                                                        n_features = n_features,
                                                        n_informative = n_informative,
                                                        n_redundant = n_redundant,
                                                        n_repeated = n_repeated,
                                                        n_classes = n_classes,
                                                        n_clusters_per_class = n_clusters_per_class,
                                                        weights = weights,
                                                        flip_y = flip_y,
                                                        class_sep = class_sep,
                                                        hypercube = hypercube,
                                                        shift = shift,
                                                        scale = scale,
                                                        shuffle = shuffle,
                                                        random_state = random_state)

    return convert(features, labels)
end

"""
    function make_friedman1(;   n_samples::Int = 100,
                                n_features::Int = 10,
                                noise::Float64 = 0.0, 
                                random_state::Union{Int, Nothing} = nothing)::DataFrame
Generate the “Friedman #1” regression problem. Sklearn interface to make_regression.
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `n_features::Int = 10`: The number of features. Should be at least 5.
- `noise::Union{Nothing, Float64} = nothing`: The standard deviation of the gaussian noise applied to the output.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset noise. Pass an int for reproducible output across multiple function calls.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman1.html)
"""
function make_friedman1(;   n_samples::Int = 100,
                            n_features::Int = 10,
                            noise::Float64 = 0.0, 
                            random_state::Union{Int, Nothing} = nothing)::DataFrame

    (features, labels) = datasets.make_friedman1(   n_samples = n_samples,
                                                    n_features = n_features,
                                                    noise = noise, 
                                                    random_state = random_state)

    return convert(features, labels)
end

"""
    function make_friedman2(;   n_samples::Int = 100,
                                noise::Float64 = 0.0, 
                                random_state::Union{Int, Nothing} = nothing)::DataFrame
Generate the “Friedman #2” regression problem. Sklearn interface to make_friedman2.
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `n_features::Int = 10`: The number of features. Should be at least 5.
- `noise::Union{Nothing, Float64} = nothing`: The standard deviation of the gaussian noise applied to the output.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset noise. Pass an int for reproducible output across multiple function calls.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman2.html)
"""
function make_friedman2(;   n_samples::Int = 100,
                            noise::Float64 = 0.0, 
                            random_state::Union{Int, Nothing} = nothing)::DataFrame

    (features, labels) = datasets.make_friedman2(   n_samples = n_samples,
                                                    noise = noise, 
                                                    random_state = random_state)

    return convert(features, labels)
end

"""
    function make_friedman3(;   n_samples::Int = 100,
                                noise::Float64 = 0.0, 
                                random_state::Union{Int, Nothing} = nothing)::DataFrame
Generate the “Friedman #3” regression problem. Sklearn interface to make_friedman3.
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `noise::Union{Nothing, Float64} = nothing`: The standard deviation of the gaussian noise applied to the output.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset noise. Pass an int for reproducible output across multiple function calls.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_friedman3.html)
"""
function make_friedman3(;   n_samples::Int = 100,
                            noise::Float64 = 0.0, 
                            random_state::Union{Int, Nothing} = nothing)::DataFrame

    (features, labels) = datasets.make_friedman3(   n_samples = n_samples,
                                                    noise = noise, 
                                                    random_state = random_state)

    return convert(features, labels)
end

"""
    function make_low_rank_matrix(; n_samples::Int =100,
                                    n_features::Int =100,
                                    effective_rank::Int =10,
                                    tail_strength::Float64 =0.5,
                                    random_state::Union{Int, Nothing} = nothing)
Generate a mostly low rank matrix with bell-shaped singular values
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `n_features::Int = 20`: The total number of features. These comprise `n_informative` informative features, `n_redundant` redundant features, `n_repeated` duplicated features and `n_features-n_informative-n_redundant-n_repeated` useless features drawn at random.
- `effective_rank::Int = 10`: The approximate number of singular vectors required to explain most of the data by linear combinations.
- `tail_strength::Float64 = 0.5`: The relative importance of the fat noisy tail of the singular values profile.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls. See Glossary.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_low_rank_matrix.html)
"""
function make_low_rank_matrix(; n_samples::Int = 100,
                                n_features::Int = 100,
                                effective_rank::Int = 10,
                                tail_strength::Float64 = 0.5,
                                random_state::Union{Int, Nothing} = nothing)

    features = datasets.make_low_rank_matrix(   n_samples = n_samples,
                                                n_features = n_features,
                                                effective_rank = effective_rank,
                                                tail_strength = tail_strength,
                                                random_state = random_state)
   return features
end

"""
function make_swiss_roll(;  n_samples::Int = 100,
                            noise::Float64 = 0.0,
                            random_state::Union{Int,Nothing} = nothing)
Generate a swiss roll dataset.
#Arguments
- `n_samples::Int = 100`: The number of samples.
- `noise::Float64 = 0.0 : Standard deviation of Gaussian noise added to the data.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls. See Glossary.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_swiss_roll.htmll)
"""
function make_swiss_roll(;  n_samples::Int = 100,
                            noise::Float64 = 0.0,
                            random_state::Union{Int,Nothing} = nothing)

   (features, labels) = datasets.make_swiss_roll(  n_samples = n_samples,
                                                   noise = noise,
                                                   random_state = random_state)

   return convert(features, labels)
end

"""
    function make_hastie_10_2(;  n_samples::Int = 12000,
                                    random_state::Union{Int,Nothing} = nothing)
Generates data for binary classification used in Hastie et al. 2009, Example 10.2.
#Arguments
- `n_samples::Int = 100`: The number of samples..
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls. See Glossary.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_hastie_10_2.html)
"""
function make_hastie_10_2(; n_samples::Int = 12000,
                            random_state::Union{Int,Nothing} = nothing)

   (features, labels) = datasets.make_hastie_10_2(  n_samples = n_samples,
                                                    random_state = random_state)

   return convert(features, labels)
end

"""
    function make_gaussian_quantiles(;  mean::Array{<:Union{Number, Nothing}, 1} = [nothing],
                                        cov::Float64 = 1,
                                        n_samples::Int = 100,
                                        n_features::Int = 2,
                                        n_classes::Int = 3,
                                        shuffle::Bool = true,
                                        random_state::Union{Int, Nothing} = nothing)

Generate isotropic Gaussian and label samples by quantile.
#Arguments
- `mean::Union{Array{<:Number, 1}, Nothing} = nothing`: The mean of the multi-dimensional normal distribution. If None then use the origin (0, 0, …).
- `cov::Float64 = 1`: The covariance matrix will be this value times the unit matrix.
- `n_samples::Int = 100`: The total number of points equally divided among classes.
- `n_features::Int = 2`: The number of features for each sample.
- `n_classes::Int = 3`: The number of classes.
- `shuffle::Bool = true`: Shuffle the samples.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls. See Glossary.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_gaussian_quantiles.html)
"""
function make_gaussian_quantiles(;  mean::Union{Array{<:Number, 1}, Nothing} = nothing,
                                    cov::Float64 = 1.0,
                                    n_samples::Int = 100,
                                    n_features::Int = 2,
                                    n_classes::Int = 3,
                                    shuffle::Bool = true,
                                    random_state::Union{Int, Nothing} = nothing)

    typeof(mean) != Nothing && length(mean) != n_features && throw(DimensionMismatch("length of mean must be equal to n_features."))

    (features, labels) = datasets.make_gaussian_quantiles(  mean = mean,
                                                            cov = cov,
                                                            n_samples = n_samples,
                                                            n_features = n_features,
                                                            n_classes = n_classes,
                                                            shuffle = shuffle,
                                                            random_state = random_state)

    return convert(features, labels)
end
