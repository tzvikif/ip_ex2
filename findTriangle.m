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
        %{ cleverer way %}
        %%disp(extraParam1);
        lastMatchedTriangle = mesh(varargin{1},:);
        p1 = pointsList(lastMatchedTriangle(1),:);
        p2 = pointsList(lastMatchedTriangle(2),:);
        p3 = pointsList(lastMatchedTriangle(3),:);
        isInTriangle = pointInTriangle(P,p1,p2,p3);
        rowNum = varargin{1};
        if(~isInTriangle)
            %{d = sqrt((pointsList(:,1)-P(1)).^2 + (pointsList(:,2)-P(2)).^2);%}
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