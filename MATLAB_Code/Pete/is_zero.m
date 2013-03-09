function [ output ] = is_zero( n )

for i=1: length(n)
   if(n(i)~=0)
   output=false;
   
   return;
   end
   
end

output= true;
end