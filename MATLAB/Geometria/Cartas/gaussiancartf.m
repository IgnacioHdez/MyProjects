function v=gaussiancartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%CHAIR-----------------
x=1-2*p(1);
y=1-2*p(2);
x0=0;
y0=0;
s=0.3;
a=1/(s*s*2*pi);

v(1)=x;
v(2)=y;
v(3)=a*exp(-((x-x0)^2+(y-y0)^2)/(2*s^2));

end