%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036
Input:    P – a 1X2 matrix (x,y) containing a point in 2D
          pointsList  - n-by-2 matrix that stores control points
          mesh – an  m-by-3 matrix that stores the triangles of the mesh.
                     Each row of the mesh contains the 3 row numbers of a pointList that make up a
                     single triangle.
        <last triangle number> - additional arguments your code can use.
                                     
        Output: P1,P2,P3 – 1X2 matrix (x,y) containing a point in 2D
        rowNum – the row number in input array mesh, where the triangle points reside.

%}
function [p1,p2,p3,rowNum] = findTriangle(P,pointsList,mesh,varargin)
    if nargin == 3
        rowNum = 0;
        found = 0;
        while ~found && rowNum < length(mesh)
            rowNum = rowNum + 1;
            currentTriangle = mesh(rowNum,:); 
            p1 = pointsList(currentTriangle(1),:);
            p2 = pointsList(currentTriangle(2),:);
            p3 = pointsList(currentTriangle(3),:);
            found = pointInTriangle(P,p1,p2,p3);
        end
        %{ straight forward %}
    elseif  nargin == 4 
        %{  taking the last triangle found in account%}
        lastMatchedTriangle = mesh(varargin{1},:);
        p1 = pointsList(lastMatchedTriangle(1),:);
        p2 = pointsList(lastMatchedTriangle(2),:);
        p3 = pointsList(lastMatchedTriangle(3),:);
        isInTriangle = pointInTriangle(P,p1,p2,p3);
        rowNum = varargin{1};
        if(~isInTriangle)
            rowNum = 0;
            found = 0;
            while ~found && rowNum < length(mesh)
                rowNum = rowNum + 1;
                currentTriangle = mesh(rowNum,:); 
                p1 = pointsList(currentTriangle(1),:);
                p2 = pointsList(currentTriangle(2),:);
                p3 = pointsList(currentTriangle(3),:);
                found = pointInTriangle(P,p1,p2,p3);
            end  
        end
        %}
    end
end