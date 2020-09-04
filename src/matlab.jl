"""
    generate_twospirals(;    n_samples::Int = 2000,
                             start_degrees::Int = 90,
                             total_degrees::Int = 570,
                             noise::Float64 = 0.2
Generate two spirals dataset. Return a Nx3 matrix, where each line contains the X,Y coordinates and the class of an instance.
# Arguments
- `n_samples::Int = 2000`: The total number of points generated.
- `start_degrees::Int = 90`: Determines how far from the origin the spirals start.
- `total_degrees::Int = 570`: Controls the lenght of the spirals.
- `noise::Float64 = 0.2`: Determines the noise in the dataset.
Reference: [link](https://la.mathworks.com/matlabcentral/fileexchange/41459-6-functions-for-generating-artificial-datasets)
"""
function generate_twospirals(; n_samples::Int = 2000,
                               start_degrees::Int = 90,
                               total_degrees::Int = 570,
                               noise::Float64 = 0.2)
   start_degrees = deg2rad(start_degrees);

   N1 = floor(Int, n_samples / 2);
   N2 = n_samples - N1;

   n = start_degrees .+ sqrt.(rand(N1,1)) .* deg2rad(total_degrees);
   d1 = [-cos.(n).*n + rand(N1,1).*noise sin.(n).*n+rand(N1,1).*noise zeros(N1,1)];

   n = start_degrees .+ sqrt.(rand(N2,1)) .* deg2rad(total_degrees);
   d2 = [cos.(n).*n+rand(N2,1)*noise -sin.(n).*n+rand(N2,1)*noise ones(N2,1)];

   return [d1; d2];
end
