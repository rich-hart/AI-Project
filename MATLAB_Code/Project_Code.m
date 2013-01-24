clear all
%creating a figure object that will overlay the cell image data and 
%information gathered during image processing .e.g points of interest. 
figure;

%Loading Video Data into a structure
video_data = VideoReader('SampleVideos/car12.mov');

%preallocating memory for image processing

%note that corner points vide has to be color because points are rendered
%yellow
corner_point_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

edge_mov(1:video_data.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for i=1:video_data.NumberOfFrames
    
%Read the frame from the video
Frame = read(video_data,i);

%Convert Image to GrayScale
gray_scale_image = rgb2gray(Frame);

%find edges
bw_edges=edge(gray_scale_image);
gray_scale_edge_video=mat2gray(bw_edges);
gray_scale_edge_video=im2uint8(gray_scale_edge_video);
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
    corner_point_mov(i)=getframe;
    edge_mov(i)= im2frame(gray_scale_edge_video,gray);
end

figure;
%play the movie 
movie(corner_point_mov,2,15);

figure;
movie(edge_mov,2,15);