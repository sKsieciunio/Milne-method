function test1()

b = @(x) x;
a = { @(x) 1, @(x) -2, @(x) 1};
x0 = 0;
xN = 10;
y0 = [1, 0];
N = 10 .* 2.^((0:12)');
h = (xN - x0) ./ N;
E = zeros(size(N));

exact_solution = @(x) x - exp(x) + 2;

for i = 1:length(N)
    exact_y = exact_solution(linspace(x0, xN, N(i)+1)');
    milne_y = P2Z39_HBL_milne(b, a, x0, xN, y0, N(i));
    E(i) = max(abs(exact_y - milne_y));
end

p = 0;
for i = 2:length(N)
    p = [p; (log(E(i-1) / E(i))) / (log(h(i-1) / h(i)))];
end

fprintf("Równanie: y'' - 2y' + 1y = x, y(0) = 1, y'(0) = 0, span = [0,10]\n");
display(table(h, E, p, 'VariableNames', {'h', 'GlobError', 'estimateOrder'}))

end