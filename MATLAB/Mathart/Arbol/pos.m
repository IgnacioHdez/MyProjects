Vs=[V(j,1),V(j,2)];
Rs=[R(j,1),R(j,2)];
alpha=5/exp(1);
p=100*rand;
prob=99-alpha*exp(norm(Vs))-0.5*norm(Rs);