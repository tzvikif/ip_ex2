%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036

Input:  imSource,imTarget  – 2D matrices of the same size.
        These are grayscale images with values the range [0..255]
        pointsSource,pointsTarget  - n-by-2 matrices that store control points
        numFrames – number of frames in the output movie.   numFrames >=2
        filename – a string. Name of file to output movie (example "myMovie.avi")
        Output:    movie – a matlab created movie
%}
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
    fprintf('Program paused. Press enter to continue.\n')
    pause;
    plot(runtime);
    close(v);
end