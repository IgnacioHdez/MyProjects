function dire=finmov2pasosmix(A,ln)

nt=fbuclenmov1punt(A);
d=[0,0,0,0];

%--Escoge el paso que mayor puntuacion aporta

for ni=1:4
    for nj=1:4
        if nt(ni,nj)==max(max(nt))
            d(ni)=d(ni)+1;
        end
    end
end

for njj=1:4
    if d(njj)==max(d)
        dire=njj;
    end
end

%--Si el movimiento no hace nada elige por ceros

if Mov(dire,A)==A
   
for ni=1:4
    for nj=1:4
        if nt(ni,nj)==max(max(nt))
            d(ni)=d(ni)+1;
        end
    end
end

for njj=1:4
    if d(njj)==max(d)
        dire=njj;
    end
end

end

%--

if Mov(dire,A)==A
    d=fbuclenmov2punt(A);
for njj=1:4
    if d(njj)==max(d)
        dire=njj;
    end
end
end

if Mov(dire,A)==A
    dire=randi(4);
end

%--

l=rand*100;

if l>ln
    dire=2*randi(2);
end

end