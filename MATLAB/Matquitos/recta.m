function rx=recta(Or,Ex)
syms x
vd=Ex-Or;
    if vd(1,2)==0
        rx=Or(1,2)*x;
    else
        rx=(vd(1,2)/vd(1,1))*(x-Or(1,1))+(Or(1,2));
    end
end