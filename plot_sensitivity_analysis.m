import kinetics_model

tnumber = 1001; % number of t values evaluated
endt = 20; % the end time for the simulation
tspan = linspace(0, endt, tnumber); % vector of tnumber equally spaced values of time from 0 to endt
B0 = [0.03, 0.1, 0.5, 1, 2, 4, 6, 8];
for i = 1:length(B0);
    j = B0(i);
x0 = [j;1;50;0;0;0;0;0;0;0]; % initial conditions of the component concentrations

x = kinetics_model(tnumber, endt, x0)
X=x(:,1); % extract each component concentration from x
y=x(:,2);
S=x(:,3);
B=x(:,4);
C=x(:,5);
D=x(:,6);
A=x(:,7);
E=x(:,8);
CO2=x(:,9);
H2=x(:,10);

hold on
for k=1:tnumber
    if B(k)<11;
        t1=t(1:k);
        X1=X(1:k);
        b1=B(1:k);
        S1=S(1:k);
plot(t1,X1,'k')
plot(t1,S1,'r')
plot(t1,b1,'b')
    else break
    end
end
xlabel('Time (hours)');
ylabel('Concentration (g/L broth)');
legend('X','S','B');
x(tnumber,:)' % print the final values of the parameters
print('sensitivity_analysis_graph','-dpng')
