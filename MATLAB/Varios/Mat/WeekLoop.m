clear all
clc

%Add to path the Simulation point
addpath('Scripts','Functions')

%Weekloop
while true
    
    %If the day is between monday and friday
    if weekday(now)>1 && weekday(now)<7
        
        %If it is MarketOpen time
        if gethour()>15 && gethour()<= 22
            
            %Starts simulation
            try
               run Simulation
            catch
               disp('Error while market operating. Rebooting Program')
               run Simulation
            end
            %Creates the figure for the safebox
            figure(2)
            %Money per day
            Actualmoney=importdata('Safebox.txt');
            plot(0:1:(max(size(Actualmoney))-1),Actualmoney)
            title('Daily money') 
            xlabel('Day')
            ylabel('Money')
            
            %Waits for one day to the next opening
            disp(['Waiting 1 day and ',num2str((15+0.1)-gethour()),' hours'])
            pause(((24+15+0.1)-gethour())*3600)
        
        elseif gethour()<15 
        %If it is MarketClose time
            disp(['Waiting ',num2str((15+0.1)-gethour()),' hours'])
            pause((15+0.1-gethour())*3600)
        else
            disp(['Waiting 1 day and ',num2str((15+0.1)-gethour()),' hours'])
            pause(((24+15+0.1)-gethour())*3600)
        end
    
    %If it is Sunday
    elseif weekday(now)==1
        disp(['Waiting 1 day and ',num2str((15)-gethour()),' hours'])
        pause(((24+15)-gethour())*3600)
        
    %If it is Saturday
    elseif weekday(now)==7
        disp(['Waiting 2 days and ',num2str((15)-gethour()),' hours'])
        pause(48*3600)
    end
end