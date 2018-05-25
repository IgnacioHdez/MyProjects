function dire=automov(A,t,ln)
if t/2==fix(t/2)
    dire=3;
else
    dire=4;
end
if Mov(3,A)==A 
    if Mov(4,A)==A
    dire=finmov(A,ln);
    end
end