clear;

tracked_movie_directory='/Users/richardhart/AIProject/tracked_cells_movie/';
total_movies=5;
movies=cell(total_movies,1);
for tracker_number= 0:total_movies
    
 file_path=strcat(tracked_movie_directory,num2str(tracker_number+1),'.avi');
 input_video=VideoReader(file_path);
 number_of_frames=input_video.NumberOfFrames;


 

for i=1:number_of_frames
    
%Read the frame from the video
Frame = read(input_video,i);


end
 
 
 
end
 