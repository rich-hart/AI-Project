clear all
%creating a figure object that will overlay the cell image data and 
%information gathered during image processing .e.g points of interest. 
figure;

%Loading Video Data into a structure
video_data = VideoReader('SampleVideos/car12.mov');




corner_point_mov=Corner_Points_Movie(video_data);
edge_mov=Edge_Movie(video_data);

figure;
%play the movie 
movie(corner_point_mov,2,15);

figure;
movie(edge_mov,2,15);