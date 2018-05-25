       
time(h)=gethour();
    
for j=1:Ncomp
    if n(j)~=0
     Q=getval(j,'quickval');
     N=Q(1);
     C=Q(3);
     Cart(h)=Cart(h)+n(j)*(C-Corr(j)); 
     n(j)=0;
     disp([datestr(now),' Sell: ',Company(j)])
     sell(j)=C-Corr(j);
     buy(j)=0;
    end
end

Cartemp(h)=Cartemp(h-1);
disp(datestr(now))
disp(['Valor de Cartera = ',num2str(Cartemp(h))])
disp(['G/P = ',num2str(Cartemp(h)-Cart0)])
disp('Operation Closed')
operationstate='Closed';
clear waittime
clear ans
clear j
clear C
clear N
save(savedir)
if exist('Save\Safebox.txt','file')~=0 
      temp=importdata('Save\Safebox.txt');
      temp(max(size(temp))+1,1)=Cart(h);
      dlmwrite('Save\Safebox.txt',temp);
      clear temp
else
      dlmwrite('Save\Safebox.txt',Cart(h));
end
if plotanalisys~=0
    savefig(['Save\',num2str(today(1)*10000+today(2)*100+today(3)),'.fig'])
end
clear all
%disp('--- 60 seconds to hibernate ---')
%pause(60)
%system('rundll32.exe PowrProf.dll,SetSuspendState')
return
