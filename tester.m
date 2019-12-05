%%
p = [2,2,1] ;
vertices = [1,1;3,2;2,4];
 vplot = [vertices;vertices(1,:)];
 plot(vplot(:,1),vplot(:,2));
hold on;
plot(p(1,1),p(1,2),'o');
hold off;
[alpha,beta,gamma] = BarycentricCoordinates(p,vertices(1,:),vertices(2,:),vertices(3,:));
fprintf("alpha:%d beta:%d gamma%d\n",alpha,beta,gamma);
%define the reference triangle (TR) vertex coordinates
verticesTR=[0,0;
            1,0;
            0,1];
plot(vplot(:,1),vplot(:,2));
hold on
axis equal;
plot(p(1,1),p(1,2),'o');
%compute the corresponding point on the reference triangle
pTR= alpha*verticesTR(1,:)+beta*verticesTR(2,:)+gamma*verticesTR(3,:)
[px,py] = BarycentricToEuclidean(alpha,beta,gamma,verticesTR(1,:),verticesTR(2,:),verticesTR(3,:));
pTR = [pTR 1];
vplotTR=[verticesTR;verticesTR(1,:)]; %just to plot a closed triangle, we add the first point at the end
    plot(vplotTR(:,1),vplotTR(:,2));
    plot(pTR(1,1),pTR(1,2),'s');
    linePlot=[p; pTR]
    plot(linePlot(:,1),linePlot(:,2),'.-');
    hold off
%%
x = gallery('uniformdata',[20,1],0);
y = gallery('uniformdata',[20,1],1);
pointList = [x y];
mesh = calcMesh(pointList);
n = length(mesh);
triplot(mesh,x,y);
  
%% crossdissolve(im1,im2,t)
sLena = double(readImage('lena.tif'));
dLena = contrastEnhance(sLena,[150,255]);
im = crossdissolve(sLena,dLena,0.8);
showImage(sLena);
showImage(dLena);
showImage(im);
%%