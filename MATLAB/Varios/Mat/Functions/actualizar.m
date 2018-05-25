function actualizar(Ncomp,day)
%Gets the data form Google FInance
 for j=1:Ncomp
    Dir=['Data\',Company(j)];
    if exist(['Data\',Company(j),'\save.txt'])==0
        if exist(Dir)==0
            mkdir(Dir)
        end
        dlmwrite([Dir,'\save.txt'],0,'delimiter','')
    end
    
    try
        %Set the url point
        Ref1='http://www.google.com/finance/getprices?i=60&p=';
        Ref2='d&f=o,c,h,l,v&df=cpct&q=';
        %Gets the data
        data=urlread([Ref1,num2str(day),Ref2,Company(j)]);
        N=max(size(data));
        if N~=importdata(['Data\',Company(j),'\save.txt'])
         %Transforms the data to a double matrix
         n=0;
         for i=1:N-3
            if  [data(i),data(i+1),data(i+2),data(i+3)]=='-240'
                n=i;
                break
            end
         end
        
         if n==0
            disp('ERROR: Not cappable to read data; Data not up-to-date')
         else
        state=1;o=0;c=1;h=0;l=0;v=0;
        %Makes the distribution of the values
        for i=n+5:N
                %State jump
                if data(i)==','
                    state=state+1;
                end
                if data(i)==sprintf('\n')
                    state=1;
                    data(i)=',';
                end
                %Open
                if state==4
                    if o~=0
                    open(o)=data(i);
                    end
                    o=o+1;
                %Close
                elseif state==1

                        close(c)=data(i);

                    c=c+1;
                %High
                elseif state==2
                    if h~=0
                        high(h)=data(i);
                    end
                    h=h+1;
                %Low
                elseif state==3
                    if l~=0
                        low(l)=data(i);
                    end
                    l=l+1;
                %Volume
                elseif state==5
                    if v~=0
                        volume(v)=data(i);
                    end
                    v=v+1;
                end
        end
        %Saves data in the txt documents
        
        
        if exist(Dir)==0
        mkdir(Dir)
        end
       
        dlmwrite([Dir,'\open.txt'],open,'delimiter','')
        dlmwrite([Dir,'\close.txt'],close,'delimiter','')
        dlmwrite([Dir,'\high.txt'],high,'delimiter','')
        dlmwrite([Dir,'\low.txt'],low,'delimiter','')
        dlmwrite([Dir,'\volume.txt'],volume,'delimiter','')
        dlmwrite([Dir,'\save.txt'],N,'delimiter','')
        clear open
        clear close
        clear high
        clear low
        clear volume
        
        %Creates quick acces data data
        O=importdata([Dir,'\open.txt']);
        C=importdata([Dir,'\close.txt']);
        r=(C-O)./O;
        m=mean(r);
        s=std(r);
        Nopen=max(size(O));
        quick=[Nopen,O(Nopen),C(Nopen),m,s];
        dlmwrite([Dir,'\rval.txt'],r,'delimiter',',')
        dlmwrite([Dir,'\quickval.txt'],quick,'delimiter',',')
        
         end
        end
     catch
        disp('ERROR: Connection Lost; Data not up-to-date')
     end
 end  
end