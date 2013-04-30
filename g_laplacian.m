% g_laplacian
% DESCRIPTION: 
%    Gives the graph laplacian for any weighted adjacency matrix A
% PARAMETERS:
%    A - the matrix whose laplacian needs to be determined
% Usage:
%    L = g_laplacian(A)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%
function L = g_laplacian(A)
%
n = length(A);
lap = A;
for i=1:n
    lap(i,i) = -(sum (A(i,:)) - A(i,i));
end
L = lap;
end




