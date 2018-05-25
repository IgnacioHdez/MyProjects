classdef ANN
   properties
       %Number of inputs
       ni
       
       %Number of outputs
       no
       
       %Number of middle neurons
       nm
       
   end
   
   methods       
       %Creator------------------------------------------------------------
       function A=ANN(ni,nm,no)
           A.ni=ni;
           A.nm=nm;
           A.no=no;
           
           
       end
       
       %Add intro-----------------------------------------------
       function m=InputAdd(n,p)
           m=n;
           %Gets the size of intro
           d=max(size(n.intro));
            
           %Adds the info
           if d==1
               if isnan(n.intro)
               m.intro=p;
               else
               m.intro(2)=p;
               end
           else
               m.intro(d+1)=p;
           end
       end
       
       %Operates the outputs-----------------------------------------------
       function m=Operate(n)
           m=n;
           s=0;
           %Counts the total input sum
           for i=1:max(size(n.intro))
               s=s+n.intro(i);
           end
           
           %Clears the input
           m.intro=nan;
           
           %Aplies the transfer function
           m.output=n.trans(s);
           
       end
   end
end