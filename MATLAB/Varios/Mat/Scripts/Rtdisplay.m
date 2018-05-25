%Real time data display
disp(datestr(now))
disp(['-----Pocket value = ',num2str(Cartemp(h))])
disp(['-----Benefit = ',num2str(Cartemp(h)-Cart0)])
disp('---Loading Plots---')

if plotanalisys~=0
figure (1)

if plotanalisys==2
    subplot(2,1,1)
end
        plot(time,Cart0,'k')
        hold on
        plot(time,Cartemp-Cart0)
        hold off
        grid on 
        xlabel('Time(Hours)')
        ylabel('Benefit ($)')
        axis([min(time),max(time),min(Cartemp-Cart0)-0.1*abs(min(Cartemp-Cart0))-0.1,0.1+max(Cartemp-Cart0)+0.1*abs(max(Cartemp-Cart0))])
    
if plotanalisys==2
    subplot(2,1,2)
    
    temp=1;
       for i=1:Ncomp
          if n(i)~=0
              Q=getval(i,'quickval');
              N=Q(1);
              C=Q(3);
              sellval(i)=n(i)*(C-Corr(i));
              buyval(i)=n(i)*(buytemp(i));
              
              y(temp)=sellval(i)-buyval(i);
              name(temp)=cellstr(Company(i));
              
              %Lost money
              if buyval(i)>sellval(i)
              c(temp)='r';   
              else
              c(temp)='g'; 
              end
              temp=temp+1;
          end
       end
       
    if temp>1
        y=sort(y);
        for i=1:temp-1
            bar(temp-i,y(i),c(i))
            hold on  
        end
        grid on
        hold off
        clear i;
        clear temp
        clear x
        clear y
        clear c
        clear name
        savefig('Cart.fig')
        delete('Cart.fig')
    end
end

if plotanalisys==3
        for i=1:Ncomp
          if n(i)~=0
              Q=getval(i,'quickval');
              N=Q(1);
              C=Q(3);
              sellval(i)=n(i)*(C-Corr(i));
              buyval(i)=n(i)*(buytemp(i));
         
              %Lost money
              if buyval(i)>sellval(i)
              bar(i,sellval(i)-buyval(i),'r')
              hold on
            
              %Earn money
              else
                bar(i,sellval(i)-buyval(i),'g')
                hold on
            
              end
          end
        end
    grid on
    clear i;
    hold off
    savefig('Cart.fig')
    delete('Cart.fig')
end
end