clear all; corner_point_mov={};edge_mov={};



%input_video_directory='/Users/rich/AIWinter2013/SampleVideos/';
output_video_directory='/Users/rich/AIWinter2013/OutputVideos/';
%Loading Video Data into a structure
input_video_directory='SampleVideos/';
directory_data=dir(input_video_directory);

for i = 1:min(length(directory_data),1)
    file_name = 'Jordan.mov';
    if(~(isempty(strfind( lower( file_name),'mp4'))&&isempty(strfind( lower( file_name),'mov'))&&isempty(strfind( lower( file_name),'avi'))))
        input_video = VideoReader(strcat(input_video_directory,file_name));
        
       
    
        

%         
%          edge_mov=Edge_Movie(input_video);
%         
%              output_video_edge = VideoWriter(strcat(output_video_directory,'EdgeVideos/',file_name),'Motion JPEG AVI');
%         open(output_video_edge);
%         writeVideo(output_video_edge,edge_mov);
%         close(output_video_edge);
%         
%         
        
        
         
     
        
      % corner_points=Corner_Points(input_video);
%         
%         
%    
%          output_video_corner = VideoWriter(strcat(output_video_directory,'CornerVideos/',file_name),'Motion JPEG AVI');
%          open(output_video_corner);
%         writeVideo(output_video_corner,corner_point_mov);
%          close(output_video_corner);
%          str = [i, ' out of ' , min(length(directory_data),4), ' written so far']

deblurred_mov=DeblurImage( input_video );
output_file_name=strcat(output_video_directory,'DeblurredVideos/',file_name);
 output_video_blur = VideoWriter(output_file_name,'Motion JPEG AVI');
        open(output_video_blur);
        writeVideo(output_video_blur,deblurred_mov);
        close(output_video_blur);
        
          input_video = VideoReader(strcat(output_file_name,'.avi'));
                
%          edge_mov=Edge_Movie(input_video);
%         
%              output_video_edge = VideoWriter(strcat(output_video_directory,'EdgeVideos/',file_name),'Motion JPEG AVI');
%         open(output_video_edge);
%         writeVideo(output_video_edge,edge_mov);
%         close(output_video_edge);
        
              corner_point_mov = Corner_Points_Movie( input_video );
   
         output_video_corner = VideoWriter(strcat(output_video_directory,'CornerVideos/',file_name),'Motion JPEG AVI');
         open(output_video_corner);
        writeVideo(output_video_corner,corner_point_mov);
         close(output_video_corner);
    

    end
end