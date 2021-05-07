clear 
clc
close all

out = sim ('doppiopendolo');

L1 = 1;
L2 = 1;

x1 = L1*sin(out.t1);
x2 = L1*sin(out.t1)+L2*sin(out.t2);
y1 = -L1*cos(out.t1);
y2 = -(L1*cos(out.t1)+L2*cos(out.t2));

for i=1:220

    plot([0,x1(i)],[0,y1(i)],'b','Linewidth',2)
    hold on
    xlim([-1-0.2*1 1+0.2*1])
    ylim([-2 0])
    plot(x1(i),y1(i),'Marker','o','MarkerSize',7,'MarkerFaceColor','r','MarkerEdgeColor','r')
    plot([x1(i),x2(i)],[y1(i),y2(i)],'b','Linewidth',2)
    plot(x2(i),y2(i),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g')
    pause (0.1)
    hold off
    
end
