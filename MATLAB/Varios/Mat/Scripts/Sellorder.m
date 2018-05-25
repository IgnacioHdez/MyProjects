%Changes the last buy price
buytemp(j)=nan;
%Changes the money you have rest
Cart(h)=Cart(h)+n(j)*(C-Corr(j));
%Sets a time to wait until buy again
restime(j)=rt;
%Sets the number of stocks to 0
n(j)=0;
%Display the sell order
disp([datestr(now),' Sell: ',Company(j)])
%Saves the price of the Sell
sell(j)=C-Corr(j);
%Sets the last buy price to 0
buy(j)=0;
%Saves the counter
ncomp=ncomp-1;