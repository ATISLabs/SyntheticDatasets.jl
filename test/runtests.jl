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

    data = SyntheticDatasets.generate_classification(n_samples = samples,
                                                    n_features = features,
                                                    n_classes = 1)

                 
    @test size(data)[1] == samples
    @test size(data)[2] == features + 1

    n_clusters = 3
    samples = 10
    features = 4
    X, rows, cols = SyntheticDatasets.generate_checkerboard((samples, features), n_clusters)
    
    @test size(X)[1] == samples
    @test size(X)[2] == features

    @test size(rows)[2] == samples 

    @test size(cols)[2] == features

end