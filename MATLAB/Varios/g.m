function A=g(k,v,c)
A=0;
    for i=1:max(size(v))
        A=A+(1/(c*sqrt(2*pi)))*exp(-((k-v(i)).^2)/(2*c^2));
    end
end