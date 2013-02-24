function [ z ] = GeneratePathPoints( x_1,y_1,x_2,y_2,n)
x=x_1:(x_2-x_1)/n:x_2;
m=(y_2-y_1)/(x_2-x_1);
b=y_1-m*x_1;

y=m*x+b;




z=[x;y];

end

