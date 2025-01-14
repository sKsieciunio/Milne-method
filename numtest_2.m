function numtest_2()

b = @(x) 0;
a = {@(x) -1, @(x) 0, @(x) 1};
x0 = 0;
xN = 20;
y0 = [1, -1];
N = 100;

exact_solution = @(x) exp(-x);

% Define an array of blue shades (RGB values)
blueColors = [
    0.4, 0.8, 1; % Medium Blue
    0.0, 0.2, 0.7; % Dark Blue
    0.0, 0.0, 0.5  % Navy Blue
];

fig = figure(1);
fig.Theme = 'light';
grid on;
hold on;
yscale log;
for i = 1:length(N)
    y = P2Z39_HBL_milne(b, a, x0, xN, y0, N(i));
    plot(linspace(x0, xN, N(i)+1), y, 'Color', blueColors(i, :), ...
        'LineWidth',1);
end

plot(linspace(x0, xN, 1000), exact_solution(linspace(x0, xN, 1000)), ...
    "Color", 'red', 'LineStyle','--', 'LineWidth',1);

legend('y(x) dla h = 0.2', 'rozwiązanie analityczne');
xlabel('x')
ylabel('y')
exportgraphics(fig, 'figures/2.png', Resolution=600);

end