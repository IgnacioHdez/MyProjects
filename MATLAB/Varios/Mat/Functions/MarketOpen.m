function state=MarketOpen()
state=0;
c=clock;

  if c(4)>=15 && c(4)<22
    state=1;
    if c(4)==15 && c(5)<40
          state=0;
    end
    if c(4)==21 && c(5)>55
          state=0;
    end
  end
  
end