function numtest_oscillator()

k = 1;

b = @(x) 0;
a = {@(x) k, @(x) 0, @(x) 1};
x0 = 0;
xN = 21;
y0 = [1, 0];
N = [40, 80];

exact_solution = @(x) cos(sqrt(k) .* x);

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
for i = 1:length(N)
    y = P2Z39_HBL_milne(b, a, x0, xN, y0, N(i));
    plot(linspace(x0, xN, N(i)+1), y, 'Color', blueColors(i, :), ...
        'LineWidth',1);
end

plot(linspace(x0, xN, 1000), exact_solution(linspace(x0, xN, 1000)), ...
    "Color", 'red', 'LineStyle','--', 'LineWidth',1);

legend('x(t) dla h = 0.5', 'x(t) dla h = 0.25', 'rozwiązanie analityczne');
xlabel('t - czas')
ylabel('x - położenie')
exportgraphics(fig, 'figures/harmonic.png', Resolution=600);

end