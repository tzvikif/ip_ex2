%{
Input: imSource – a 2D matrix of a grayscale image with values in the range [0..255]
    pointsSource, pointsDest  - n-by-2 matrices that store control points
    mesh – an  m-by-3 matrix that stores the triangles of the mesh.
    Each row of the mesh contains the 3 row numbers of a pointList that make up a
    single triangle.
    Output:  imWarped – a 2D matrix of a grayscale image with values in the range [0..255]
    same size as imSource.
    Output imWarp as double.
Method:
    Uses inverse mapping. Build a new image the size of imSource by assigning values to its pixels.
    For each pixel determine which triangle it is in using mesh and pointsDest.
    Once found, calculate pixel's Barycentric coordinates.
    Use these Barycentric coordinates to determine the source xy coordinates in image imSource
    by using pointsSource.
    Get the grayscale value from imSource using these xy coordinates. Use NearestNeighbor interpolation.
    Note: Unfortunately, it is difficult to do this using matrix operations (though possible).
    So here you CAN use loop over the pixels.
    This means this function takes long run-time.
    HOWEVER, you can save time by smart search over the different triangles in the mesh.
    if pixel (x,y) is found in triangle [P1,P2,P3] then it is very likely that pixel (x+1,y) (as well as other neighbors)
    will be found in the same triangle. If not then it is likely to be in neighboring triangles,
    (triangles in the mesh that share one of the vertices P1,P2,P3).
%}
function [imWarped] = warpImage(imSource,pointsSource,pointsDest,mesh)
    col = size(imSource,2);
    row = size(imSource,1);
    imWarped = zeros(row,col);
    %%plotMesh(pointsDest,mesh);
    rowNum = 1;
    %%the rownumber of the last used triangle
    for i=1:row
        for j=1:col
            pd = [j,i];
            [triPd1,triPd2,triPd3,rowNum] = findTriangle(pd,pointsDest,mesh,rowNum);
            [alpha,beta,gamma] = BarycentricCoordinates(pd,triPd1,triPd2,triPd3);
            %% using inverse mapping with [alpha,beta,gamma]
            triPs = pointsSource(mesh(rowNum,:),:);
            ps = BarycentricToEuclidean(alpha,beta,gamma,triPs(1,:),triPs(2,:),triPs(3,:));
            ps = round(abs(ps)); %%using NN interpolation
            %hold on;plot(pd(1),pd(2),'gx','MarkerSize',10);
            %fprintf('ps(1):%d,ps(2):%d alpha:%f,beta:%f,gamma:%f\n',ps(1),ps(2),alpha,beta,gamma);
            interpolatedColor = imSource(ps(1),ps(2));
            imWarped(i,j) = interpolatedColor;
        end
    end
end