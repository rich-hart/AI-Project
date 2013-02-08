function [ seg_mov ] = Segmentation_Movie( video_data )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
seg_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges

gray_scale_seg_video_frame=FuzzySegmentation(gray_scale_image);
%imshow(gray_scale_edge_video);
    seg_mov(i)= im2frame(gray_scale_seg_video_frame,gray(256));
    
    str = [i, ' out of ' , video_data.NumberOfFrames, ' written so far']
end
%close(h);

end

