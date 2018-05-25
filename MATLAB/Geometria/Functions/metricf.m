function G=metricf(p,h,cartf)
[tg1,tg2]=tangentf(p,h,cartf);
G(1,1)=tg1*tg1';
G(2,1)=tg2*tg1';
G(1,2)=tg1*tg2';
G(2,2)=tg2*tg2';
end