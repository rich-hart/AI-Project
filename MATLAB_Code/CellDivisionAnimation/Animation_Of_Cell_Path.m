function [ output_args ] = Animation_Of_Cell_Path(x_1,y_1,x_2,y_2,n)

x=[x_1:(x_2-x_1)/n:x_2];
m=(y_2-y_1)/(x_2-x_1);
b=y_1-m*x_1

y=m*x+b;

figure;gcf;
count=1;
for i=1:n
    
   
     a=x(i);
     b=y(i);
     
plot(a,b,'o',...
    'MarkerEdgeColor','b',...
'MarkerFaceColor','b',...
'MarkerSize',30)
	axis equal
    axis([x_1 x_2 y_1 y_2])
    
	M(count) = getframe;
    count=count+1;


end

movie(M,1);
end