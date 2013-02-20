function [ edge_mov ] = Edge_Movie( video_data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%h=figure('HandleVisibility','off');
edge_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges
[~, threshold]=edge(gray_scale_image, 'sobel');

fudgeFactor = .5;
bw_edges = edge(I,'sobel', threshold * fudgeFactor);

%bw_edges= imfill(bw_edges,4 ,'holes') ;
%[BW2,locations]=imfill(bw_edges);

se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);

BWsdil = imdilate(bw_edges, [se90 se0]);
BWdfill = imfill(BWsdil, 'holes');
BWnobord = imclearborder(BWdfill, 4);
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);


gray_scale_edge_video=mat2gray(BWfinal);
gray_scale_edge_video=im2uint8(gray_scale_edge_video);
%imshow(gray_scale_edge_video);
    edge_mov(i)= im2frame(gray_scale_edge_video,gray(256));
end
%close(h);
end

