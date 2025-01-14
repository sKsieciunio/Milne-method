function numtest_2_error()

b = @(x) 0;
a = {@(x) -1, @(x) 0, @(x) 1};
x0 = 0;
xN = 30;
y0 = [1, -1];
N = 100;

exact_solution = @(x) exp(-x);

h = 0.5:-0.02:0.01;
E = zeros(size(h));
E_epsilon = 0.1;

for i = 1:length(h)
    y = P2Z39_HBL_milne(b, a, x0, xN, y0, round(xN / h(i)));
    exact_y = exact_solution(linspace(x0, xN, round(xN / h(i))+1)');
    Errors = abs(exact_y - y);
    E_epsilon = 10 * exact_y;
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
% yscale log;
plot(h, E, 'Color', 'red');
% yscale log;
set(gca, 'XDir', 'reverse');
% plot(h, 15./h, 'Color', 'blue');
% plot(h, 2./(h.^2), 'Color', 'cyan');
xlabel('h - długość kroku');
ylabel('x dla którego błąd względny wynosi > 10');
legend('x dla którego błąd względny wynosi > 10', 'Location','northwest');

exportgraphics(fig, 'figures/2_error.png', Resolution=600);


end