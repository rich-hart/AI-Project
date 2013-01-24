clear all; corner_point_mov={};edge_mov={};

input_video_directory='SampleVideos/';
output_video_directory='OutputVideos/';
%Loading Video Data into a structure
input_video = VideoReader(strcat(input_video_directory,'PHP10-LYs.avi'));
output_video_corner = VideoWriter(strcat(output_video_directory,'CornerVideos','PHP10-LYs.avi'),'Motion JPEG AVI');
output_video_edge = VideoWriter(strcat(output_video_directory,'EdgeVideos''PHP10-LYs.avi'),'Motion JPEG AVI');

%create corner data if does not exist in workspace
if(isempty(corner_point_mov))
corner_point_mov=Corner_Points_Movie(input_video);
end

%create edge data if does not exist in workspace
if(isempty(edge_mov))
edge_mov=Edge_Movie(input_video);
end

%play movies
%PlayMovies(corner_point_mov);

%PlayMovies(edge_mov);
open(output_video_corner);
writeVideo(output_video_corner,corner_point_mov);
close(output_video_corner);

open(output_video_edge);
writeVideo(output_video_edge,edge_mov);
close(output_video_edge);