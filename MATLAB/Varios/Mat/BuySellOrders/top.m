function t=top(v)
%Reorganize a vector v in ascending order
n=max(size(v));
h=1;
i=1;
t(1)=0;
while size(t)<n
   if v(i)==max(v)
       t(h)=i;
       v(i)=-inf;
       h=h+1;
       i=0;
   end
   i=i+1;
end

end