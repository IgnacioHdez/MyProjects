function v=chaircartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%CHAIR-----------------
x=5-p(1)*10;
y=5-p(2)*10;

v(1)=x;
v(2)=y;
v(3)=x^2-y^2;

end