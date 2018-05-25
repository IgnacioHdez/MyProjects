function a=apre(rot,pre,nut,wrot,wnut,wpre,l1,l2,g,m,torque,d)
a=(((1/l2)*(torque*sin(nut)+(l2-l1)*wrot*wnut))-wpre*wnut*cos(nut))/sin(nut);
end