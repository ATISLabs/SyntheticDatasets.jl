module SyntheticDatasets

using PyCall
using DataFrames
using Random

const datasets = PyNULL()

function __init__()
    copy!(datasets, pyimport("sklearn.datasets"))
end

include("sklearn.jl")

function convert(matrix::Array{T, 2}, base_name::Union{String, Symbol} = :Column)::DataFrame where {T <: Number}
    df = DataFrame()

    for i = 1:size(matrix, 2)
        df[!, Symbol(string(base_name) * "_$(i)")] = eltype(matrix)[]
    end
    
        
    for i=1:size(matrix, 1)
        push!(df, (matrix[i, :]...,))
    end

    return df
end

function convert(features::Array{T, 2}, labels::Array{D, 1})::DataFrame where {T <: Number, D <: Number}
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
