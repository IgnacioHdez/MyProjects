function ending=Endtest(A)
ending=0;
n0=0;
for i=1:4
    for j=1:4
        if A(i,j)~=0
            n0=n0+1;
        end
    end
end

if n0==16
    for i=1:3
        for j=1:4
            if A(i,j)~=A(i+1,j)
                n0=n0+1;
            end
        end
    end
    for j=1:3
        for i=1:4
            if A(i,j)~=A(i,j+1)
                n0=n0+1;
            end
        end
    end
end

if n0==40
    ending=1;
end