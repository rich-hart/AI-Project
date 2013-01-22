%Get Video Data
VideoData = VideoReader('SampleVideos/car12.mov');

%Read the first frame from the video
FirstFrame = read(VideoData,1);

%Convert Image to GrayScale
GrayScaleImage = rgb2gray(FirstFrame);

%find edges
BW_Edges=edge(GrayScaleImage);

%find corners
corner_positions=corner(GrayScaleImage);

[m,n] = size(corner_positions);

for i = 1:m
   x=corner_positions(m,1);
   y=corner_positions(m,2);
   GrayScaleImage(x,y)=0;
end


markerInserter = vision.MarkerInserter 
J = step(markerInserter,GrayScaleImage,corner_positions);