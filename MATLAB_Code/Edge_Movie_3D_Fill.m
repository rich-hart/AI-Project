function [ edge_mov ] = Edge_Movie_3D_Fill( video_data )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
edge_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);
black_white_matrix=false(video_data.Height,video_data.Width,video_data.NumberOfFrames);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges
bw_edges=edge(gray_scale_image);
bw_edges=imfill(bw_edges,4,'holes') ;
black_white_matrix(:,:,i)=bw_edges;


end

black_white_matrix = imfill(black_white_matrix,26,'holes') ;

for i=1:video_data.NumberOfFrames
    


%find edges
bw_edges=black_white_matrix(:,:,i);


gray_scale_edge_video=mat2gray(bw_edges);
gray_scale_edge_video=im2uint8(gray_scale_edge_video);
%imshow(gray_scale_edge_video);
    edge_mov(i)= im2frame(gray_scale_edge_video,gray(256));
end

end

