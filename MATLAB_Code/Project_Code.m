%Get Video Data
VideoData = VideoReader('SampleVideos/car12.mov');

%Read the first frame from the video
FirstFrame = read(VideoData,1)

%Read an Image
TestCellImage = imread('SampleImages/spatia8.gif');
%Find Edges in that Image
BW = edge(TestCellImage);