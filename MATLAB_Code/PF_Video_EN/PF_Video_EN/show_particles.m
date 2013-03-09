function [remaining_cells_frame,tracked_cells_frame]= show_particles(particle_locations, tracked_image)



h=figure(1);
image(tracked_image)
title('+++ Showing Particles +++')

hold on

c_values=particle_locations(2,:);
r_values=particle_locations(1,:);
plot(c_values, r_values, '.')
hold off

drawnow




BW = im2bw(tracked_image, .5);

tracked_cells_bw=bwselect(BW,c_values,r_values,4);



remaining_cells_bw=BW-tracked_cells_bw;
remaining_cells_gray=mat2gray(remaining_cells_bw);
remaining_cells_gray=im2uint8(remaining_cells_gray);
figure(2);
imshow(remaining_cells_gray);
remaining_cells_frame=im2frame(remaining_cells_gray,gray(256));


tracked_cells_gray=mat2gray(tracked_cells_bw);
tracked_cells_gray=im2uint8(tracked_cells_gray);
%figure(2);
%imshow(tracked_cells_gray);
tracked_cells_frame=im2frame(tracked_cells_gray,gray(256));




end
