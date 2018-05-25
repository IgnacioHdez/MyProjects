function plots(Ncomp, buytemp, lastbuytime, sell)
 
 for i=2:Ncomp
   if isnan(buytemp(i)) == 0
    [C,O]=getstockval(Company(i)); 
    co=(C+O)/2;
    figure 
    x=(1:max(size(C)))/60;
    plot(x,co)
    
    hold on
    plot(lastbuytime(i),buytemp(i),'og')
    
     if sell(i)~=0
      plot(x(max(size(x))),sell(i),'or')
     end
    hold off
    
    xlabel('Time(Hours)')
    ylabel('Stock Value')
    title(Company(i))
    legend([Company(i),' Stock Value'],'Buy','Sell')
    grid on
   else
    close (figure(i))
   end
 end
 
end