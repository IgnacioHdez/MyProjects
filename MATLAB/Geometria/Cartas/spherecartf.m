function v=spherecartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%SPHERE-----------------
theta=p(1)*pi;
phy=p(2)*(2*pi);

v(1)=sin(theta)*cos(phy);
v(2)=sin(theta)*sin(phy);
v(3)=cos(theta);

end