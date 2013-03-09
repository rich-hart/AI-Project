function [ q,r ] = poly_divid_mod( n , d , p )

% function n / d:
%   require d ? 0
%   (q, r) ? (0, n)            # At each step n = d × q + r
%   while r ? 0 AND degree(r) ? degree(d):
%      t ? lead(r)/lead(d)     # Divide the leading terms
%      (q, r) ? (q + t, r - (t * d))
%   return (q, r)

q=[];
r=[];

if(is_zero(d))
   return; 
end

q=zeros(1,length(n));

d = [ zeros(1,length(n)-length(d)) d];


r=n;


while(~is_zero(r) && (poly_degree(r)>=poly_degree(d)))
   
    t=zeros(1,length(n));
    
    
    degree = poly_degree(r)-poly_degree(d);
    
    t(degree)=poly_lead(r)/poly_lead(d);
    
    q=q+t;
    
    
    
    r =r-poly_mult(t,d);
end



end


