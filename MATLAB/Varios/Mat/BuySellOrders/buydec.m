function dec=buydec(comp)
C=getval(comp,'close');
O=getval(comp,'open');
oc=C+Corr(comp);
v=C-O;
N=max(size(oc));
dec=0;

    if N<15
        return
    else
        %Std desviation of the variance, mean of 
        stv=std(v);
        mv=mean(v);
        moc=mean(oc);
        localmoc=mean(loc(oc,10));
        %Three Modes:
        if localmoc>moc+mv+stv
           %-----------Ascending mode--------------
            if mean(loc(oc,5))>mean(loc(oc,10))
                dec=1;
            end
            
        elseif localmoc<moc-mv-stv
           %-----------Descending mode-------------
            %if oc(N-1)==min(oc) && oc(N)>oc(N-1) && mean(loc(oc,3))<localmoc
            %    dec=1;
            %end

        else
            %----------Instable Mode---------------
            if mean(loc(oc,5))>moc-mv-stv || mean(loc(oc,10))<moc-mv-stv
                dec=1;
            end
        end
      
    end
end