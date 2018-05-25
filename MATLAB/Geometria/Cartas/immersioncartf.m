function v=immersioncartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%TORUS---------------
th=p(1)*2*pi;
phy=p(2)*2*pi;
r=3;

v(1)=(r+cos(th/2)*sin(phy)-sin(th/2)*sin(2*phy))*cos(th);
v(2)=(r+cos(th/2)*sin(phy)-sin(th/2)*sin(2*phy))*sin(th);
v(3)=sin(th/2)*sin(2*phy)+cos(th/2)*sin(2*phy);

end