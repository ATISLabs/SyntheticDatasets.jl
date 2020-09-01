module SyntheticDatasets

using PyCall
using DataFrames
using Random

const datasets = PyNULL()

function __init__()
    copy!(datasets, pyimport("sklearn.datasets"))
end

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

function convert(features::Array{T, 2}, labels::Array{Int, 1})::DataFrame where T <: Number
    df = DataFrame()

    for i = 1:size(features)[2]
        df[!, Symbol("feature_$(i)")] = eltype(features)[]
    end
    
    df[!, :label] = eltype(labels)[]
    
    for label in unique(labels)
        for i in findall(r->r == label, labels)
            push!(df, (features[i, :]... , label))
        end
    end

    return df
end

end # module
