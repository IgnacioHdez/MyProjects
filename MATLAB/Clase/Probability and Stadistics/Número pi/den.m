function [den]=den(x,y)
den=0;
r=sqrt(x^2+y^2);
if r<=1
   den=1;
end