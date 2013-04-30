% Get Adjacence
% DESCRIPTION: 
%    This function evaluates the adjacency matrix for a given position set and
%    sensing radius
% PARAMETERS:
%    X - [2 x Nagents] matrix containing the coordinates of the
%        agents
%    detla - sensing radius of all the agents
%    A_prev - the previous adjency matrix used for hysterises
% Usage:
%    A = get_adjacence(X,delta,A_prev)
%
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function A = get_adjacence(X,delta,A_prev)

n = length (X);
adj = zeros(n,n);
for i = 1:n
    for j = 1:i
        diff = X(:,i) - X(:,j);
        distance = norm(diff);
 
        if i == j
            adj(i,j) = 0;            
            continue
        end
        
        if A_prev(i,j) == 1
            adj(i,j) = 1;
            adj(j,i) = 1;
            continue;
        end
        
        if distance <= delta
            adj(i,j) = 1;
            adj(j,i) = adj(i,j);
        end        
    end
end

A = adj;

