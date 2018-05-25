function [tg1,tg2]=tangentf(p,h,cartf)
h=h/2;
    if p(1)==1
        tg1=( cartf([p(1),p(2)])-cartf([p(1)-h,p(2)]) )/h;
    end
    
    if p(1)==0
        tg1=( cartf([p(1)+h,p(2)])-cartf([p(1),p(2)]) )/h;  
    end
    
    if p(2)==1
        tg2=( cartf([p(1),p(2)])-cartf([p(1),p(2)-h]) )/h;
    end
    
    if p(2)==0
        tg2=( cartf([p(1),p(2)+h])-cartf([p(1),p(2)]) )/h;
    end
    
    if p(1)~=1 && p(1)~=0 
        tg1=( cartf([p(1)+h,p(2)])-cartf([p(1)-h,p(2)]) )/(2*h);
    end
    if p(2)~=1 && p(2)~=0
        tg2=( cartf([p(1),p(2)+h])-cartf([p(1),p(2)-h]) )/(2*h);
    end
    
end