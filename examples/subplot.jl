using StatsPlots, SyntheticDatasets

blobs = SyntheticDatasets.make_blobs(   n_samples = 1000, 
                                        n_features = 2,
                                        centers = [-1 1; -0.5 0.5], 
                                        cluster_std = 0.25,
                                        center_box = (-2.0, 2.0), 
                                        shuffle = true,
                                        random_state = nothing);

@df blobs scatter(:feature_1, :feature_2, group = :label, title = "Blobs")

gauss = SyntheticDatasets.make_gaussian_quantiles(  mean = [10,1], 
                                                    cov = 2.0,
                                                    n_samples = 1000, 
                                                    n_features = 2,
                                                    n_classes = 3, 
                                                    shuffle = true,
						                            random_state = 2);

@df gauss scatter(:feature_1, :feature_2, group = :label, title = "Gaussian Quantiles")

spirals = SyntheticDatasets.make_twospirals(n_samples = 2000, 
                                            start_degrees = 90,
                                            total_degrees = 570, 
                                            noise =0.1);

@df spirals scatter(:feature_1, :feature_2, group = :label, title = "Two Spirals")

kernel = SyntheticDatasets.make_halfkernel( n_samples = 1000, 
                                            minx = -20,
                                            r1 = 20, 
                                            r2 = 35,
                                            noise = 3.0, 
                                            ratio = 0.6);

@df kernel scatter(:feature_1, :feature_2, group = :label, title = "Half Kernel")