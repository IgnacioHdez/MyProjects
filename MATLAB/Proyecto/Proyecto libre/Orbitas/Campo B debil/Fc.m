function Fc=Fc(qa,qb,ra,rb)
k=8.9875517873681764*10^9;
rab=rb-ra;
Fc=-qa*qb*k*(rab/(norm(rab)^3));
end