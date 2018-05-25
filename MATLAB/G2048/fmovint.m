function dire=fmovint(A,ln)

pmax=fpunt(Mov(1,(Mov(1,A))));
for i=1:4
    for j=1:4
        pt=fpunt(Mov(j,(Mov24(i,A))));
        if pt>=pmax
            dire=i;
            pmax=pt;
        end
    end
end


%--Si el movimiento no cambia nada

pmax=fpunt(Mov(1,A));
if Mov(dire,A)==A
    for i=1:4
            pt=fpunt(Mov(i,A));
            if pt>=pmax
                dire=i;
                pmax=pt;
            end
    end
end

%--

if Mov(dire,A)==A
    dire=randi(4);
end

%--

if rand*100<ln
    dire=2*randi(2);
end

end