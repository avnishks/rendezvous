% Random graph
% DESCRIPTION: 
%    This function generates a random connected graph within a given
%    scatter radius
% PARAMETERS:
%    Nagents - The number of agents 
%    detla   - Sensing radius of all the agents
%    scatter_radius - The radius of the circle inside which all the
%    random points will lie
% Usage:
%    X = random_graph(Nagents,delta,scatter_radius)
%
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function X = random_graph(Nagents,delta, scatter_radius)

% Initialising the positions so as to form a connected initial graph

flag = 0;
n = 0;
A_prev = zeros(Nagents , Nagents);
while flag ~= 1
    X = rand(2 , Nagents)*scatter_radius - scatter_radius/2;
    A = get_adjacence(X , delta , A_prev);
    G = biograph(A);
    [S ~] = conncomp(G);
    if S > 1
        flag = 0;
    else if S == 1
            flag = 1;
        end
    end
    n = n+1;
end