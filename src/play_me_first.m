%% play_me_first.m
% -------------------------------------------------------------------------
% Description:
%   This script initializes car dimensions, motion parameters, and the
%   desired road (path) function. It should be executed before running
%   Simulink models or other project scripts, since it defines variables
%   used throughout the project.
%
% Responsibilities:
%   - Define car dimensions (length, width, etc.)
%   - Define constant forward velocity
%   - Define initial car pose (x0, y0, theta0)
%   - Define symbolic road function and its derivative
%   - Export road functions as MATLAB .m files for use in Simulink
%
% Usage:
%   Run this script once before launching the Simulink model.
%
% -------------------------------------------------------------------------

%% Housekeeping
clc;        % Clear command window
close all;  % Close all open figure windows

%% Car Geometry and Parameters
scale = 5;              % Scaling factor for physical dimensions
l  = 0.3 * scale;       % Car length [m]
w  = 0.18 * scale;      % Car width  [m]
lr = l / 2;             % Distance from rear axle to center [m]
v  = 3;                 % Constant forward velocity [m/s]

% Wheel dimensions (for visualization only)
lw = l / 10;            % Wheel length
ww = w / 10;            % Wheel width

%% Initial Pose of the Car
x0     = -1;            % Initial x-position [m]
y0     =  3;            % Initial y-position [m]
theta0 =  0;            % Initial heading angle [rad]

%% Road Definition
% Define the road as a symbolic function of 'u' (path parameter).
syms u
road_fcn = 10*cos(0.1*u);                % Example: straight line path
dr_fcn   = diff(road_fcn,u); % First derivative (slope)

% Export road and its derivative as callable MATLAB functions
matlabFunction(road_fcn, 'Vars', u, 'File', 'roadFcn.m');
matlabFunction(dr_fcn,   'Vars', u, 'File', 'drFcn.m');

%% End of play_me_first.m
