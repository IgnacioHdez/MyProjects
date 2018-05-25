function vx=vx(x,y,t,p)
%vx=y-p(1)*x;
%vx=p(2)*(y-x*x*x/3+x);
vx=x*(1-x+p(1)*y);
end