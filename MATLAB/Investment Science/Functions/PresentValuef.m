function PV=PresentValuef(v,r)
%Calculates the Present Value of a cash flow(v) distribuited equaly in time
%using an ideal bank of rate of return r

    %We start the counting at 0
    PV=0;
    
    %Every period is added to PV
    for i=1:max(size(v))
    PV=PV+v(i)/((1+r)^(i-1));
    end
end