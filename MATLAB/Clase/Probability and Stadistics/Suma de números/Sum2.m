n=input('número de repeticiones = ');
w=input('Divisiones del intervalo = ');
numbin=fix(2/w)+1;
outcome=zeros(numbin,1);
x=0:w:2;
for i=1:n
    d1=rand;
    d2=rand;
    s=d1+d2;
    is=fix(s/w)+1;
    outcome(is,1)=outcome(is,1)+1;
end
outcome=outcome./(n*w);
plot(x,outcome,'-')
xlabel('sum')
ylabel('probability density')
title('Two random numbers')