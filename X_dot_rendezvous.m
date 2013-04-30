% X_dot rondezvous
% DESCRIPTION: 
%    This is the code which returns the derivative of the state vector x used for rondezvous satisfying the equation x'=f(x,t)
% PARAMETERS:
%    T - time series that should be used
%    X - state matrix
% Usage:
%    XD = X_dot_rendezvous(T, X)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function XD = X_dot_rendezvous(~, X)

global A A_prev capital_delta eps  

% Get the adjacence matrix for the new configuration

Nagents = (length(X))/2;
X_2R = [X(1:Nagents)' ; X(Nagents+1 : 2*Nagents)'];
A_prev = A;
A = get_adjacence (X_2R , (capital_delta - eps) , A_prev);

% Calculate the weight matrix for the present state

w = zeros(Nagents, Nagents);
for i=1:Nagents
    for j=1:i
        l_ij = X_2R(:,i) - X_2R(:,j);
        
        w(i,j) = ((2*capital_delta) - norm(l_ij))/((capital_delta - norm(l_ij))^2); 
        w(j,i) = w(i,j);
    end
end

% Calculating the weighted laplacian

weighted_A = w.*A;
weighted_L = g_laplacian(weighted_A);
Xder = -X_2R(1,:)*(-weighted_L');
Yder = -X_2R(2,:)*(-weighted_L');
XD = [Xder' ; Yder'];