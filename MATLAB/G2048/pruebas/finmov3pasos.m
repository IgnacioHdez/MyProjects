function dire=finmov3pasos(A,ln)

A1=Mov(1,A);
A2=Mov(2,A);
A3=Mov(3,A);
A4=Mov(4,A);

n1=fbuclenmov1(A1);
n2=fbuclenmov1(A2);
n3=fbuclenmov1(A3);
n4=fbuclenmov1(A4);
d=[max(max(n1)),max(max(n2)),max(max(n3)),max(max(n4))];

%--Escoge el paso que mayor número de ceros aporta

% for ni=1:4
%     for nj=1:4
%         if nt(ni,nj)==max(max(nt))
%             d(ni)=d(ni)+1;
%         end
%     end
% end

for njj=1:4
    if d(njj)==max(d)
        dire=njj;
    end
end

%--Si el movimien

if Mov(dire,A)==A
    d=fbuclenmov1(A);
for njj=1:4
    if d(njj)==max(d)
        dire=njj;
    end
end
end

%--

if Mov(dire,A)==A
    dire=randi(4);
end

%--

l=rand*100;

if l>ln
    dire=2*randi(2);
end

end