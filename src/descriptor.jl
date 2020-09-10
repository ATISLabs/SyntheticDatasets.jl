mutable struct MethodDescriber
    name::String
    n_features::Union{Symbol, Int, Nothing}
    n_samples::Union{Symbol, Int, Nothing}
    problem_type::Union{Symbol, Nothing}

    MethodDescriber() = new()
    
end

function MethodDescriber(   method_name::String;
                            n_features = nothing,
                            n_samples = nothing,
                            problem_type = nothing)
    
    method = MethodDescriber()

    method.name = method_name
    method.n_features = n_features
    method.n_samples = n_samples
    method.problem_type = problem_type

    return method
end 

function Base.show(io::IO, method::MethodDescriber)
    println("# $(method.name)")
    method.n_features !== nothing && println("number of features: " * string(method.n_features))
    method.n_samples !== nothing && println("amount of samples: " * string(method.n_samples))
    method.problem_type !== nothing && println("problem type: " * string(method.problem_type))
end

mutable struct MethodDescriberSet
    describers::Array{MethodDescriber, 1}
end

MethodDescriberSet(args...) = MethodDescriberSet([args...])

function methodsFilter(methods::MethodDescriberSet, parameters::Union{Pair, Array{Pair}})
    if !(parameters isa Array)
        parameters = [parameters]
    end

    filtered_methods = Set()
    
    for parameter in parameters
        if !(parameter[1] in fieldnames(MethodDescriber))
            @warn "$(parameter[1]) isn't a property of MethodDescriber"
            continue
        end
        for method in methods.describers 
            property = getfield(method, parameter[1])
            if property == parameter[2]
                push!(filtered_methods, method)
            end
        end
    end

    return MethodDescriberSet(collect(filtered_methods))
end

methodsFilter(parameters::Union{Pair, Array{Pair}}) = methodsFilter(METHODS, parameters)

function Base.show(io::IO, methods::MethodDescriberSet)
    for method in methods.describers
        println(method)
    end
end

const METHODS = MethodDescriberSet(
    MethodDescriber(
        "Generate_blobs",
        n_features = :Dynamic,
        n_samples = :Dynamic,
        problem_type = :Classification),
    MethodDescriber(
        "Generate_s_curve",
        n_features = 2,
        n_samples = :Dynamic,
        problem_type = :Regression),
)

methods() = println(METHODS)