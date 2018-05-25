clear all
close all
n=50;
N=30;

a=linspace(-1,2,n);
b=linspace(-1,2,n);

for i=1:n
    for j=1:n
        A=[a(i),b(j);0,a(i)];
        B=zeros(2,2);
        for k=0:N
            B=B+A^i/factorial(i);
        end
        subplot(2,2,1)
            hold on
            title('B(1,1)')
            plot3(a(i),b(j),B(1,1),'b.')
            xlabel('a')
            ylabel('b')
            zlabel('B(1,1)')
        subplot(2,2,3)
            hold on
            title('B(2,1)')
            plot3(a(i),b(j),B(2,1),'b.')
            xlabel('a')
            ylabel('b')
            zlabel('B(2,1)')
        subplot(2,2,2)
            hold on      
            title('B(1,2)')
            plot3(a(i),b(j),B(1,2),'b.')
            xlabel('a')
            ylabel('b')
            zlabel('B(1,2)')
        subplot(2,2,4)
            hold on
            title('B(2,2)')
            plot3(a(i),b(j),B(2,2),'b.')
            xlabel('a')
            ylabel('b')
            zlabel('B(2,2)')
    end
end
axis square
grid on
hold off