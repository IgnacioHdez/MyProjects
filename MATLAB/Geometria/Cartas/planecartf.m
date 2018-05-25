function v=planecartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end

%PLANE-----------------
 v(1)=p(1);
 v(2)=p(2);
 v(3)=1;

end