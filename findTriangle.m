function [p1,p2,p3,rowNum] = findTriangle(P,pointsList,mesh,varargin)
    if(nargin == 3)
        %% straight forward
        fprintf('straight forward\n');
    elseif(nargin == 4)
        extraParam1 = varargin{1};
        %% cleverer way
        fprintf('cleverer way\n');
        disp(extraParam1);
    elseif(nargin == 5)
        extraParam1 = varargin{1};
        extraParam2 = varargin{2};
        fprintf('cleverer way\n');
        disp(extraParam1);
        disp(extraParam2);
    end
    
    
end