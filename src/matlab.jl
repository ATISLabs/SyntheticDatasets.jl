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
   d1 = [-cos.(n).*n + rand(N1,1).*noise sin.(n).*n+rand(N1,1).*noise];

   n = start_degrees .+ sqrt.(rand(N2,1)) .* deg2rad(total_degrees);
   d2 = [cos.(n).*n+rand(N2,1)*noise -sin.(n).*n+rand(N2,1)*noise];

   features = [d1; d2]
   labels = [zeros(Int, N1); ones(Int, N2)]

   return convert(features, labels);
end

"""

"""

function generate_halfkernel(; n_samples::Int = 1000,
                            minx::Int = -20,
                            r1::Int = 20,
                            r2::Int = 35,
                            noise::Float64 = 4.0,
                            ratio::Float64 = 0.6)
   
   phi1 = rand(n_samples/2, 1) * π
   inner = [minx + r1 * sin(phi1) - .5 * noise + noise * rand(n_samples/2, 1) r1 * ratio * cos(phi1) - .5 * noise + noise * rand(n_samples/2, 1)]
   l1 = ones(Int, n_samples/2)

   phi2 = rand(N/2,1) * pi;
   outer = [minx + r2 * sin(phi2) - .5 * noise  + noise * rand(n_samples/2,1) r2 * ratio * cos(phi2) - .5 * noise  + noise * rand(n_samples/2,1)]
   l2 = zeros(Int, n_samples/2)


   features = [inner; outer]
   labels = [l1; l2]

   return convert(features, labels)

end