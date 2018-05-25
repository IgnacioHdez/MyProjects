function w=loc(v,N)
n=max(size(v));
for i=1:N
w(i)=v(n-N+i);
end

end