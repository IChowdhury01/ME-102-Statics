% Ivan Chowdhury
% Statics SideWork D2

clc, clear all;

% Declare values for all inputs
P = 1000;   % Newtons
L = 0.15;   % Meters
r = 0.07;   % Meters
w = 2000*2*pi/60;   % Radians/second

% Compute reaction forces and torque
t = linspace(0,60);   % Time range (seconds)
theta = w*t;            % Angles (radians)
phi = asin(r/L*cos(theta));

Rp = P*tan(phi);        % Piston reaction force (N)
Rax = P*cos(theta + phi)/cos(phi)*cos(theta);   % Reaction force at A (N)
Ray = P*sin(theta + phi)/cos(phi)*sin(theta);
Ra = sqrt(Rax.^2 + Ray.^2);    % Resultant
M = P*sin(theta + phi)/cos(phi)*r;   % Applied torque (Nm)

% Plot data
figure     
hold on
plot(t,Rp);
plot(t,Ra);
plot(t,M);
hold off

% Label plot
title('Converting Linear to Rotational Motion')
xlabel('Time (seconds)')
ylabel('Force (N)')
legend('Reaction Force at Piston', 'Reaction Force at A', 'Applied Torque');
