% Main 
% DESCRIPTION: This is the main code which is used the run both rondevouz
% and formation control analysis
% PARAMETERS:
%    None
% Usage:
%       run('main.m')
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

%% Declarations and initializations
global A A_prev capital_delta eps tau tau_2_rows

capital_delta = 10;
eps = 0.05*capital_delta;
scatter_radius = 30 ; 
Nagents = 8;

vertex_coordinates = Get_Vertex_Coordinates(Nagents,1/sqrt(2));

tau = [vertex_coordinates.x vertex_coordinates.y];
tau_2_rows = [vertex_coordinates.x ; vertex_coordinates.y];

%% Calculating initial random connected graph

X = random_graph(Nagents,(capital_delta - eps),scatter_radius);
A_prev = zeros(Nagents , Nagents);
A = get_adjacence(X , (capital_delta - eps) , A_prev);
x0 = [X(1,:) X(2,:)];
x0_2_rows = [X(1,:) ; X(2,:)];

%% Solving for the trajectories

[T_formation X_formation] = ode45(@X_dot_formation  , [0 1000] , x0);
[T_rondevouz X_rondevouz] = ode45(@X_dot_rendezvous , [0 1000] , x0);

%% Plot the results 

plot_trajectory(X_formation,'Formation Flying');
plot_trajectory(X_rondevouz,'Rendezvous'); 
plot_time_grab (X_formation,'Formation Flying Time Grab');
plot_time_grab (X_rondevouz,'Rendezvous Time Grab');

final_movie_rendezvous = make_movie(X_rondevouz,'Rendezvous');
final_movie_formation = make_movie(X_formation,'formation');
