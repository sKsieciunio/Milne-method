function [x_vec, y] = rk4_38(f, x_vec, y0)
% Projekt 2, zadanie 39
% Hubert Błonowski, 333181
%
% Funkcja za pomocą metody Rungego-Kutty 4 rzędu, przybliża rozwiązanie 
% układu równań różniczkowych pierwszego stopnia f, w punktach x_vec
% WEJSCIE
%   f     - uchwyt do układu równań różniczkowych pierwszego stopnia
%   x_vec - kolejne węzły dla metody RK4 (długość kroku musi być stała)
%   y0    - warunki początkowe
% WYJSCIE
%   x_vec - to samo co na wejściu
%   y     - wektor przybliżonych rozwiązań w punktach x_vec

% sprawdzenie czy wartości kroku są równe dla każdego punktu
h = diff(x_vec);
assert(all(abs(h - h(1)) < 1e-10));

h = x_vec(2) - x_vec(1);

y = zeros(length(x_vec), length(y0));
y(1, :) = y0;

for i = 1:length(x_vec)-1
    k1 = h * f(x_vec(i), y(i,:)');
    k2 = h * f(x_vec(i) + h/3, y(i,:)' + k1/3);
    k3 = h * f(x_vec(i) + 2 * h/3, y(i,:)' - k1/3 + k2);
    k4 = h * f(x_vec(i) + h, y(i,:)' + k1 - k2 + k3);

    y(i+1,:) = y(i,:) + (k1' + 3 * k2' + 3 * k3' + k4') / 8;
end

end % function 

