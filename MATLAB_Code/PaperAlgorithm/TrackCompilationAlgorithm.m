
%  Li, K., & Kanade, T. (n.d.). Cell Population Tracking 
% and Lineage Construction Using Multiple-Model Dynamics Filters
% and Spatiotemporal Optimization, 1?8.

%Algorithm 1:

% for frame number k .
% $\Omega_{0} \equiv$ 'Background Region' \\\\
%$\Omega_{0}=\{(x,y)|\psi^{*}_{k}(x,y)=0\}$

% so  \Omega_{0}= the pixel values that are part of the background



xyloObj = VideoReader('Cell_Shape_Dynamics.avi'); 

nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width;

% Preallocate movie structure.
movie = false(vidHeight, vidWidth,nFrames);

% Read one frame at a time.
for k = 1 : 1 %nFrames
    color_image = read(xyloObj, k);
    binary_image=im2bw(color_image);
   
    
    connected_component = bwconncomp(binary_image);
numPixels = cellfun(@numel,connected_component.PixelIdxList);

[biggest,idx] = max(numPixels);

for i = 1:length(numPixels)
    if(i~=idx)

 binary_image(connected_component.PixelIdxList{i}) = 0;
    end


end

figure, imshow(binary_image);
   % movie(:,:,k)= im2bw(color_image);
    
end

% % Size a figure based on the video's width and height.
% hf = figure;
% set(hf, 'position', [150 150 vidWidth vidHeight])
% 
% % Play back the movie once at the video's frame rate.
% movie(hf, mov, 1, xyloObj.FrameRate);


