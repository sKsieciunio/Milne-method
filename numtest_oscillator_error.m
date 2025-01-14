function numtest_oscillator_error()

k = 1;

b = @(x) 0;
a = {@(x) k, @(x) 0, @(x) 1};
x0 = 0;
xN = 1300;
y0 = [1, 0];
N = [40, 80];

exact_solution = @(x) cos(sqrt(k) .* x);

h = 0.5:-0.02:0.01;
E = zeros(size(h));
E_epsilon = 0.1;

for i = 1:length(h)
    y = P2Z39_HBL_milne(b, a, x0, xN, y0, round(xN / h(i)));
    exact_y = exact_solution(linspace(x0, xN, round(xN / h(i))+1)');
    Errors = abs(exact_y - y);
    idx = find(Errors > E_epsilon, 1);
    if isempty(idx)
        E(i) = 0;
    else 
        E(i) = idx(1) * h(i);
    end
end

fig = figure(1);
fig.Theme = 'light';
grid on;
hold on;
yscale log;
plot(h, E, 'Color', 'red');
% yscale log;
set(gca, 'XDir', 'reverse');
plot(h, 15./h, 'Color', 'blue');
plot(h, 2./(h.^2), 'Color', 'cyan');
xlabel('h - długość kroku');
ylabel('x dla którego bezwzględny błąd wynosi > 0.1');
legend('x dla którego bezwzględny błąd wynosi > 0.1', ...
    'O(1/h)', 'O(1/h^2)', 'Location','northwest');

exportgraphics(fig, 'figures/harmonic_error.png', Resolution=600);


end