xm=input('mean = ');
sig=input('stn dev = ');
n=input('number of points = ');
for i=0:n
    x=rand*xm+sig;
    y = exp(-0.5 * ((x - xm)./sig).^2) ./ (sqrt(2*pi) .* sig);
    pnt=[x,y];

plot(x,y,'.b')
hold on
end