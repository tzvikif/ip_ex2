%{
Input:    P,A,B,C –  a 1X2 matrix (x,y) containing a point in 2D
    Output: alpha,beta,gamma – scalars representing the Barycentric coordinates of P in triangle A,B,C
Method:
    Use matrix method as shown in lesson slides.
%}
function [alpha,beta,gamma] = BarycentricCoordinates(P,A,B,C)
    Ax = A(1,1);
    Ay = A(1,2);
    Bx = B(1,1);
    By = B(1,2);
    Cx = C(1,1);
    Cy = C(1,2);
    M = [Ax,Bx,Cx;Ay,By,Cy;1,1,1];
    X = inv(M)*P';
    alpha = X(1,1);
    beta = X(2,1);
    gamma = X(3,1);
     

end
