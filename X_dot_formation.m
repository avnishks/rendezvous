% X_dot formation 
% DESCRIPTION: 
%    This is the code which returns the derivative of the state vector x used for formation control satisfying the equation x'=f(x,t)
% PARAMETERS:
%    T - time series that should be used
%    X - state matrix
% Usage:
%    XD = X_dot_formation(T, X)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function XD = X_dot_formation(~,X)

% Get the adjacence matrix for the new configuration

global A A_prev capital_delta eps tau_2_rows

Nagents = (length(X))/2;
X_2R = [X(1:Nagents)' ; X(Nagents+1 : 2*Nagents)'];
A_prev = A;
A = get_adjacence (X_2R , (capital_delta - eps) , A_prev);

% Calculate the weight matrix for the present state

w = zeros(Nagents , Nagents);
for i=(1:Nagents)
    for j=(1:i)
        
        d_ij = tau_2_rows(:,i) - tau_2_rows(:,j);
        l_ij = X_2R(:,i) - X_2R(:,j);
        
        w(i,j) = (2*(capital_delta - norm(d_ij)) - norm(l_ij - d_ij)) / (capital_delta - norm(d_ij) - norm(l_ij - d_ij))^2;
        w(j,i) = w(i,j);
    end
end

% Calculating the weighted laplacian

Weighted_A = w.*A;
Weighted_L = g_laplacian(Weighted_A);

Xder = -(X_2R(1,:) - tau_2_rows(1,:))*(-Weighted_L');
Yder = -(X_2R(2,:) - tau_2_rows(2,:))*(-Weighted_L');

XD = [Xder' ; Yder'];

