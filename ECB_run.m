%% ECB - Version 1.0
% A novel dynamic simulation model of an Electric City Bus (ECB) for MATLAB.
%
% Copyright 2016-2017, Jari Vepsäläinen and Klaus Kivekäs, all rights reserved.
% 
% ECB may not be reproduced, displayed, modified or redistributed
% without the express prior written permission of the copyright holder(s).
%
% If you wish to modify parameters, open ECB.slx -> ECB model (Mask)
%% Simulate ECB
sim('ECB.slx')
%% Plotting
% Velocity
figure(1);
plot(tout,vref,'Color',[0.4 0.6 0], 'LineWidth', 2.5);
hold on;grid on; plot(tout,vreal,'--','Color',[0.4 0.3 0.7], 'LineWidth', 1.5);
legend('Reference velocity (m/s)', 'Simulated velocity (m/s)');
ylabel({'Velocity [km/h]'}); xlabel('Time [s]');

% Battery

figure(2);
subplot(5,1,[1 2]); plot(tout,Batu, 'Color',[0.4 0.3 0.7], 'LineWidth', 1.2); grid on;
legend('Simulated','Location','SouthEast'); ylabel('Voltage [V]');
axis([0 1567.9 500 750]);
title('Battery Characteristics');

subplot(5,1,[3 4]);  plot(tout,Bati, 'Color',[0.4 0.3 0.7], 'LineWidth', 1.2); grid on;
legend('Simulated','Location','SouthEast'); ylabel('Current [A]');
axis([0 1567.9 -300 325]);

subplot(5,1,5);  plot(tout,BatSoc, 'Color',[0.4 0.3 0.7], 'LineWidth', 1.2); grid on;
legend('Simulated'); ylabel('SOC [%]'); xlabel('Time [s]');
axis([0 1567.9 72 92]);

%Consumption
fprintf('Simulated consumption %.4f kWh/km \n', (kwh(end)/(sreal(end)/1000)));