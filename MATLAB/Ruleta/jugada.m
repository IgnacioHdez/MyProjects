if (b-2^(p))<0
        for H=1:p
            pn=p-H;
                if (b-2^(pn))<0
                    if pn==1
                        p=1;
                        break
                    end
                else
                    p=pn;
                    break        
                end
         end
        clear H
end

if b<=0
     break
end

if floor(v/2)~=v/2
        b=b-2^(p);
        p=p+1;
elseif floor(v/2)==v/2
        b=b+2^(p);
        p=1;
end