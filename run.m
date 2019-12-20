%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036
%}
%% for running the project
load('myPoints.mat');
numFrames = 60
daphna = readImage('Daphna.tiff');
Tzviki = readImage('Tzviki.tiff');
createMorphSequence(Tzviki,daphna,movingPoints,fixedPoints,numFrames,"frames.avi");
%%
