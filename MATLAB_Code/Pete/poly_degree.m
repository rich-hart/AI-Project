function [ output ] = poly_degree( n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


for i=1:length(n) 
   if(n(i)~=0)
      output=length(n) -i;
   
   return;
   end
   
end

output= 0;

end

