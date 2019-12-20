%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036

Input:  P,A,B,C –  a 1X2 matrix (x,y) containing a point in 2D
        tri pointsList  - n-by-2 matrix that stores control points
        mesh – an  m-by-3 matrix that stores the triangles of the mesh.
        Each row of the mesh contains the 3 row numbers of a pointList that make up a
        single triangle.
        Output: TorF -True or false. Returns True if point P is in triangle defined by A,B,C
%}
function [TorF] = pointInTriangle(P,P1,P2,P3)
       P12 = P1-P2; P23 = P2-P3; P31 = P3-P1;
   t = sign(det([P31;P23]))*sign(det([P3-P;P23])) >= 0 & ...
       sign(det([P12;P31]))*sign(det([P1-P;P31])) >= 0 & ...
       sign(det([P23;P12]))*sign(det([P2-P;P12])) >= 0 ;
   TorF = t;
end