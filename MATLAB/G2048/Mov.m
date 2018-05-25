function Af=Mov(M,Af)
%Efectua la suma y el movimiento
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
end