function [remaining_cells_frame,tracked_cells_frame]= show_particles(particle_locations, tracked_image)

[m n] = size(tracked_image);
c_values=particle_locations(2,:);
 r_values=particle_locations(1,:);
 
if(((0<=min(c_values) && max(c_values)<=m)...
       && (0<=min(r_values) && max(r_values)<=n)))


h=figure(1);
image(tracked_image)
%title('+++ Showing Particles +++')

hold on


plot(c_values, r_values, '.','MarkerSize',10);
hold off

drawnow



BW = im2bw(tracked_image, .5);

tracked_cells_bw=bwselect(BW,c_values,r_values,4);



remaining_cells_bw=BW-tracked_cells_bw;
remaining_cells_gray=mat2gray(remaining_cells_bw);
remaining_cells_gray=im2uint8(remaining_cells_gray);
%figure(2);
%imshow(remaining_cells_gray);
remaining_cells_frame=im2frame(remaining_cells_gray,gray(256));


tracked_cells_gray=mat2gray(tracked_cells_bw);
tracked_cells_gray=im2uint8(tracked_cells_gray);
%figure(2);
%imshow(tracked_cells_gray);
tracked_cells_frame=im2frame(tracked_cells_gray,gray(256));

tracked_cells_frame= getframe(h);
else
    tracked_cells_gray=mat2gray(true(size(tracked_image)));
tracked_cells_gray=im2uint8(tracked_cells_gray);

tracked_cells_frame=im2frame(tracked_cells_gray,gray(256));

end


end
