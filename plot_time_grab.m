% plot time grab
% DESCRIPTION: 
%    This is the code which plots the time grabs of all the agent
%    trajectories
% PARAMETERS:
%    X - 2*Nagents x time matrix containing the coordinates of the paths
%    fig_title - the title of the window
% Usage:
%    plot_time_grab(X,fig_title)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function plot_time_grab(X,fig_title)
    
    Nagents = size(X,2)/2;
    legend_string = cell(1,Nagents);
    for i=1:Nagents
        legend_string{i} = sprintf('%s %s','Agent',num2str(i));
    end
    
    h = figure('Name',fig_title,'NumberTitle','off');
%     plot(X(:,1:Nagents),X(:,Nagents+1:end))
%     hold on
%     plot(X(1:1,1:Nagents),X(1:1,Nagents+1:end),'o')
%     hold on
%     plot(X(end:end,1:Nagents),X(end:end,Nagents+1:end),'x')
     hold on
    X_new = zeros(size(X,1),size(X,2)+2);
    
    X_new(:,1:Nagents) = X(:,1:Nagents);
    X_new(:,Nagents+1) = X(:,1);
    X_new(:,Nagents+2:end-1) = X(:,Nagents+1:end);    
    X_new(:,end) = X(:,Nagents+1);    
    
    Nagents = Nagents + 1;
    
    time_length = 200;
    for i=0:5
        figure(h)
        if i == 0
            colour = 'r';
        elseif i == 1
            colour = 'g';
        elseif i == 2
            colour = 'k';
        elseif i == 3
            colour = 'y';
        elseif i == 4
            colour = 'm';
        else
            colour = 'c';
        end
            
        plot(X_new(i*time_length+1:i*time_length+1,1:Nagents), X_new(i*time_length+1:i*time_length+1,Nagents+1:end),colour);
        hold on
        plot(X_new(i*time_length+1:i*time_length+1,1:Nagents), X_new(i*time_length+1:i*time_length+1,Nagents+1:end),'*');
        hold on
    end
    
    plot(X_new(end:end,1:Nagents), X_new(end:end,Nagents+1:end),'--rs');
    hold on
    plot(X_new(end:end,1:Nagents), X_new(end:end,Nagents+1:end),'*');
    
%     legend(legend_string)
    title('Time grab of all the agents')
    xlabel('X coordinates')
    ylabel('Y coordinates')