function dydx = get_dydx(x, y, a, b)

% a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x)


dydx = [
    y(2) / a{3}(x);
    b(x) - a{1}(x) * y(1) - a{2}(x) * y(2) / a{3}(x);
];

dydx = [
    y(2);
    (b(x) - a{1}(x) * y(1) - a{2}(x) * y(2)) / a{3}(x) 
];

end

