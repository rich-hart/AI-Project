function [ ] = PlayMovies( mov )
%function to play movies becauses matlabs player sucks.
handle=figure;
movie(mov,1,30);
close(handle);
end

