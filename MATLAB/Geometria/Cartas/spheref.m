function v=spheref(p)


%SPHERE-----------------
theta=p(1);
phy=p(2);

v(1)=sin(theta)*cos(phy);
v(2)=sin(theta)*sin(phy);
v(3)=cos(theta);

end