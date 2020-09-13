using SyntheticDatasets
using DataFrames
using Test

@testset "SkLearn Generators" begin
    samples = 20000
    features = 20

    data = SyntheticDatasets.generate_blobs(centers = [-1 1;-0.5 0.75], 
                                            cluster_std = 0.225, 
                                            n_samples = 20000,
                                            center_box = (-1.5, 1.5))
    
    @test size(data)[1] == samples
    @test size(data)[2] == 3

    samples = 20000
    data = SyntheticDatasets.generate_moons(n_samples = 20000)

    @test size(data)[1] == samples
    @test size(data)[2] == 3

    data = SyntheticDatasets.generate_s_curve(n_samples = samples,
                                              noise = 2.2,
                                              random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 4

    data = SyntheticDatasets.generate_circles(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 3

    data = SyntheticDatasets.generate_regression(n_samples = samples,
                                                 n_features = features,
                                                 noise = 2.2,
                                                 random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.generate_classification(   n_samples = samples,
                                                        n_features = features,
                                                        n_classes = 1)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.generate_friedman1(n_samples = samples,
                                                n_features = features)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    data = SyntheticDatasets.generate_friedman2(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 5

    data = SyntheticDatasets.generate_friedman3(n_samples = samples)

    @test size(data)[1] == samples
    @test size(data)[2] == 5

    data = SyntheticDatasets.generate_low_rank_matrix(  n_samples = samples,
                                                        n_features = features,
                                                        effective_rank = 10,
                                                        tail_strength = 0.5,
                                                        random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features

    data = SyntheticDatasets.generate_swiss_roll(n_samples = samples,
                                                 noise = 2.2,
                                                 random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 4

    data = SyntheticDatasets.generate_hastie_10_2(  n_samples = samples,
                                                    random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == 11

    data = SyntheticDatasets.generate_gaussian_quantiles(   n_samples = samples,
                                                            n_features = features,
                                                            random_state = 5)

    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    let err = nothing
        try
            error(SyntheticDatasets.generate_gaussian_quantiles(n_samples = 300, n_features = 4, random_state = 5, mean = [1, 2, 3]))
        catch err
        end

        @test sprint(showerror, err) == "\"length of mean must be equal to n_features.\""

    end
    
end

@testset "Matlab Generators" begin
    samples = 20000

    data = SyntheticDatasets.generate_twospirals(n_samples = samples,
                                                 noise = 2.2)

    @test size(data)[1] == samples
end
