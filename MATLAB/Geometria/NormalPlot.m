clear all
hold off
addpath('Cartas','Functions','Curvas')

h=1e-5;

nplot=1;
tgplot=1;
curvplot=1;
gammaplot=1;


tmin=h;
tmax=1-h;

imin=h;
imax=1-h;

jmin=h;
jmax=1-h;

Ni=10;
Nj=10;
Nt=10;

Pi=floor(Ni/100);
Pj=floor(Ni/1);

%cartf=@planecartf;
%cartf=@immersioncartf;
%cartf=@moebiouscartf;
%cartf=@gaussiancartf;
cartf=@toruscartf;
%cartf=@testcartf;
%cartf=@chaircartf;
%cartf=@spherecartf;



hi=1;
hj=1;
ht=1;
v0=cartf([(imax-imin)/2,(jmax-jmin)/2]);
plot3(v0(1),v0(2),v0(3))
for i=linspace(imin,imax,Ni)
    for j=linspace(jmin,jmax,Nj)
        
        p=[i,j];
                
        v=cartf([p(1),p(2)]);

        
        X(hi,hj)=v(1);
        Y(hi,hj)=v(2);
        Z(hi,hj)=v(3);


        if nplot==1 && hi/Pi==floor(hi/pi) && hj/Pj==floor(hj/pj)
        n=normalf(p,h,cartf)/4;
        quiver3(v(1),v(2),v(3),n(1),n(2),n(3),'r')
        hold on
        end
        
        if tgplot==1 && hi/Pi==floor(hi/pi) && hj/Pj==floor(hj/pj)
        [tg1,tg2]=tangentf(p,h,cartf);    
        tg1n=tg1/norm(tg1)/4;
        tg2n=tg2/norm(tg2)/4;
        
        quiver3(v(1),v(2),v(3),tg1n(1),tg1n(2),tg1n(3),'b')
        hold on
        quiver3(v(1),v(2),v(3),tg2n(1),tg2n(2),tg2n(3),'g')
        end
        
        if curvplot==1
        Xg(hi,hj)=p(1);
        Yg(hi,hj)=p(2);
        g=metricf(p,h,cartf);
        L=curvf(p,h,cartf);
        Kg(hi,hj)=det(L)/det(g);
        end
        
        
        hj=hj+1;
    end
    hi=hi+1;
    hj=1;
end

figure(1)

if gammaplot==1
    for t=linspace(tmin,tmax,Nt)
        w=gammaf(t,cartf);
        x(ht)=w(1);
        y(ht)=w(2);
        z(ht)=w(3);
        ht=ht+1;
    end
end


hold on
surf(X,Y,Z,Kg,'FaceAlpha',0.7,'EdgeColor','none')
xlabel('x')
ylabel('y')
zlabel('z')
colorbar

if gammaplot==1
plot3(x,y,z,'-k','LineWidth',2)
end

hold off
axis equal
grid
