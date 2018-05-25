%Load data
clear all
close all

disp('Loading data for Lhist')
load('../Data/result.mat')

disp('Creating figure Lhist.fig')
%Create figure
fig1=figure('Color',[1,1,1]);
subplot(2,1,1)

title('Distribution of near stars and their luminosity')
Laux=L;
Laux2=L;
for i=1:N
    if i==23 || i==26 || i==57 || i==61 || i==73 
        Laux(i)=nan;
    else
        Laux2(i)=nan;
    end
end
hist(L,100)
ylabel('Number of stars')
xlabel('Luminosity over Solar Luminosity')
grid on

subplot (2,1,2)

hist(Laux,50)
ylabel('Number of stars')
xlabel('Luminosity over Solar Luminosity')
grid on

disp('Saving Lhist figure')
savefig('../Figures/Lhist.fig')
