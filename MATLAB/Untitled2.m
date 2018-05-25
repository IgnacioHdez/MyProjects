clear all

d='h';

%Hexagonal----------------------------------------------
if d=='h';
    %Define variable for unit cell lenght a
    syms a real;
    syms c real;
    
    
    %Define vectors
    syms a1;
    syms a2;
    syms a3;
    syms b1;
    syms b2;
    syms b3;
    
    
    %Define real space base
    
    a1=3*a/2*[1,1/sqrt(3),0];
    a2=3*a/2*[1,-1/sqrt(3),0];
    a3=c*[0,0,1];
    
    r=[1,0,0;
        0,1,0;
        1/3,1/3,0];
    
    nl=2;
    ml=2;
    kl=0;
end

%BCC--------------------------------------------------
if d=='b';
    %Define variable for unit cell lenght a
    syms a real;
    
    
    %Define vectors
    syms a1;
    syms a2;
    syms a3;
    syms b1;
    syms b2;
    syms b3;
    
    
    %Define real space base
    
    a1=a/2*[1,-1,-1];
    a2=a/2*[1,1,1];
    a3=a/2*[-1,-1,1];
    
    r=[0,0,0;
       1/2,1/2,1/2];
    
    nl=2;
    ml=2;
    kl=2;
end

%FCC--------------------------------------------------
if d=='f';
    %Define variable for unit cell lenght a
    syms a real;
    
    
    %Define vectors
    syms a1;
    syms a2;
    syms a3;
    syms b1;
    syms b2;
    syms b3;
    
    
    %Define real space base
    
    a1=a/2*[-1,1,0];
    a2=a/2*[0,1,1];
    a3=a/2*[-1,0,1];
    
    r=[0,0,0;
       1/2,1/2,1/2];
    
    nl=2;
    ml=2;
    kl=2;
end

%Calculate volume of unit real cell----------------------
w=dot(a1,cross(a2,a3));

pretty(w)

%Calculate reciprocal space base
b1=2*pi/w*cross(a2,a3);
b2=2*pi/w*cross(a3,a1);
b3=2*pi/w*cross(a1,a2 );



pretty(b1)
pretty(b2)
pretty(b3)

ad1=double(subs(a1,1));
ad2=double(subs(a2,1));
ad3=double(subs(a3,1));

bd1=double(subs(b1,2*pi));
bd2=double(subs(b2,2*pi));
bd3=double(subs(b3,2*pi));
%Transformation matrix Real
A=[ad1;
    ad2;
    ad3;];
%Transformation matrix
B=[bd1;
    bd2;
    bd3;];

for n=-nl:nl
    for m=-ml:ml
        for k=-kl:kl
            %Transformation matrix
            A=[ad1;
                ad2;
                ad3;];
            %Vector of atoms
            r2(:,1)=r(:,1)+n;
            r2(:,2)=r(:,2)+m;
            r2(:,3)=r(:,3)+k;
            R=(r2)*A;
            
            %TF de r
            %Transformation matrix
            B=[bd1;
                bd2;
                bd3;];
            G=r2*B;
            
            figure (1)
            plot3(R(1,1),R(1,2),R(1,3),'b.','MarkerSize',10)
            plot3(R(2,1),R(2,2),R(2,3),'r.','MarkerSize',10)
            hold on
%             figure (2)
%             plot3(G(:,1),G(:,2),G(:,3),'r.')
%             hold on
            
        end
    end
end
figure(1)
plot3(0,0,0,'ok')
grid
xlabel('n')
ylabel('m')
axis('square')

x(1,:)=[0,0,0];

x(2,:)=[1,0,0];
x(3,:)=[1,0,1];
x(4,:)=[1,0,0];


x(5,:)=[1,1,0];
x(6,:)=[1,1,1];
x(7,:)=[1,1,0];

x(8,:)=[0,1,0];
x(9,:)=[0,1,1];
x(10,:)=[0,1,0];

x(11,:)=[0,0,0];
x(12,:)=[0,0,1];
x(13,:)=[1,0,1];
x(14,:)=[1,1,1];
x(15,:)=[0,1,1];
x(16,:)=[0,0,1];

plot3(x(:,1),x(:,2),x(:,3),'k-')


hold off