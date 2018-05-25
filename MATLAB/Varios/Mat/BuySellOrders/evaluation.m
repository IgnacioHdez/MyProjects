for i=1:Ncomp
    %Gets the data from google finance
    quick=getval(i,'quickval');
    %Start the calculations
    score(i)=quick(4);
end
%Calculates the top companies
topcomp=top(score);
