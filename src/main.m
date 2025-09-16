%% main.m
% -------------------------------------------------------------------------
% Description:
%   Main script that runs the Simulink model, retrieves simulation data, 
%   and animates the vehicle following the predefined road/path.
%
% Workflow:
%   1. Run the Simulink model "Kinematic_Model_Delta_Psi_Control".
%   2. Extract vehicle state trajectories (x, y, theta).
%   3. Compute the reference road centerline from the symbolic definition.
%   4. Animate vehicle motion: body and front wheel are drawn at each step.
%
% Requirements:
%   - Run play_me_first.m before this script (defines roadFcn, parameters).
%   - The Simulink model "Kinematic_Model_Delta_Psi_Control" must exist.
%
% -------------------------------------------------------------------------

%% Housekeeping
close all;

%% Run Simulink Model
sim('Kinematic_Model_Delta_Psi_Control');

%% Reference Road Centerline
xr = linspace(x(1,2), x(end,2), length(x(:,2)));  % x-domain of simulation
yr = double(subs(road_fcn, xr));                  % road y-values

%% Plot Reference Road
plot(xr, yr, 'k'); 
axis equal;
hold on;

%% Vehicle Geometry (for plotting)
% Wheel rectangle (centered at origin)
wx = [-lw/2 -lw/2  lw/2  lw/2 -lw/2];
wy = [-ww/2  ww/2  ww/2 -ww/2 -ww/2];
wr = zeros(2,5);

% Car body rectangle (centered at origin)
cx = [-l/2 -l/2  l/2  l/2 -l/2];
cy = [-w/2  w/2  w/2 -w/2 -w/2];
cr = zeros(2,5);

%% Simulation Animation
for i = 1:length(x)
    cla;  % clear current axes
    
    % --- Vehicle body rotation matrix ---
    R_body = [cos(theta(i,2)) -sin(theta(i,2));
              sin(theta(i,2))  cos(theta(i,2))];
    for j = 1:5
        cr(:,j) = R_body * [cx(j); cy(j)];
    end
    
    % --- Front wheel rotation matrix ---
    R_wheel = [cos(theta(i,2)+delta(i,2)) -sin(theta(i,2)+delta(i,2));
               sin(theta(i,2)+delta(i,2))  cos(theta(i,2)+delta(i,2))];
    for j = 1:5
        wr(:,j) = R_wheel * [wx(j); wy(j)];
    end
    
    % --- Plot Road and Vehicle ---
    plot(xr, yr, 'k', x(:,2), y(:,2), 'b');
    legend('Road centerline', 'Vehicle path');
    hold on;
    
    % Car body
    fill(cr(1,:)+x(i,2), cr(2,:)+y(i,2), 'r');
    
    % Front wheel (shifted forward by half car length)
    fill(wr(1,:)+x(i,2)+l*cos(theta(i,2))/2, ...
         wr(2,:)+y(i,2)+l*sin(theta(i,2))/2, 'k');
    
    % --- Axis settings ---
    axis equal;
    axis([x(i,2)-10, x(i,2)+10, y(i,2)-10, y(i,2)+10]);
    
    % --- Refresh figure ---
    drawnow;
end

%% End of main.m
