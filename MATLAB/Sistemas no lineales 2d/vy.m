function vy=vy(x,y,t,p)
%vy=(x^2)/(1+x^2)-p(2)*y;
%vy=-(x-p(1))/p(2);
vy=p(3)*y*(1-y+p(2)*x);
end