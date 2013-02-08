function [ color_mov ] = Color_Region_Movie( video_data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%h=figure('HandleVisibility','off');
color_to_filter='G';
color_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale


%find edges
filtered_color_image=colorfilter(Frame,color_to_filter);


    color_mov(i)= im2frame(filtered_color_image);
end
%close(h);
end



