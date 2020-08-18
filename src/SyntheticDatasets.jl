module SyntheticDatasets

using PyCall
using DataFrames
using Random

const datasets = PyNULL()

function __init__()
    copy!(datasets, pyimport("sklearn.datasets"))
end

function generate_moons(;n_samples = 100, 
                        shuffle = true, 
                        noise = nothing, 
                        random_state = nothing)::DataFrame

    data = datasets.make_moons( n_samples=n_samples, 
                                shuffle = shuffle, 
                                noise = noise, 
                                random_state = random_state)

    df = DataFrame(X = Float64[], Y = Float64[], C = Int[])

    for i in findall(r->r==0, data[2])
        push!(df, (data[1][i, 1], data[1][i, 2], 1))
    end

    for i in findall(r->r==1, data[2])
        push!(df, (data[1][i, 1], data[1][i, 2], 2))
    end

    index = collect(1:size(df)[1])
    shuffle!(index)

    return df[index, :]
end

function generate_blobs(;n_samples = 100, 
                        n_features = 2,
                        centers = nothing,
                        cluster_std = 1.0,
                        center_box = (-10.0, 10.0),
                        shuffle = true, 
                        random_state = nothing,
                        return_centers = false)::DataFrame

    data = datasets.make_blobs( n_samples = n_samples, 
                                n_features = n_features, 
                                centers = centers, 
                                cluster_std = cluster_std, 
                                center_box = center_box, 
                                shuffle = shuffle, 
                                random_state = random_state, 
                                return_centers = return_centers)

    df = DataFrame(X = Float64[], Y = Float64[], C = Int[])

    for i in findall(r->r==0, data[2])
    push!(df, (data[1][i, 1], data[1][i, 2], 1))
    end

    for i in findall(r->r==1, data[2])
    push!(df, (data[1][i, 1], data[1][i, 2], 2))
    end

    index = collect(1:size(df)[1])
    shuffle!(index)

    return df[index, :]
end

end # module
