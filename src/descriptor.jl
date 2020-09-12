mutable struct MethodDescriber
    name::String
    description::Union{String, Nothing}
    problem_type::Union{Symbol, Nothing}
    f::Union{Function, Nothing}
        
    MethodDescriber() = new()
    
end

function MethodDescriber(   name::String;
                            description = nothing,
                            problem_type = nothing,
                            f = nothing)
    
    method = MethodDescriber()

    method.name = name
    method.description = description
    method.problem_type = problem_type
    method.f = f
    return method
end 

function Base.show(io::IO, method::MethodDescriber)
    println(io, "$(method.name)")
    method.problem_type !== nothing && println(io, "problem type: " * string(method.problem_type))
    method.description !== nothing && println(io, "Description:\n" * method.description) 
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
        print(io, method)
    end
end

const METHODS = MethodDescriberSet(
    MethodDescriber(
        "generate_blobs",
        problem_type = :Classification,
        description = """
        Generate isotropic Gaussian blobs for clustering. Sklearn interface to make_blobs.
        """,
        f = generate_blobs,),
    MethodDescriber(
        "generate_moons",
        problem_type = :Classification,
        description = """
        Generate isotropic Gaussian blobs for clustering. Sklearn interface to make_blobs.
        """,
        f = generate_moons,),
    MethodDescriber(
        "make_s_curve",
        problem_type = :Regression,
        description = """
        Generate an S curve dataset. Sklearn interface to make_s_curve.
        """,
        f = generate_s_curve,),
    MethodDescriber(
        "generate_regression",
        problem_type = :Regression,
        description = """
        Generate a random regression problem. Sklearn interface to make_regression.
        """,
        f = generate_regression,)
  
)

methods() = println(METHODS)