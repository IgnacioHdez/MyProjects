function L=curvf(p,h,cartf)
if p(1)==0
    p(1)=p(1)+h;
end
if p(1)==1
    p(1)=p(1)-h;
end
if p(2)==1
    p(2)=p(2)-h;
end
if p(2)==0
    p(2)=p(2)+h;
end

n=normalf(p,h,cartf);

h=h/2;




%Cálculo de 11
p11=[p(1)+h,p(2)];
p12=p;
p13=[p(1)-h,p(2)];

a1=cartf(p11);
a2=cartf(p12);
a3=cartf(p13);
da1=(a1-2*a2+a3)/((h*h));
L(1,1)=n*da1';

%Cálculo de cruzados
p1=[p(1)+h,p(2)+h];
p2=[p(1)+h,p(2)-h];
p3=[p(1)-h,p(2)+h];
p4=[p(1)-h,p(2)-h];

a1=cartf(p1);
a2=cartf(p2);
a3=cartf(p3);
a4=cartf(p4);

da=(a1-a2-a3+a4)/(4*h*h);

L(1,2)=n*da';
L(2,1)=L(1,2);

%Cálculo de 22
p21=[p(1),p(2)+h];
p22=p;
p23=[p(1),p(2)-h];

a1=cartf(p21);
a2=cartf(p22);
a3=cartf(p23);
da2=(a1-2*a2+a3)/(h*h);
L(2,2)=n*da2';


end