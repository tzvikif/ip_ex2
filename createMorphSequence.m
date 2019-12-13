function createMorphSequence(imSource,imTarget,pointsSource,PointsTarget,numFrames,fileName)
    meshForMorph = calcMesh(pointsSource);
    cols = size(imSource,1);
    rows = size(imSource,2);
    frames = zeros(numFrames,cols,rows);
    %%v = VideoWriter(fileName,'Grayscale AVI');
    %%open(v);
    i = 1;
    runtime = zeros(1,numFrames);
    for t=linspace(0,1,numFrames)
        tic;
        intermediatePointsSource = calcIntermediateMesh(pointsSource,PointsTarget,t);
        imST = warpImage(imSource,pointsSource,intermediatePointsSource,meshForMorph);
        imTT = warpImage(imTarget,PointsTarget,intermediatePointsSource,meshForMorph);
        frame = crossdissolve(imST,imTT,t);
        runtime(i) = toc;
        %%writeVideo(v,frame);
        %%frames(i,:,:) = frame;
        i = i + 1;
    end
    plot(runtime);
    %%close(v);
end