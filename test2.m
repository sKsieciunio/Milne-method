function test2()

b = @(x) sin(x);
a = { @(x) 1, @(x) 0, @(x) 1};
x0 = 0;
xN = 10;
y0 = [0, 1];
N = 10 .* 2.^((0:9)');
h = (xN - x0) ./ N;
E = zeros(size(N));

exact_solution = @(x) 3 .* sin(x) ./ 2 - x .* cos(x) ./ 2;

for i = 1:length(N)
    exact_y = exact_solution(linspace(x0, xN, N(i)+1)');
    milne_y = P2Z39_HBL_milne(b, a, x0, xN, y0, N(i));
    E(i) = max(abs(exact_y - milne_y));
end

p = 0;
for i = 2:length(N)
    p = [p; (log(E(i-1) / E(i))) / (log(h(i-1) / h(i)))];
end

fprintf("Równanie: y'' + y = sin(x), y(0) = 0, y'(0) = 1, span = [0,10]\n");
display(table(h, E, p, 'VariableNames', {'h', 'GlobError', 'estimateOrder'}))

end