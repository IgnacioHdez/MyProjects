%Calculate number of stocks to buy
n(j)=floor(Cart(h)*risk/(C+Corr(j)));
%Sets a time to wait until sell
restime(j)=rt;
%Displays the buy order
disp([datestr(now),' Buy ',Company(j),'; Stocks: ',num2str(n(j))])
%Saves the price of the stocks bought
buy(j)=C+Corr(j);
buytemp(j)=C+Corr(j);
%Changes the money you have
Cart(h)=Cart(h)-n(j)*(C+Corr(j));
%Saves the buy moment
lastbuytime(j)=N/60;
%Saves the counter
ncomp=ncomp+1;