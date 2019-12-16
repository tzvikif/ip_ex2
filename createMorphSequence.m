function createMorphSequence(imSource,imTarget,pointsSource,PointsTarget,numFrames,fileName)
    meshForMorph = calcMesh(pointsSource);
    v = VideoWriter(fileName,'Grayscale AVI');
    open(v);
    i = 1;
    runtime = zeros(1,numFrames);
    for t=linspace(0,1,numFrames)
        tic;
        intermediatePointsSource = calcIntermediateMesh(pointsSource,PointsTarget,t);
        imST = warpImage(imSource,pointsSource,intermediatePointsSource,meshForMorph);
        imTT = warpImage(imTarget,PointsTarget,intermediatePointsSource,meshForMorph);
        frame = crossdissolve(imST,imTT,t);
        runtime(i) = toc;
        writeVideo(v,frame);
    end
    plot(runtime);
    close(v);
end