function [newPointList] = calcIntermediateMesh(pointsSource,pointsTarget,t)
    newPointList = pointsSource*(1-t) + t*pointsTarget;
end