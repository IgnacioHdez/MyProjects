%Load data
clear all
close all

disp('Loading data for HRDiagram')
load('../Data/result.mat')

disp('Creating figure HRDiagram.fig')
%Create Figure
fig2=figure('Color',[0,0,0]);

%Set axes
axes1 = axes('Parent',fig2,'YMinorGrid','on','XMinorGrid','on',...
    'Color',[0 0 0],...
    'ZColor',[0.972549021244049 0.972549021244049 0.972549021244049],...
    'YMinorTick','on',...
    'YColor',[0.972549021244049 0.972549021244049 0.972549021244049],...
    'XMinorTick','on',...
    'XColor',[0.972549021244049 0.972549021244049 0.972549021244049],...
    'YDir','reverse');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'on');

% Create ylabel
ylabel('Mv');

% Create xlabel
xlabel('B-V');

% Create title
title({'HR Diagram'},...
    'Color',[0.972549021244049 0.972549021244049 0.972549021244049]);

% Create line of Sun
annotation(fig2,'line',[0.13125 0.9046875],...
    [0.666666666666667 0.666666666666667],'Color',[1 0 1]);

% Create line of Sun
annotation(fig2,'line',[0.4609375 0.458333333333333],...
    [0.112573099415205 0.923976608187134],'Color',[1 0 1]);

% Create textbox of Sun
annotation(fig2,'textbox',...
    [0.457770833333333 0.663742690058476 0.0479583333333334 0.0350877192982454],...
    'Color',[1 0 1],...
    'String',{'Sun'},...
    'FitBoxToText','off',...
    'EdgeColor','none');


%Creates color template
last='HHHHH';
h1=1;
for i=1:N
    %RGB Code
    
    if ISpType(i,2)=='A'
        c(i,:)=[0,0,1];
    elseif ISpType(i,2)=='K'
        c(i,:)=[1,1,0];
    elseif ISpType(i,2)=='F'
        c(i,:)=[0,0.5,1];
    elseif ISpType(i,2)=='G'
        c(i,:)=[0,1,1];
    elseif ISpType(i,2)=='D'
        c(i,:)=[1,1,1];
    else
        c(i,:)=[1,0,0];
    end
    
    %Plot Stars
    plot(BV(i),Mabs(i),'Marker','o','MarkerFaceColor',c(i,:),'MarkerEdgeColor',(c(i,:)+0.3*[1,1,1])/norm(c(i,:)+0.3*[1,1,1]),'MarkerSize',7)
    hold on
    
    %Set names
    if i>1 && ISpType(i,2)~='A' && ISpType(i,2)~='D' && ISpType(i,2)~=last(1) && ISpType(i,2)~=last(2) && ISpType(i,2)~=last(3) && ISpType(i,2)~=last(4) && ISpType(i,2)~=last(5)
        last(h1)=ISpType(i,2);
        h1=h1+1;
        text(BV(i),Mabs(i),['  ',ISpType(i,2)],'Color',[1,1,1],'FontWeight','bold')
    end
    
    
end
clear h1

hold off
for i=1:max(size(rare))
    text(BV(rare(i)),Mabs(rare(i)),ISpType(rare(i),:),'Color',[1,1,1])
end
for i=1:N
    if HIP(i)== 3829
    text(BV(i),Mabs(i),'   White Dwarf 3829','Color',[1,1,1])
    end
end

disp('Saving HRDiagram figure')

savefig('../Figures/HRDiagram.fig')