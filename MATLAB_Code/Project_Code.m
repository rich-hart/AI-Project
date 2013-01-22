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








 

   figure; imshow(GrayScaleImage); hold on 


  % Overlay valid interest points
    plot(corner_positions(:,1), corner_positions(:,2), 'y.')