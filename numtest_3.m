function numtest_3()

b = @(x) sin(x.^2);
a = {@(x) -x.*exp(-(x.^2)), @(x) 1, @(x) 1};
x0 = 0;
xN = 20;
y0 = [1, 0];
N = [100 200 400];

exact_solution = @(x) exp(-x);
[x, ode45_y] = ode45(@(x, y) get_dydx(x, y, a, b), [x0, xN], y0);

blueColors = [
    0.4, 0.8, 1; % Medium Blue
    0.1, 0.3, 0.9; % Dark Blue
    0.0, 0.0, 0.7  % Navy Blue
];

fig = figure(1);
fig.Theme = 'light';
grid on;
hold on;
for i = 1:length(N)
    y = P2Z39_HBL_milne(b, a, x0, xN, y0, N(i));
    plot(linspace(x0, xN, N(i)+1), y, 'Color', blueColors(i, :), ...
        'LineWidth',1);
end

plot(x, ode45_y(:,1), ...
    "Color", 'red', 'LineStyle','--', 'LineWidth',1);

legend('y(x) dla h = 0.2', 'y(x) dla h = 0.1', ...
    'y(x) dla h = 0.05', 'rozwiązanie ode45', ...
    'Location','southwest');
xlabel('x')
ylabel('y')
exportgraphics(fig, 'figures/3.png', Resolution=600);

end