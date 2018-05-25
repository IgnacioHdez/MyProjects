clear all
close all
A=xlsread('ReportOptimizer-116737.xlsx');
B=xlsread('ReportOptimizer-116738.xlsx');
C=xlsread('ReportOptimizer-116739.xlsx');
tpA=A(:,12);
slA=A(:,11);
prA=A(:,3);

tpB=B(:,12);
slB=B(:,11);
prB=B(:,3);

tpC=C(:,12);
slC=C(:,11);
prC=C(:,3);

for i=1:max(size(tpA))+max(size(tpB)) +max(size(tpC))
if i<=max(size(tpA))
    if prA(i)>0
        plot3(tpA(i),slA(i),prA(i),'b.','MarkerSize',10)
    else
        plot3(tpA(i),slA(i),prA(i),'r.','MarkerSize',10)
    end
elseif i>max(size(tpA)) && i<=max(size(tpA))+max(size(tpB))
    j=i-max(size(tpA));
    if prB(j)>0
        plot3(tpB(j),slB(j),prB(j),'b.','MarkerSize',10)
    else
        plot3(tpB(j),slB(j),prB(j),'r.','MarkerSize',10)
    end
else
    k=i-max(size(tpA))-max(size(tpB));
    if prC(k)>0
        plot3(tpC(k),slC(k),prC(k),'b.','MarkerSize',10)
    else
        plot3(tpC(k),slC(k),prC(k),'r.','MarkerSize',10)
    end

end
hold on
end




hold off
xlabel('TK')
ylabel('SL')
zlabel('PR')
axis('square')
grid on
