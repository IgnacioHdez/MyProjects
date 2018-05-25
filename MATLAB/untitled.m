clear all
close all
n=[-inf,-5,-4,-3,-2,-1,0,1,2,3,4,5,inf];
th=2*atan(exp(-n));
disp([n',(th*360/2/pi)'])


polar(th,th./th)