function [ edge_mov ] = Edge_Movie( video_data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
h=figure;
edge_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges
bw_edges=edge(gray_scale_image);
gray_scale_edge_video=mat2gray(bw_edges);
gray_scale_edge_video=im2uint8(gray_scale_edge_video);
imshow(gray_scale_edge_video);
    edge_mov(i)= getframe;
end
close(h);
end

