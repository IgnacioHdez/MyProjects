clear all 
%Matriz de spines A de dimension n. 1 significa arriba y -1 abajo
n=10;
N=100;
f=0.9;

for i=1:n
    for j=1:n
        A(i,j)=(-1)^randi(2);
    end
end
%Recorro la red para determinar los valores estadisticos
for h=1:N
A=transform(A,f);

% if h/floor(N/10)==floor(h/floor(N/10))
%     matrixplot(A);
% end

end

matrixplot(A);
disp(sum(sum(A))/(n*n))
