function [x,y,z,c ] =GenerateMesh( video_data )

%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
total_number_of_pixels= video_data.NumberOfFrames*video_data.Height* video_data.Width;

x=zeros(total_number_of_pixels,1);
y=zeros(total_number_of_pixels,1);
z=zeros(total_number_of_pixels,1);
c=zeros(total_number_of_pixels,3);

counter=0;

for k=1:video_data.NumberOfFrames
    
    %Read the frame from the video
    Frame = read(video_data,k);
    
    %Convert Image to GrayScale
    gray_scale_image = rgb2gray(Frame);
    
    %find edges
    bw_edges=edge(gray_scale_image);
    bw_edges=imfill(bw_edges,4,'holes') ;
    for i = 1: video_data.Height
        for j =1: video_data.Width
            if(bw_edges(i,j))
                  counter=counter+1;
                x(counter)=i;
                y(counter)=j;
                z(counter)=k;
                c(counter,1)=Frame(i,j,1)/256;
                c(counter,2)=Frame(i,j,2)/256;
                c(counter,3)=Frame(i,j,3)/256;
              
            end
        end
    end
    
    x=x(1:counter);
    y=y(1:counter);
    z=z(1:counter);
    c=c(1:counter,1:3);
    %[X,Y,Z] =meshgrid(x,y,z);
    
    
    
    
end
end




