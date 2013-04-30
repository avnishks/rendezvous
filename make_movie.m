% make_movie
%  Description : This code plots time sliced screenshots of the
%  particle containing area over time.
%  Parameters: 
%     - X = random_graph(Nagents,delta,scatter_radius)
%
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012

function a = make_movie(X,fig_title)

    Nagents = size(X,2)/2;
    h = figure('Name',fig_title,'NumberTitle','off');
    k=1;
%     a = struct(1,size(X,1));
    for i = 1:size(X,1)
        
        if mod(i,100) == 0
            fprintf(' Rendering frames %s/%s \n', num2str(i), num2str(size(X,1)));
        end
        
        figure(h);
        plot(X(1:i,1:Nagents),X(1:i,Nagents+1:end));
        hold on
        plot(X(1:1,1:Nagents),X(1:1,Nagents+1:end),'o');
        hold on
        plot(X(end:end,1:Nagents),X(end:end,Nagents+1:end),'x');
        a(k) = getframe(h);
        k = k+1;
        close(h);
    end
    
end

    