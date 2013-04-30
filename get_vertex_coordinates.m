% GetVertexCoordinates
%  Description : This code calculates the coordinates of the vertices of a
%  regular n sided polygon
%  Parameters: 
%     - number_nodes - the number of agents in the system
%     - radius - the radius of the circle circumscribing the polygon
%  Usage:
%       vertex_coordinates = GetVertexCoordinates(number_nodes,radius)
% CODED BY: Ankit Shah, Avnish Kumar, Giri Prashant
% EMAIL: ankitshah91@gmail.com,avnish.10.chd@gmail.com,prashant7891@gmail.com
% DATE: Sep 28, 2012
%

function vertex_coordinates = get_vertex_coordinates(number_nodes,radius)

    vertex_coordinates.x = zeros(1,number_nodes);
    vertex_coordinates.y = zeros(1,number_nodes);
    
    vertex_coordinates.x(1) = 0;
    vertex_coordinates.y(1) = radius;
    
    for i=2:number_nodes        
        vertex_coordinates.x(i) = radius*sin(2*(i-1)*pi/number_nodes);
        vertex_coordinates.y(i) = radius*cos(2*(i-1)*pi/number_nodes);
    end

end