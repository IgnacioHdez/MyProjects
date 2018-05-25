function a=anut(rot,pre,nut,wrot,wnut,wpre,l1,l2,g,m,torque,d)
a=(m*g*d*sin(nut)+(l1-l2)*wpre*sin(nut)*wrot)/l2;
end