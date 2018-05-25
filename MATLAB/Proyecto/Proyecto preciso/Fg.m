function Fg=Fg(ma,mb,ra,rb)
G=6.67384*10^(-11);
rab=ra-rb;
Fg=-G*ma*mb*(rab/(norm(rab)^3));
end