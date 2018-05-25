function [gn]=ruletaf(n,b)
%n=input('Número de tiradas = ');
%b=input('Dinero inicial = ');
bi=b;
p=1;
for i=1:n
    v=randi(37);
    jugada
    %figure (1)
    %plot(i,b-bi,'.b')
    %hold on
    %plot(i,0,'.r')
    %hold on
    %xlabel('Número de tirada')
    %ylabel('Ganancia')
    %y(i)=b-bi;
end
gn=b-bi;
%disp('---')
%disp('Ganancias = ')
%disp(' ')
%disp(gn)
%disp('---')
%disp('Tiradas = ')
%disp(' ')
%disp(i)
%disp('---')
%disp('Ganancia máxima = ')
%disp(' ')
%disp(max(y))
%disp('---')
%hold off
end