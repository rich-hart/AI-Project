%creating a figure object that will overlay the cell image data and 
%information gathered during image processing .e.g points of interest. 
figure;

%Loading Video Data into a structure
video_data = VideoReader('SampleVideos/car12.mov');

%preallocating memory for image processing
mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);


for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges
%BW_Edges=edge(GrayScaleImage);

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
    mov(i)=getframe;
    
end


%play the movie 
movie(mov,2,15);