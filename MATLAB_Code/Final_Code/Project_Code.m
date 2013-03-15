clear all; 
run_type=0;
%NOTES!!! TRY RUNNING THE PROGRAM BACKWARDS TO CATCH CELLS AS THEY GROW

%input_video_directory='/Users/rich/AIWinter2013/SampleVideos/';
output_video_directory='/Users/richardhart/AIProject/remaining_cells_movie/';
%Loading Video Data into a structure
input_video_directory='SampleVideos/';
directory_data=dir(input_video_directory);

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

remaining_movie_directory='/Users/richardhart/AIProject/remaining_cells_movie/';
tracked_movie_directory='/Users/richardhart/AIProject/tracked_cells_movie/';
tic;
 file_name = 'Cell_Shape_Dynamics.mp4';
for i = 1:min(length(directory_data),1)
   
  
        input_video = VideoReader(file_name);
        
    Npix_resolution = [input_video.Width input_video.Height];
Nfrm_movie = floor(input_video.Duration * input_video.FrameRate);

Nfrm_movie=min([20*10,Nfrm_movie]);
remaining_cells_movie(1:Nfrm_movie) = struct('cdata',[],'colormap',[]);
tracked_cells_movie(1:Nfrm_movie) = struct('cdata',[],'colormap',[]);

% Really cool! When it looses track of a cell if flies off the page!

        if(run_type==0)
            
            
            
            edge_mov=Edge_Movie(input_video);
            
            
        end
        
        
        if(run_type==1)
            
            
            corner_point_mov = Corner_Points_Movie( input_video );
            
            
            
            output_video_corner = VideoWriter(strcat(output_video_directory,'CornerVideos/',file_name),'Motion JPEG AVI');
            open(output_video_corner);
            writeVideo(output_video_corner,corner_point_mov);
            close(output_video_corner);
        end
        
        if(run_type==2)
            seg_mov= Segmentation_Movie( input_video );
            output_video_corner = VideoWriter(strcat(output_video_directory,'SegmentedVideos/',file_name),'Motion JPEG AVI');
            open(output_video_corner);
            writeVideo(output_video_corner,seg_mov);
            close(output_video_corner);
            
        end
        
        if(run_type==3)
            color_movie= Color_Region_Movie( input_video);
            
            output_video_color = VideoWriter(strcat(output_video_directory,'ColorMovies/',file_name),'Motion JPEG AVI');
            open(output_video_color);
            writeVideo(output_video_color,color_movie);
            close(output_video_color);
        end
        
        %color filter and edges.
        if(run_type==4)
            color_movie= Color_Region_Movie( input_video);
            
            output_video_color = VideoWriter(strcat(output_video_directory,'ColorMovies/',file_name),'Motion JPEG AVI');
            open(output_video_color);
            writeVideo(output_video_color,color_movie);
            close(output_video_color);
            
            input_video = VideoReader(strcat(output_video_directory,'ColorMovies/',file_name,'.avi'));
            
            edge_mov=Edge_Movie(input_video);
            
            output_video_edge = VideoWriter(strcat(output_video_directory,'EdgeVideos/',file_name),'Motion JPEG AVI');
            open(output_video_edge);
            writeVideo(output_video_edge,edge_mov);
            close(output_video_edge);
            
        end
        
        if(run_type==5)
            
            
            
            edge_mov=Edge_Movie_3D_Fill(input_video);
            
            output_video_edge = VideoWriter(strcat(output_video_directory,'3DEdgeFill/',file_name),'Motion JPEG AVI');
            open(output_video_edge);
            writeVideo(output_video_edge,edge_mov);
            close(output_video_edge);
            
            
        end
        
        %Rendering the movie data in 3d. using edge's 
        if(run_type==6)
            
            
            
            [X,Y,Z,C ]=GenerateMesh(input_video);
            k= randsample(length(X),floor(length(X)*.1));
            x=X( k);
            y=Y( k);
            z=Z(k);
            c=C(k,1:3);
            colormap(c);
            color_index=1:length(c);
             color_index= color_index';
            scatter3(x,y,z,1,color_index,'.');
            
            % surf(X,Y,Z);
            
            %
            
        end
        
         %Rendering the movie data in 3d. using edge's 
        if(run_type==7)
            
            
            
            [X,Y,Z,C ]=GenerateMeshColor(input_video);
            k=length(X);
            %k= randsample(length(X),floor(length(X)*.1));
            x=X( k);
            y=Y( k);
            z=Z(k);
            c=C(1:k,1:3);
            colormap(C);
            color_index=1:length(c);
             color_index= color_index';
            scatter3(X,Y,Z,1,color_index,'.');
            
            % surf(X,Y,Z);
            
            %
%              k= 1:40000;
% k=k';
%             x=X( k);
%             y=Y( k);
%             z=Z(k);
%             c=C(k,1:3);
%             colormap(c);
%             color_index=1:length(c);
%              color_index= color_index';
%             scatter3(x,y,z,1,color_index,'.');
        end
        
        %          str = [i, ' out of ' , min(length(directory_data),4), ' written so far']
        
        % deblurred_mov=DeblurImage( input_video );
        % output_file_name=strcat(output_video_directory,'DeblurredVideos/',file_name);
        %  output_video_blur = VideoWriter(output_file_name,'Motion JPEG AVI');
        %         open(output_video_blur);
        %         writeVideo(output_video_blur,deblurred_mov);
        %         close(output_video_blur);
        
        %  input_video = VideoReader(strcat(output_file_name,'.avi'));
        
        %          edge_mov=Edge_Movie(input_video);
        %
        %              output_video_edge = VideoWriter(strcat(output_video_directory,'EdgeVideos/',file_name),'Motion JPEG AVI');
        %         open(output_video_edge);
        %         writeVideo(output_video_edge,edge_mov);
        %         close(output_video_edge);
        
        %               corner_point_mov = Corner_Points_Movie( input_video );
        %
        %          output_video_corner = VideoWriter(strcat(output_video_directory,'CornerVideos/',file_name),'Motion JPEG AVI');
        %          open(output_video_corner);
        %         writeVideo(output_video_corner,corner_point_mov);
        %          close(output_video_corner);
        
        


        


for tracker_number= 0:3
%% Loading Movie



%% Object Tracking by Particle Filter

X = create_particles(Npix_resolution, Npop_particles);

%% Save File Location stuff

remaining_cells_movie=edge_mov;


for k = 1: 10%Nfrm_movie
    
    % Getting Image
    Y_k =remaining_cells_movie(k) 
    
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



output_video_handle=VideoWriter(num2str(tracker_number+1),'Motion JPEG AVI');


            open(output_video_handle);
            writeVideo(output_video_handle,tracked_cells_movie);
            close(output_video_handle);
end
    end

toc
%movie(new_mov,1,30);


