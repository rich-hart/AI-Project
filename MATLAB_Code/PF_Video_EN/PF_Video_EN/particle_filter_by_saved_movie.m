%% Parameters

F_update = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];
% what is time complexity of given number of particles?
% when will it track 2 cells instead of one?
% Fill in wholes in edge videos then track again! In this case an
% observation is dependent on the last.  see how this effects the particle
% filter. 

%Notice that size of particles corrisponds to particle discrtibution
% fill holes before!

Npop_particles = 100;

Xstd_rgb = 1;
Xstd_pos = 1;
Xstd_vec = 1;

Xrgb_trgt = [255; 255; 255];


%% Loading Movie

vr = VideoReader('Cell_Shape_Dynamics.avi');
% Really cool! When it looses track of a cell if flies off the page!
Npix_resolution = [vr.Width vr.Height];
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

%% Object Tracking by Particle Filter

X = create_particles(Npix_resolution, Npop_particles);

%% Save File Location stuff
Nfrm_movie=10;
remaining_cells_movie(1:Nfrm_movie) = struct('cdata',[],'colormap',[]);
tracked_cells_movie(1:Nfrm_movie) = struct('cdata',[],'colormap',[]);

remaining_movie_directory='/Users/richardhart/AIProject/remaining_cells_movie/';
tracked_movie_directory='/Users/richardhart/AIProject/tracked_cells_movie/';

for k = 1: Nfrm_movie
    
    % Getting Image
    Y_k = read(vr, k);
    
    % Forecasting
    X = update_particles(F_update, Xstd_pos, Xstd_vec, X);
    
    % Calculating Log Likelihood
    L = calc_log_likelihood(Xstd_rgb, Xrgb_trgt, X(1:2, :), Y_k);
    
    % Resampling
    X = resample_particles(X, L);

    % Showing Image
    
    image_number=num2str(k);
    
   [remaining_cells_frame,tracked_cells_frame]= show_particles(X, Y_k); 
%    show_state_estimated(X, Y_k);

remaining_cells_movie(k)=remaining_cells_frame;

tracked_cells_movie(k)=tracked_cells_frame;



end
file_path=strcat(remaining_movie_directory,'remaining');
output_video_handle=VideoWriter(file_path,'Motion JPEG AVI');


            open(output_video_handle);
            writeVideo(output_video_handle,remaining_cells_movie);
            close(output_video_handle);
            
            file_path=strcat(tracked_movie_directory,'tracked');
output_video_handle=VideoWriter(file_path,'Motion JPEG AVI');


            open(output_video_handle);
            writeVideo(output_video_handle,tracked_cells_movie);
            close(output_video_handle);
%movie(new_mov,1,30);
