function v=moebiouscartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end

%MOEBIOUS---------------
t=0.5-p(2);
th=p(1)*2*pi;

v(1)=(2-t*sin(th/2))*cos(th);
v(2)=(2-t*sin(th/2))*sin(th);
v(3)=t*cos(th/2);

end