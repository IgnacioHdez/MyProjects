function matrixplot(A)
figure (1)
n=max(size(A));
for i=1:n
    for j=1:n
        if A(i,j)==1
        %plot(i-1,j-1,'sw','MarkerSize',20)
        %hold on
        else
        plot(i-1,j-1,'.k','MarkerSize',10)
        hold on
        end
    end
end
axis([-1,n,-1,n])
hold off
F=getframe;
end