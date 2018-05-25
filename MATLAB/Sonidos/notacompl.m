function notacompl(r0,n,temp)
r=r0*2^(n/12);
theta=2*pi*n/12;
z=r*exp(i*theta);
nota(n,temp)
plot(z,'.')
hold on
end
