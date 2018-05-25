function v=gammaf(t,Cartf)
%t: parametres of the cart going always from 0 to 1


p(1)=t;

while p(1)>1
    p(1)=p(2);
end


p(2)=t;

while p(2)>1
    p(2)=p(1);
end

v=Cartf(p);

end