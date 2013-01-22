%Get Video Data
VideoData = VideoReader('SampleVideos/car12.mov');

MovieFrames(VideoData.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for n = 1:VideoData.NumberOfFrames
%Read the first frame from the video
VideoFrame = read(VideoData,n);

%Convert Image to GrayScale
GrayScaleImage = rgb2gray(VideoFrame);

%find edges
BW_Edges=edge(GrayScaleImage);

%find corners
corner_positions=corner(GrayScaleImage);

[m,n] = size(corner_positions);

for i = 1:m
    y=corner_positions(i,1);
    x=corner_positions(i,2);
    
    VideoFrame(x,y,1)=255;
     VideoFrame(x,y,2)=0;
      VideoFrame(x,y,3)=0;
end
f =im2frame( VideoFrame);
MovieFrames(n)=f;
end

movie(MovieFrames);

%figure; imshow(VideoFrame);
