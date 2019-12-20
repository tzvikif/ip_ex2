%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036
Input:    im1,im2  – 2D matrices of the same size.
    These are grayscale images with values the range [0..255] in double format
    t -  a value in [0 1]
Output: newIm  – 2D matrix of the same size as im1,im2.  Format is uint8.          
Method:
    Output image is a weighted average of im1 and im2.
    1 line of Matlab code!
%}
function [newIm] = crossdissolve(im1,im2,t)
    doubleNewIm = im1*(1-t) + t*im2;
    newIm = uint8(doubleNewIm);
end