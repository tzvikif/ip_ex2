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
        %{
        if(~found)
            %%fprintf("Error!!!");
            plotTriangle(P,p1,p2,p3,'rx');
        else
            plotTriangle(P,p1,p2,p3,'bx');
        end
        %}
        %{ straight forward %}
    elseif  argin == 4 
        %{ cleverer way %}
        disp(extraParam1);
        currentTriangle = mesh(varargin{1});
        p1 = pointsList(currentTriangle(1));
        p2 = pointsList(currentTriangle(2));
        p3 = pointsList(currentTriangle(3));
        isInTriangle = pointInTriangle(P,p1,p2,p3);
        if(isInTriangle)
            rowNum = currentTriangle;
        else
            
            %{d = sqrt((pointsList(:,1)-P(1)).^2 + (pointsList(:,2)-P(2)).^2);%}
            rowNum = 0;
            while pointInTriangle(P,p1,p2,p3)
               rowNum = rowNum + 1;
               currentTriangle = mesh(rowNum); 
               p1 = pointsList(currentTriangle(1));
               p2 = pointsList(currentTriangle(2));
               p3 = pointsList(currentTriangle(3));
            end  
        end
        %}
    end
end