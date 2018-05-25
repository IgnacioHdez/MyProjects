function FV=FutureValuef(v,r)
%Calculates the Future Value of a cash flow(v) distribuited equaly in time
%using an ideal bank of rate of return r

%Firstly we calculate the Present Value
PV=PresentValuef(v,r);

%Then we transform it
FV=PV*(1+r)^(max(size(v))-1);
end