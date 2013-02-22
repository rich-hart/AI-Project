% 
% r=1;
% x = -pi:.1:pi;
% y = sin(x);

for k = 1:100
	plot(k,k,'o',...
    'MarkerEdgeColor','b',...
'MarkerFaceColor','b',...
'MarkerSize',10)
	axis equal
    axis([0 100 0 100])
	M(k) = getframe;
end

movie(M,1);
% 
% r=1;
% 
% min=-1;
% 
% max=1;
% 
% x = min:.1:max;
% 
% y = min:.1:max;
% 
% bw=false(length(x),length(y));
% 
% for i=-1:.1:length(x)
%    for j=-1:.1: length(y)
%        if i*j<=r*r-j*j
%            bw(floor(i-min),floor(j-min))=true;
%        end
%    end
% end
% 
% plot(x,y);figure(gcf);
% 
% 
% h = uicontrol('style','slider','position',...
% 	[10 50 20 300],'Min',1,'Max',16,'Value',1)
% for k = 1:16
% 	plot(fft(eye(k+16)))
% 	axis equal
% 	set(h,'Value',k)
% 	M(k) = getframe(gcf);
% end
% 
% clf
% axes('Position',[0 0 1 1])
% movie(M,30)
% 
% f := plot::Function2d(cos(2*x)+cos(x), x=-PI..PI):
% h := plot::Hatch(f):
% plot(h, f)