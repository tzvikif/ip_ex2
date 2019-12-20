%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036

 Input: pointsSource, pointsTarget -  n-by-2 matrix that store control points
        t -  a value in [0 1]
        Output:  newPointList –   an n-by-2 matrix that stores the new control points that
        define the intermediate mesh.
%}
function [newPointList] = calcIntermediateMesh(pointsSource,pointsTarget,t)
    newPointList = pointsSource*(1-t) + t*pointsTarget;
end