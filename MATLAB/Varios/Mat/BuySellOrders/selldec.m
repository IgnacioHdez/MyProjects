function dec=selldec(comp,buytemp)
C=getval(comp,'close');
O=getval(comp,'open');
oc=(C+O)/2;
v=C-O;
N=max(size(oc));
dec=0;
%No double sell
    if N<25
        return
    else
        stv=std(v);
        mv=mean(v);
        moc=mean(oc);
        localmoc=mean(loc(oc,10));
        %Three Modes:
            
        if localmoc>moc+mv+stv
            %Ascending mode
             if oc(N)<=min(loc(oc,10))-stv
                 dec=1;
             end
             if oc(N)-std(loc(v,3))<moc-mv-stv
                 dec=1;
             end
             if oc(N-1)-oc(N)<-abs(mv)-2*abs(stv)
                 dec=1;
             end
               
        elseif localmoc<moc-mv-stv
            %Descending mode
                 if mean(loc(oc,10))>mean(loc(oc,20))
                    dec=1;
                 end
                 if mean(loc(oc,5))>moc-mv-stv
                     dec=1;
                 end
                 if mean(loc(oc,5))<oc(N) && oc(N)>oc(N-1)
                      dec=1;
                 end
        else
            %Instable Mode

        end
    
         if buytemp-oc(N)>0.01*buytemp
             dec=1;
         end
         

    end
end