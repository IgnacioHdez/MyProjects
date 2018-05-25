clear all
close all
A=xlsread('ReportOptimizer-1167372.xlsx');


tpA=A(:,13);
slA=A(:,12);
NlA=A(:,11);
prA=A(:,3);

figure(1)
for i=1:max(size(tpA))

    if prA(i)>0
        plot3(tpA(i),slA(i),prA(i),'b.','MarkerSize',10)
    else
        plot3(tpA(i),slA(i),prA(i),'r.','MarkerSize',10)
    end

hold on
end
xlabel('TP')
ylabel('SL')
zlabel('PR')
axis('square')
grid on
hold off
figure (2)
for i=1:max(size(tpA))
    if prA(i)>0
        plot3(NlA(i),slA(i),prA(i),'b.','MarkerSize',10)
    else
        plot3(NlA(i),slA(i),prA(i),'r.','MarkerSize',10)
    end

hold on
end

hold off
xlabel('Nl')
ylabel('SL')
zlabel('PR')
axis('square')
grid on
