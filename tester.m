%%
p = [2,2,1] ;
vertices = [1,1;3,2;2,4];
 vplot = [vertices;vertices(1,:)];
 plot(vplot(:,1),vplot(:,2));
hold on;
plot(p(1,1),p(1,2));
plot(p(1,1),p(1,2),'o');
hold off;
[alpha,beta,gamma] = BarycentricCoordinates(p,vertices(1,:),vertices(2,:),vertices(3,:));
fprintf("alpha:%d beta:%d gamma%d\n",alpha,beta,gamma);

verticesTR=[0,0;  %define the reference triangle (TR) vertex coordinates
    1,0;
    0,1];
    plot(vplot(:,1),vplot(:,2));
    hold on
    axis equal;
    plot(p(1,1),p(1,2),'o');
%compute the corresponding point on the reference triangle
pTR= alpha*verticesTR(1,:)+beta*verticesTR(2,:)+gamma*verticesTR(3,:)
pTR = [pTR 1];
vplotTR=[verticesTR;verticesTR(1,:)]; %just to plot a closed triangle, we add the first point at the end
    plot(vplotTR(:,1),vplotTR(:,2));
    plot(pTR(1,1),pTR(1,2),'s');
    linePlot=[p; pTR]
    plot(linePlot(:,1),linePlot(:,2),'.-');
    hold off
%%