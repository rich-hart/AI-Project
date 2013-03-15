function [ corner_points ] = Corner_Points( video_data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%corner_points(1:video_data.NumberOfFrames) ;

% If value is a cell array,
% then s is a structure array with the 
% same dimensions as value. Each element of
% s contains the corresponding element of value.
% For example, s = struct('f',{'a','b'}) 
% returns s(1).f = 'a' and s(2).f = 'b'.

corner_points(1:video_data.NumberOfFrames)=  cell(1,video_data.NumberOfFrames);

for i=1:5%video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find corners

corner_points(i)={corner(gray_scale_image)};

  
end


end





