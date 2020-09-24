### A Pluto.jl notebook ###
# v0.11.9

using Markdown
using InteractiveUtils

# ╔═╡ 9cd14420-fd07-11ea-2bba-8965aca56d2d
begin
	using StatsPlots, SyntheticDatasets
end

# ╔═╡ a3c9a100-fd07-11ea-078c-21cb7dc31f79
blobs = SyntheticDatasets.make_blobs(n_samples = 1000,
										 n_features = 2,
										 centers = [-1 1; -0.5 0.5],
	                                     cluster_std = 0.25,
										 center_box = (-2.0, 2.0),
										 shuffle = true,
	                                     random_state = nothing);

# ╔═╡ 44690e10-fd09-11ea-36b8-f16615c1f284
gauss = SyntheticDatasets.make_gaussian_quantiles(mean =[10,1],
											 cov = 2.0,
                                             n_samples = 1000,
	                                         n_features = 2,	
										     n_classes = 3,
											 shuffle = true,
	                                         random_state = 2);

# ╔═╡ e6227ef0-fdc0-11ea-1cde-e904cfe08d34
spirals = SyntheticDatasets.make_twospirals(n_samples=2000,
											    start_degrees = 90,
												total_degrees = 570,
												noise =0.1);

# ╔═╡ 514edde0-fdc1-11ea-2790-c59af5f94ae4
kernel = SyntheticDatasets.make_halfkernel(n_samples = 1000,
											   minx = -20,
											   r1 = 20,
											   r2 = 35,
											   noise = 3.0,
											   ratio = 0.6);

# ╔═╡ 776a58e0-fd0a-11ea-3a6a-4fac23cba2d9
blob = @df blobs scatter(
    :feature_1,
    :feature_2,
    group = :label,
	title = "Blobs"
) 

# ╔═╡ dcc15f70-fdc0-11ea-0ba7-5b09883ed63a
gaussian_quantiles = @df gauss scatter(
    :feature_1,
    :feature_2,
    group = :label,
	title = "Gaussian Quantiles"
) 

# ╔═╡ e4b3acb0-fdc0-11ea-1e86-535f2541fc20
half_kernel = @df kernel scatter(
    :feature_1,
    :feature_2,
    group = :label,
	title = "Half Kernel"
) 

# ╔═╡ 96652d30-fdc1-11ea-30d6-790213f94220
two_spirals = @df spirals scatter(
    :feature_1,
    :feature_2,
    group = :label,
	title = "Two Spirals"
) 

# ╔═╡ aea9f1f0-fdc1-11ea-31db-2d8f810726b0
 plot(two_spirals,half_kernel,gaussian_quantiles,blob)

# ╔═╡ Cell order:
# ╠═9cd14420-fd07-11ea-2bba-8965aca56d2d
# ╠═a3c9a100-fd07-11ea-078c-21cb7dc31f79
# ╠═44690e10-fd09-11ea-36b8-f16615c1f284
# ╠═e6227ef0-fdc0-11ea-1cde-e904cfe08d34
# ╠═514edde0-fdc1-11ea-2790-c59af5f94ae4
# ╠═776a58e0-fd0a-11ea-3a6a-4fac23cba2d9
# ╠═dcc15f70-fdc0-11ea-0ba7-5b09883ed63a
# ╠═e4b3acb0-fdc0-11ea-1e86-535f2541fc20
# ╠═96652d30-fdc1-11ea-30d6-790213f94220
# ╠═aea9f1f0-fdc1-11ea-31db-2d8f810726b0
