"""
    generate_moons(;    n_samples::Union{Tuple{Int, Int}, Int} = 100, 
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
function generate_moons(;n_samples::Union{Tuple{Int, Int}, Int} = 100, 
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
    generate_blobs(;    n_samples::Union{Int, Array{Int, 1}} = 100, 
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
function generate_blobs(;n_samples::Union{Int, Array{Int, 1}} = 100, 
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
    generate_s_curve(;  n_samples::Int = 100, 
                        noise = nothing, 
                        random_state = nothing)::DataFrame
Generate an S curve dataset. Sklearn interface to make_s_curve. 
# Arguments
- `n_samples::Int = 100`: The number of sample points on the S curve.
- `noise::Union{Nothing, Float64} = nothing`: Standard deviation of Gaussian noise added to the data.
- `random_state::Union{Int, Nothing} = nothing`: Determines random number generation for dataset creation. Pass an int for reproducible output across multiple function calls.
Reference: [link](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_s_curve.html)
"""
function generate_s_curve(; n_samples::Int = 100,
                            noise::Float64 = 0.0, 
                            random_state::Union{Int, Nothing} = nothing)::DataFrame
        
    (features, labels) = datasets.make_s_curve( n_samples = n_samples,
                                                noise = noise, 
                                                random_state = random_state)
    
    return convert(features, labels)
end

"""
    generate_regression(;   n_samples::Int = 100,
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
function generate_regression(;  n_samples::Int = 100,
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