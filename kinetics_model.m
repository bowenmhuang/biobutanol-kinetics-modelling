function [x] = kinetics_model(tnumber, endt, x0)
lambda = 0.56; % kinetic parameters
k1 = 0.009;
k2 = 0.0008;
k3 = 0.0255;
k4 = 0.06764;
k5 = 0.0136;
k6 = 0.117;
k7 = 0.0113;
k8 = 0.715;
k9 = 0.135;
k10 = 0.1558;
k11 = 0.0258;
k12 = 0.6139;
k13 = 0.0185;
k14 = 0.00013;
KI = 0.833;
KS = 2;
KC = 0.5;
KD = 0.5;
tspan = linspace(0, endt, tnumber); % vector of tnumber equally spaced values of time from 0 to endt

func = @(t, x) [lambda * (x(2) - 1) * x(1) - k2 * x(1) * x(4); % x represents the matrix of the 10 component concentrations over time
    (k1 * x(3) * KI / (KI+x(4)) - lambda * (x(2) - 1)) * x(2);
     - k3 * x(3) * x(1) - k4 * x(3) * x(1) / (KS + x(3));
    k7 * x(3) * x(1) - 0.841 * (k5 * x(3) * KI * x(1) / (KI + x(4)) - k6 * x(5) * x(1) / (KC + x(5)));
    k5 * x(3) * KI * x(1) / (KI + x(4)) - k6 * x(5) * x(1) / (KC + x(5));
    k8 * x(3) * KI * x(1) / ((KS + x(3)) * (KI + x(4))) - k9 * x(6) * x(3) * x(1) / ((KD + x(6)) * (KS + x(3)));
    k10 * x(3) * x(1) / (KS + x(3)) - 0.484 * (k8 * x(3) * KI * x(1) / ((KS + x(3)) * (KI + x(4))) - k9 * x(6) * x(3) * x(1) / ((KD + x(6)) * (KS + x(3))));
    k11 * x(3) * x(1) / (KS + x(3));
    k12 * x(3) * x(1) / (KS + x(3));
    k13 * x(3) * x(1) / (KS + x(3)) + k14 * x(3) * x(1)];
[t, x] = ode45(@(t, x) func(t, x), tspan, x0); % solve the ten simultaneous ODEs over the range tspan with initial conditions x0
end
