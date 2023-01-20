import kinetics_model

tnumber = 101; % number of t values evaluated
endt = 24; % the end time for the simulation
x0 = [0.1; 1; 50; 0; 0; 0; 0; 0; 0; 0]; % initial conditions of the component concentrations

x = kinetics_model(tnumber, endt, x0)
X = x(:, 1); % extract each component concentration from x
y = x(:, 2);
S = x(:, 3);
B = x(:, 4);
C = x(:, 5);
D = x(:, 6);
A = x(:, 7);
E = x(:, 8);
CO2 = x(:, 9);
H2 = x(:, 10);

hold on
plot(t, X, 'g--')
plot(t, y)
plot(t, S)
plot(t, B)
plot(t, C)
plot(t, D)
plot(t, A)
plot(t, E)
plot(t, CO2)
plot(t, H2)
xlabel('Time (hours)');
ylabel('Concentration (g/L broth)');
legend('X', 'y', 'S', 'B', 'C', 'D', 'A', 'E', 'CO2', 'H2');
legend('Location', 'west');
x(tnumber, :)' % print the final values of the parameters
print('kinetics_model', '-dpng')
