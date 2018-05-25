classdef Company
    %Sets a company as an object with functions an data collection
    %implemented
    
    properties
        %Symbol of the company
        Name
        
        %Vector of dates where D(1)==FnDate and D(N)==StDate
        Date
        StDate
        FnDate
        
        %Vectors of data
        Open
        Close
        High
        Low
        Volume
    end
    
    methods
        
        %Creator-----------------------------------------------------------
        function C=Company(name,DateLenght,stDate)
            %name: Symbol of the company
            %DateLenght: Number of days to count
            %stDate: Last day of the count
            
            %Sets FnDate
            if ~exist('stDate','var')
                C.FnDate=today;
            else
                C.FnDate=today-stDate;
            end
            
            %Sets StDate
            if ~exist('DateLenght','var')
                C.StDate=0;
            else
                C.StDate=C.FnDate-DateLenght;
            end
            
            %Sets Name
            C.Name=name;
            
            %Updates Data
            C.Update;
            
            %Creates file direction
            d=['Data/',C.Name,'/Data.dat'];
            
            %Picks data in the selected range
            Dat=dlmread(d);
            h=1;
            for i=1:max(size(Dat))
                if Dat(i,1)<=C.FnDate && ...
                   Dat(i,1)>=C.StDate
                    C.Date(h)=Dat(i,1);
                    C.Open(h)=Dat(i,2);
                    C.High(h)=Dat(i,3);
                    C.Low(h)=Dat(i,4);
                    C.Close(h)=Dat(i,5);
                    C.Volume(h)=Dat(i,6);
                    h=h+1;
                end
            end
        end
        
        %Updates the data if there is any change---------------------------
        function Update(C)
            %Creates file direction
            d=['Data/',C.Name,'/Data.dat'];
            %Checks if exists any data file
            
            if weekday(today)==2
                ret=3;
            else
                ret=1;
            end
            c=clock;
            if exist(d,'file')==0
                %Needs to be created from 0
                Dat=fetch(yahoo,C.Name,today,0,'d');
                disp(['Creating data for: ',C.Name])
                mkdir(['Data/',C.Name])
                dlmwrite(d,Dat,'precision',20)
                disp('Done')
            elseif dlmread(d,',',[0,0,0,0])~=today-ret && c(4)>12
                %Needs Update
                disp(['Updating data for: ',C.Name])
                Dat=fetch(yahoo,C.Name,today,dlmread(d,',',[0,0,0,0])+1,'d');
                M=dlmread(d);
                m=size(M);
                D=size(Dat);
                for i=1:D(1)+m(1)
                    if i<=D(1)
                        Mres(i,:)=Dat(i,:);
                    else
                        Mres(i,:)=M(i-D(1),:);
                    end
                end
                dlmwrite(d,Mres,'precision',20)
                disp('Done')
            else
                %Data is Up-to-date
            end
            
        end
        
        %Creates a quick plot----------------------------------------------
        function QPlot(C)
            %Set vector of days from today
            x=-C.Date+today;
            %Saves the size of the vector
            n=max(size(x));
            
            subplot(2,1,1)
                plot(x,C.Close,'-r')
                hold on
                plot(x,C.Open,'-g')
                plot(x,C.High,'-k')
                plot(x,C.Low,'-k')
                plot(x,(C.High+C.Low)/2,'.b','MarkerSize',10)
                plot(x,(C.High+C.Low)/2,'-b','MarkerSize',10)
                plot(x,(C.Open)./C.Open*mean((C.High+C.Low)/2),'-m')
                hold off
                set(gca,'Xdir','reverse')
            
                text(x(1),C.Close(1),datestr(C.Date(1)),'Rotation',90)
                text(x(n),C.Close(n),datestr(C.Date(n)),'Rotation',90)
            
                xlabel('Days from today')
                ylabel('Value')
                legend('Close','Open', 'High', 'Low')
                title(C.Name)
                grid on
            
            subplot(2,1,2)
                plot(x,C.Volume)
                xlabel('Days from today')
                ylabel('Volume')
                set(gca,'Xdir','reverse')
                grid on
        end
        
        %Returns an equivalent company with normalized data. Ex: C.nor.Open
        function C2=nor(C)
            %Copies the value of C
            C2=C;
            %Normalizes the data
            C2.Open=C2.Open/norm(C2.Open);
            C2.Close=C2.Close/norm(C2.Close);
            C2.High=C2.High/norm(C2.High);
            C2.Low=C2.Low/norm(C2.Low);
            C2.Volume=C2.Volume/norm(C2.Volume);
        end
        
        
    end
    
end
