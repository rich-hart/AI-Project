function [ corner_point_mov ] = Corner_Points_Movie( video_data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
handle=figure('HandleVisibility','Off');

%preallocating memory for image processing

%note that corner points vide has to be color because points are rendered
%yellow
corner_point_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find corners
corner_positions=corner(gray_scale_image);

%show the image on the figure and do not shut of renderer
 imshow(gray_scale_image); hold on 

  % Overlay valid interest points on grayscaleimage
    plot(corner_positions(:,1), corner_positions(:,2), 'y.');
    
    %turn off renderer.
    hold off;
    
    %load the image and data associated with it from the frame into the
    %movie structure
    corner_point_mov(i)=getframe;
   
end
close(handle);

end

