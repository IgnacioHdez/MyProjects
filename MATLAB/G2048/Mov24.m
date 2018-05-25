function Af=Mov24(M,Af)
%Efectua la suma, el movimiento y la aparicion de 2 y 4
a=0;
if Mov(M,Af)==Af
    a=1;
end
if M==1
    for i=2:1:4
    for j=4:-1:1
        if Af(i,j)~= 0
            if Af(i-1,j)==0
                Af(i-1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for i=2:1:4
    for j=4:-1:1
     if Af(i,j)==Af(i-1,j)
         Af(i,j)=0;
         Af(i-1,j)=2*Af(i-1,j);
     end
    end
    end
    for i=2:1:4
    for j=4:-1:1
        if Af(i,j)~= 0
            if Af(i-1,j)==0
                Af(i-1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for i=2:1:4
    for j=4:-1:1
        if Af(i,j)~= 0
            if Af(i-1,j)==0
                Af(i-1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for i=2:1:4
    for j=4:-1:1
     if Af(i,j)==Af(i-1,j)
         Af(i,j)=0;
         Af(i-1,j)=2*Af(i-1,j);
     end
    end
    end
    for i=2:1:4
    for j=4:-1:1
        if Af(i,j)~= 0
            if Af(i-1,j)==0
                Af(i-1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
end
if M==2
    for j=2:1:4
    for i=4:-1:1
        if Af(i,j)~= 0
            if Af(i,j-1)==0
                Af(i,j-1)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for j=2:1:4
    for i=4:-1:1
      if Af(i,j)==Af(i,j-1)
          Af(i,j)=0;
          Af(i,j-1)=2*Af(i,j-1);
      end
    end
    end
    for j=2:1:4
    for i=4:-1:1
        if Af(i,j)~= 0
            if Af(i,j-1)==0
                Af(i,j-1)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for j=2:1:4
    for i=4:-1:1
        if Af(i,j)~= 0
            if Af(i,j-1)==0
                Af(i,j-1)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
    for j=2:1:4
    for i=4:-1:1
      if Af(i,j)==Af(i,j-1)
          Af(i,j)=0;
          Af(i,j-1)=2*Af(i,j-1);
      end
    end
    end
    for j=2:1:4
    for i=4:-1:1
        if Af(i,j)~= 0
            if Af(i,j-1)==0
                Af(i,j-1)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end
end
if M==3
    for i=3:-1:1
    for j=1:4
        if Af(i,j)~= 0
            if Af(i+1,j)==0
                Af(i+1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end 
    for i=3:-1:1
    for j=1:4
     if Af(i,j)==Af(i+1,j)
         Af(i,j)=0;
         Af(i+1,j)=2*Af(i+1,j);
     end
    end
    end
    for i=3:-1:1
    for j=1:4
        if Af(i,j)~= 0
            if Af(i+1,j)==0
                Af(i+1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end 
    for i=3:-1:1
    for j=1:4
        if Af(i,j)~= 0
            if Af(i+1,j)==0
                Af(i+1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end 
    for i=3:-1:1
    for j=1:4
     if Af(i,j)==Af(i+1,j)
         Af(i,j)=0;
         Af(i+1,j)=2*Af(i+1,j);
     end
    end
    end
    for i=3:-1:1
    for j=1:4
        if Af(i,j)~= 0
            if Af(i+1,j)==0
                Af(i+1,j)=Af(i,j);
                Af(i,j)=0;
            end
         end
    end
    end 

end
if M==4
    for j=3:-1:1
    for i=1:4
        if Af(i,j)~= 0
            if Af(i,j+1)==0
                Af(i,j+1)=Af(i,j);
                Af(i,j)=0;
            end
        end
    end
    end
    for j=3:-1:1
    for i=1:4
      if Af(i,j)==Af(i,j+1)
          Af(i,j)=0;
          Af(i,j+1)=2*Af(i,j+1);
      end
    end
    end
    for j=3:-1:1
    for i=1:4
        if Af(i,j)~= 0
            if Af(i,j+1)==0
                Af(i,j+1)=Af(i,j);
                Af(i,j)=0;
            end
        end
    end
    end
    for j=3:-1:1
    for i=1:4
        if Af(i,j)~= 0
            if Af(i,j+1)==0
                Af(i,j+1)=Af(i,j);
                Af(i,j)=0;
            end
        end
    end
    end
    for j=3:-1:1
    for i=1:4
      if Af(i,j)==Af(i,j+1)
          Af(i,j)=0;
          Af(i,j+1)=2*Af(i,j+1);
      end
    end
    end
    for j=3:-1:1
    for i=1:4
        if Af(i,j)~= 0
            if Af(i,j+1)==0
                Af(i,j+1)=Af(i,j);
                Af(i,j)=0;
            end
        end
    end
    end
end
if a==0
n1=0;
for ii=1:4
    for jj=1:4
        if Af(ii,jj)==0
            n1=n1+1;
        end
    end
end
i=randi(4);
j=randi(4);
if n1>=1
    while Af(i,j)~=0
        i=randi(4);
        j=randi(4); 
    end
pos4=rand;
if pos4>=0.8
Af(i,j)=4;
else
Af(i,j)=2;
end
end
end
end