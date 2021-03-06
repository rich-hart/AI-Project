clear all; corner_point_mov={};edge_mov={};
run_type=0;
%NOTES!!! TRY RUNNING THE PROGRAM BACKWARDS TO CATCH CELLS AS THEY GROW

%input_video_directory='/Users/rich/AIWinter2013/SampleVideos/';
output_video_directory='/Users/richardhart/AIProject/remaining_cells_movie/';
%Loading Video Data into a structure
input_video_directory='SampleVideos/';
directory_data=dir(input_video_directory);

for i = 1:min(length(directory_data),1)
    file_name = 'Cell_Shape_Dynamics.mp4';
    if(~(isempty(strfind( lower( file_name),'mp4'))&&isempty(strfind( lower( file_name),'mov'))&&isempty(strfind( lower( file_name),'avi'))))
        input_video = VideoReader(strcat(input_video_directory,file_name));
        
        
        if(run_type==0)
            
            
            
            edge_mov=Edge_Movie(input_video);
            file_path=strcat(output_video_directory,num2str(0))
            output_video_edge = VideoWriter(file_path,'Motion JPEG AVI');
            open(output_video_edge);
            writeVideo(output_video_edge,edge_mov);
            close(output_video_edge);
            
            
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
        
        
    end
end


