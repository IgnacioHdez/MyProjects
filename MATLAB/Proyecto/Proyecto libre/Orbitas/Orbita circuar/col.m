function v=col(rx,ry,rz,vx,vy,vz,s)
if rx>=s
    vx=-vx;
end
if rx<=0
    vx=-vx;
end
if ry>=s
    vy=-vy;
end
if ry<=0
    vy=-vy;
end
if rz>=s
    vz=-vz;
end
if rz<=0
    vz=-vz;
end
v=[vx,vy,vz];
end