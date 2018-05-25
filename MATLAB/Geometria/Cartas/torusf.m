function v=torusf(p)
%p: parametres of the cart going always from 0 to 1


%TORUS---------------
x=p(1);
y=p(2);
r=0.3;
R=1;

v(1)=(R+r*cos(y))*cos(x);
v(2)=(R+r*cos(y))*sin(x);
v(3)=r*sin(y);

end