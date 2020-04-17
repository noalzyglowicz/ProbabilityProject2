tau = 57;
a = 1 / tau;
x = linspace(1,250);
f = (a^2).*x.*exp((-1/2).*(a.^2).*(x.^2));
F = 1 - exp((-1/2).*(a.^2).*(x.^2));
EX = (1/a)*sqrt(pi/2);
VarX = (4-pi)/(2*(a^2));

%{
plot(x,f);
xlabel('Distance (inches)')
ylabel('Probability, f_x')
title('PDF f_x of Drop Model')
%}

%CDF
%{
plot(x, F, 'r');
xlabel('Distance (inches)')
ylabel('Cumulative Probability F_x')
title('CDF F_x of Drop Model')
%}

%{
circle(0,0,67.1124)
xlim([-150, 150])
ylim([-150, 150])
grid on
hold on
circle(0,0,88.4501)
hold on
circle(0,0,122.32)
ox = 0;
oy = 0;
hold on
plot(ox, oy, '.k')
title('Circles with Radius x_p, P[X \leq x_p] = p')
legend_strings{1} = 'p = 0.5, x_p = 67.11';
legend_strings{2} = 'p = 0.7, x_p = 88.45';
legend_strings{3} = 'p = 0.9, x_p = 122.32';
legend_strings{4} = 'Target T';
legend(legend_strings);
xlabel('Distance (inches)')
ylabel('Distance (inches)')
%}
