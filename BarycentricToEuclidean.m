%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036
BarycentricToEuclidean
input:
alpha,beta,gamma - Barycentric parameters
A,B,C = triangle edges
output:
the coordinate in euclidean space. of the point in triangle ABC regarding to Barycentric parameters.
%}
function P = BarycentricToEuclidean(alpha,beta,gamma,A,B,C)
    M = [A(1,2),B(1,2),C(1,2);A(1,1),B(1,1),C(1,1);1,1,1];
    p = M*[alpha,beta,gamma]';
    P = [p(1),p(2)];
end