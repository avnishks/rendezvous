% plot trajectory
% DESCRIPTION: 
%    This is the code which plots the trajectories of all the agents
% PARAMETERS:
%    X - 2*Nagents x time matrix containing the coordinates of the paths
%    fig_title - the title of the window
% Usage:
%    plot_trajectory(X,fig_title)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function plot_trajectory(X,fig_title)
    
    Nagents = size(X,2)/2;
    legend_string = cell(1,Nagents);
    for i=1:Nagents
        legend_string{i} = sprintf('%s %s','Agent',num2str(i));
    end
    
    figure('Name',fig_title,'NumberTitle','off')
    plot(X(:,1:Nagents),X(:,Nagents+1:end))
    hold on
    plot(X(1:1,1:Nagents),X(1:1,Nagents+1:end),'o')
    hold on
    plot(X(end:end,1:Nagents),X(end:end,Nagents+1:end),'x')
    
    legend(legend_string)
    title('Trajectories of all the agents (direction is from o to x)')
    xlabel('X coordinates')
    ylabel('Y coordinates')
    
    
    
