function plotcartf(N,cartf)
%Plots the Cartf cart
hi=1;
hj=1;
for i=linspace(0,1,N)
    for j=linspace(0,1,N)
        v=cartf([i,j]);
        X(hi,hj)=v(1);
        Y(hi,hj)=v(2);
        Z(hi,hj)=v(3);

        hj=hj+1;
    end
    hi=hi+1;
    hj=1;
end
surf(X,Y,Z)
axis equal
end