using PyCall

println("Running build.jl for the SyntheticDatasets package.")

# Change that to whatever packages you need.
PACKAGES = ["sklearn"]

# Use eventual proxy info
proxy_arg=String[]
if haskey(ENV, "http_proxy")
    push!(proxy_arg, "--proxy")
    push!(proxy_arg, ENV["http_proxy"])
end

# Import pip
try
    @pyimport pip
catch ee
    typeof(ee) <: PyCall.PyError || rethrow(ee)
    error("""
Python Pip not installed
Please either:
- Install pip
- Rebuild SyntheticDatasets.jl via `Pkg.build("SyntheticDatasets")` in the julia REPL
""")
end

try
    @pyimport sklearn
catch
    println("Installing required python packages using pip")
    run(`$(PyCall.python) $(proxy_arg) -m pip install --user $(PACKAGES)`)
end