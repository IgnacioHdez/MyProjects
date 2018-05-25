%Creates a point to save data
today=clock;

savedir=['Save\',num2str(today(1)*10000+today(2)*100+today(3)),'.mat'];

    %Load data if exists
if exist(savedir,'file')~=0
    load(savedir)    
else
    if exist('Save\Safebox.txt','file')~=0
      temp=importdata('Save\Safebox.txt');
      Cart0=temp(max(size(temp)));
      clear temp
    else
    %Money to start
      Cart0=5000;
    end
    Cart(1)=Cart0;
    Cartemp(1)=Cart0;
    Cartemp(2)=0;
    Cart(2)=Cart(1);
    time(1)=gethour();
    %Risk you can afford
    risk=0.075;

    %Number of companies to evaluate
    Ncomp=50;
    
    %Maximum companies to buy
    nmax=10;
    
    %Number of wtih stocks
    ncomp=0;

    %Saves the price of the stocks when they were bought
    buytemp=linspace(nan,nan,Ncomp); 

    %Saves the number of stocks you have
    n=linspace(0,0,Ncomp);

    %Rest time to reload the program 45 sec
    waittime=30;

    %Tipical restime after buy or sell 5 min
    rt=5*60;

    %Saves the time to wait a decision 25 min after opening
    restime=linspace(0,0,Ncomp);

    %Keeps the time of the last buy
    lastbuytime=linspace(nan,nan,Ncomp);

    %Keeps the value of the last buy
    buy=linspace(0,0,Ncomp);

    %Keeps the value of the last sell
    sell=linspace(0,0,Ncomp);
    
    %0: No plot; 1:Benefit plot; 2:Benefit and company plot; 3:Company plot
    plotanalisys=2;
    
    %Saves the number of loops
    h=2;
end