%% Parameters

F_update = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];

Npop_particles = 10000;

Xstd_rgb = 1;
Xstd_pos = 1;
Xstd_vec = 30;

Xrgb_trgt = [255; 255; 255];

%% Loading Movie

vr = VideoReader('car12.avi');

Npix_resolution = [vr.Width vr.Height];
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

%% Object Tracking by Particle Filter

X = create_particles(Npix_resolution, Npop_particles);

for k = 1:Nfrm_movie
    
    % Getting Image
    Y_k = read(vr, k);
    
    % Forecasting
    X = update_particles(F_update, Xstd_pos, Xstd_vec, X);
    
    % Calculating Log Likelihood
    L = calc_log_likelihood(Xstd_rgb, Xrgb_trgt, X(1:2, :), Y_k);
    
    % Resampling
    X = resample_particles(X, L);

    % Showing Image
    show_particles(X, Y_k); 
%    show_state_estimated(X, Y_k);

end

