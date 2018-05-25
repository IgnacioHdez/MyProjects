function [col]=bar1(A1,A2,B1,B2,alpha)

if B1(1,1)<=A1(1,1)
    if B1(1,1)>=0-0.5*cos(alpha)
        if B2(1,1)<=0.5+0.5*cos(alpha)
            if B2(1,1)>=0
                col1=1;
            else
                col1=-1;
            end
        else
            col1=-1;
        end
    else
        col1=-1;
    end
else
    col1=-1;
end

if B1(1,1)<=0
    if B1(1,1)>=A2(1,1)-0.5*cos(alpha)
        if B2(1,1)<=0+0.5*cos(alpha)
            if B2(1,1)>=-0.5-0.5*cos(alpha)
                col2=1;
            else
                col2=-1;
            end
        else
            col2=-1;
        end
    else
        col2=-1;
    end
else
    col2=-1;
end
col=-1;
if col2==1
    col=1;
end
if col1==1
    col=1;
end
end