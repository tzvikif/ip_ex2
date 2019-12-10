function createMorphSequence(imSource,ImTarget,pointsSource,PointsTarget,numFrames,fileName)
    meshForMorph = calcMesh(pointsSource);
    cols = size(imSource,1);
    rows = size(imSource,2);
    i = 1;
    frames = zeros(numFrames,cols,rows);
    for t=linspace(0,1,numFrames)
        intermediatePointsSource = calcIntermediateMesh(pointsSource,PointsTarget,t);
        imST = warpImage(imSource,pointsSource,intermediatePointsSource,meshForMorph);
        imTT = warpImage(ImTarget,PointsTarget,intermediatePointsSource,meshForMorph);
        frame = crossdissolve(imST,imTT,t);
        frames(i,:,:) = frame;
        i = i +1;
    end
    a = 5;
    

end