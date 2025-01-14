function [x_vec, y] = rk4_38(f, x_vec, y0)
% x - nodes for first 4 values

y = y0;
% step size must be consistant
h = x_vec(2) - x_vec(1);

for i = 1:length(x_vec)-1
    k1 = h * f(x_vec(i), y(i,:)');
    k2 = h * f(x_vec(i) + h/3, y(i,:)' + k1/3);
    k3 = h * f(x_vec(i) + 2 * h/3, y(i,:)' - k1/3 + k2);
    k4 = h * f(x_vec(i) + h, y(i,:)' + k1 - k2 + k3);

    y(i+1,:) = y(i,:) + (k1' + 3 * k2' + 3 * k3' + k4') / 8;
end

end % function 

