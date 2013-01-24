
   figure;
%Get Video Data
VideoData = VideoReader('SampleVideos/car12.mov');

for i=1:VideoData.NumberOfFrames
%Read the first frame from the video
FirstFrame = read(VideoData,i);

%Convert Image to GrayScale
GrayScaleImage = rgb2gray(FirstFrame);

%find edges
BW_Edges=edge(GrayScaleImage);

%find corners
corner_positions=corner(GrayScaleImage);

 

 imshow(GrayScaleImage); hold on 


  % Overlay valid interest points
    plot(corner_positions(:,1), corner_positions(:,2), 'y.');
    
    hold off;
    
    F(i)=getframe;
    
end

movie(F);