clear all
tic
addpath('Functions','Data','Save','Scripts','BuySellOrders')

run Beginpoint
%-------------------------Day Loop----------------------------------------
while true
 %--------------------Market Open Operattions------------------------
 if 1%MarketOpen() 
   disp('---Downloading stock data---')
   actualizar(Ncomp,1);
   disp('---Evaluating Data---')
   run evaluation
   disp('---Buy/Sell Loop---')
   %--------------------Buy/Sell orders---------------------------
        for j=topcomp
            Q=getval(j,'quickval');
            N=Q(1);
            C=Q(3);
            %--------------Buy orders-------------
            if  restime(j)<0 && floor(Cart(h)*risk/(C+Corr(j)))>0 && n(j)==0 %&& ncomp<nmax
                if buydec(j)
                    run Buyorder                    
                end
            end    
            %-------------Sell orders-------------            
            if restime(j)<0 && n(j)>0
                if selldec(j,buytemp(j))                    
                    run Sellorder
                end
            end               
            %Actual Cart value        
        Cartemp(h)=Cartemp(h)+n(j)*(C-Corr(j));   
        clear N;
        clear C;
        clear j;
        end
   
   clear topcomp
   %----------------Ending period operations----------------------
   time(h)=gethour();
   restime=restime-(waittime+toc);
   Cartemp(h)=Cartemp(h)+Cart(h);
   run Rtdisplay
   %Prepare data for new period
   h=h+1;
   Cartemp(h)=0;
   Cart(h)=Cart(h-1);
   %Saves data
   disp('---Saving Data---')
   save(savedir)
   disp('---Ending period---')
   disp('----------------------------------------------------')
   %Elapses 45 seconds since last Elapse point
   if toc<waittime
     pause(waittime-toc)
   end
   tic
 else
 %-------------------Closed market operations-----------------------
   if h>2
    run Closeoperation
    break
   else 
    disp(datestr(now))
    disp('Mercado cerrado')
    pause(3*60)
    clc
   end
 end
end
   