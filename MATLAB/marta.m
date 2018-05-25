clear all
close all
clc
b1=[-sqrt(3),-1];
b2=[sqrt(3),-1];

for h=-4:4
for k=-4:4
%plot(h*b1(1),h*b1(2),'b.')
hold on
%plot(k*b2(1),k*b2(2),'b.')
plot(h*b1(1)+k*b2(1),h*b1(2)+k*b2(2),'b.')
end
end

grid on
hold off