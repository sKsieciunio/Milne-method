function [x, y] = milne(f, x_vec, y0)
% y0 has 4 entries per equation

y = y0;
x = x_vec;
h = x_vec(2) - x_vec(1); % step size must be consistant

for i = 5:length(x_vec)
    p = y(i-4,:)' + 4 * h * (2 * f(x_vec(i-3), y(i-3,:)) - ...
        f(x_vec(i-2), y(i-2,:)) + 2 * f(x_vec(i-1), y(i-1,:))) / 3;

    c = y(i-2,:)' + h * (f(x_vec(i-2), y(i-2,:)) + ...
        4 * f(x_vec(i-1), y(i-1,:)) + f(x_vec(i), p)) / 3;

    y = [y; c'];
end

end

