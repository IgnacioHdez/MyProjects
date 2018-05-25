clear all
A=[1,0,1;2,1,1;0,1,0];
b=[3;2;1];
    tic
        x=inv(A)*b;
    t1=toc;
    tic
        y=A\b;
    t2=toc;
    tic
        z=mldivide(A,b);
    t3=toc;
z