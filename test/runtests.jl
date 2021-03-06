using SyntheticDatasets
using DataFrames
using Test

@testset "SkLearn Generators" begin
    samples = 20000
    features = 20

    data = SyntheticDatasets.make_blobs(centers = [-1 1;-0.5 0.75],
                                        cluster_std = 0.225,
                                        n_samples = 20000,
                                        center_box = (-1.5, 1.5))

    @test size(data)[1] == samples
    @test size(data)[2] == 3

    samples = 20000
    data = SyntheticDatasets.make_moons(n_samples = 20000)

    @test size(data)[1] == samples
    @test size(data)[2] == 3

    data = SyntheticDatasets.make_s_curve(  n_samples = samples,
                                            noise = 2.2,
                                            random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 4

    data = SyntheticDatasets.make_circles(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 3

    data = SyntheticDatasets.make_regression(   n_samples = samples,
                                                n_features = features,
                                                noise = 2.2,
                                                random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.make_regression(   n_samples = samples,
                                                n_features = features,
                                                n_targets = 2,
                                                noise = 2.2,
                                                random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 2

    data = SyntheticDatasets.make_regression(   n_samples = samples,
                                                n_features = features,
                                                n_targets = 3,
                                                noise = 2.2,
                                                random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 3

    data = SyntheticDatasets.make_classification(   n_samples = samples,
                                                    n_features = features,
                                                    n_classes = 1)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.make_friedman1(n_samples = samples,
                                            n_features = features)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.make_friedman2(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 5

    data = SyntheticDatasets.make_friedman3(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 5

    data = SyntheticDatasets.make_low_rank_matrix(  n_samples = samples,
                                                    n_features = features,
                                                    effective_rank = 10,
                                                    tail_strength = 0.5,
                                                    random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features

    data = SyntheticDatasets.make_swiss_roll(   n_samples = samples,
                                                noise = 2.2,
                                                random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 4

    data = SyntheticDatasets.make_hastie_10_2(  n_samples = samples,
                                                random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 11

    data = SyntheticDatasets.make_gaussian_quantiles(   n_samples = samples,
                                                        n_features = features,
                                                        random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    @test_throws DimensionMismatch SyntheticDatasets.make_gaussian_quantiles(   n_samples = 300, 
                                                                                n_features = 4, 
                                                                                random_state = 5, 
                                                                                mean = [1, 2, 3])
end

@testset "Matlab Generators" begin
    samples = 20000

    data = SyntheticDatasets.make_twospirals(n_samples = samples,
                                                 noise = 2.2)
    @test size(data)[1] == samples

    data = SyntheticDatasets.make_halfkernel(n_samples = samples)
    @test size(data)[1] == samples

    data = SyntheticDatasets.make_outlier(n_samples = samples)
    @test size(data)[1] == samples
    @test size(data)[2] == 3
end
