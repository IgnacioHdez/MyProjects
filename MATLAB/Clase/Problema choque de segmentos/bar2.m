function [col]=bar2(B1,B2,A1,A2,alpha)
col=-1;
    if B1(1,2)<=0
        if B2(1,2)>=0
            if B1(1,1)<0.5
                col=1;
            end
        end
    end
end