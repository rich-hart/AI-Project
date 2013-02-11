function [x,y,z ] =GenerateMesh( video_data )

%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
x=[];
y=[];
z=[];

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



for i = 1: video_data.Height
   for j =1: video_data.Width
       for k = 1:video_data.NumberOfFrames
          if( black_white_matrix(i,j,k))
             x=[x;i];
             y=[y;j];
             z=[z;k];
          end
       end
   end
end


    

%[X,Y,Z] =meshgrid(x,y,z);




end




