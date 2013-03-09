function frame= show_particles(X, Y_k)



h=figure(1);
image(Y_k)
title('+++ Showing Particles +++')

hold on

c_values=X(2,:);
r_values=X(1,:);
plot(c_values, r_values, '.')
hold off

drawnow




BW = im2bw(Y_k, 0);

BW2=bwselect(BW,r_values,c_values,8);



BW_final=BW-BW2;
gray_cells=mat2gray(BW_final);
gray_cells=im2uint8(gray_cells);
figure(2);
imshow(gray_cells);
%frame=im2frame(gray_cells,gray(256));


end
