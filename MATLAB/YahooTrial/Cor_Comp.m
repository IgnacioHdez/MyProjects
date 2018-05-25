function C=Cor_Comp(n1,n2)

%Open Yahoo! server
c=yahoo;

%Set the starting and ending point of data collecting
s0=today-365;
sf=today;

%Set the targets companies
T1=Company(n1);
T2=Company(n2);

%Loads data
OC1=fetch(c,T1,{'open','close'},s0,sf,'d');
OC2=fetch(c,T2,{'open','close'},s0,sf,'d');

n=max(size(OC2));

for i=1:n-1
NOC1(i,:)=OC1(i,:);
NOC2(i,:)=OC2(i+1,:);
end

OC1=NOC1;
OC2=NOC2;

close(c)

Div1=(OC1(:,3)-OC1(:,2))/max(OC1(:,3)-OC1(:,2));
Div2=(OC2(:,3)-OC2(:,2))/max(OC2(:,3)-OC2(:,2));

C2=cov(Div1,Div2);

C=C2(1,2);
end