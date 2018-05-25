function M=getval(i,val)
%Gets the data form Google FInance
Dir=['Data\',Company(i),'\',val,'.txt'];
M=importdata(Dir);
end