figure (1)
x=linspace(0,2*pi,10);
hold on
for j=1:rs
    Vs=[V(j,1),V(j,2)];
    c=[j/rs,0,1];
    plot(R(j,1),R(j,2),'Color',c,'Marker','.')
    %axis(0.25*[-N/4,N/4,-N/4,N/4,-N/8,N/4])
    hold on
end
hold off