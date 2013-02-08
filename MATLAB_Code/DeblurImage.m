function [ deblurred_movie ] = DeblurImage( video_data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

deblurred_movie(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);
for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

H = fspecial('unsharp');
gray_scale_sharpened_vid = imfilter(gray_scale_image,H,'replicate');


    
    %load the image and data associated with it from the frame into the
    %movie structure
    deblurred_movie(i)=im2frame(gray_scale_sharpened_vid,gray(256)); ;
   
end

end

