function n=normalf(p,h,cartf)

[a,b]=tangentf(p,h,cartf);

n=cross(a,b);
n=n/norm(n);

end