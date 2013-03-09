function [ d ] = poly_mult( t , d )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

m=zeros(1,2*max(length(t),length(d)));

calc_matrix=zeros(2*length(t),2*length(d));

for i=1:length(t)
   for j=1:length(d)
       calc_matrix(i,j)=t(i)*d(j);
   end
end



end

