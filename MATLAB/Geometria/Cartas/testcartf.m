function v=testcartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%TORUS---------------
x=3*(2*p(1)-1);
y=3*(2*p(2)-1);

v(1)=x;
v(2)=y;
v(3)=sin(x)+cos(y);

end