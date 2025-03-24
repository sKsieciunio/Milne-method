function [x, y] = milne(f, x_vec, y0)
% Projekt 2, zadanie 39
% Hubert Błonowski, 333181
%
% Funkcja za pomocą metody Milne'a, przybliża rozwiązanie układu równań 
% różniczkowych pierwszego stopnia f, w punktach x_vec
% WEJSCIE
%   f     - uchwyt do układu równań różniczkowych pierwszego stopnia
%   x_vec - kolejne węzły dla metody Milne'a (długość kroku musi być stała)
%   y0    - warunki początkowe dla pierwszych czterech węzłów
% WYJSCIE
%   x     - to samo co x_vec na wejściu
%   y     - wektor przybliżonych rozwiązań w punktach x

% sprawdzenie czy wartości kroku są równe dla każdego punktu
h = diff(x_vec);
assert(all(abs(h - h(1)) < 1e-10));

h = x_vec(2) - x_vec(1); 

y = zeros(length(x_vec), size(y0, 2));
y(1:4, :) = y0;

x = x_vec;

for i = 5:length(x_vec)
    p = y(i-4,:)' + 4 * h * (2 * f(x_vec(i-3), y(i-3,:)) - ...
        f(x_vec(i-2), y(i-2,:)) + 2 * f(x_vec(i-1), y(i-1,:))) / 3;

    c = y(i-2,:)' + h * (f(x_vec(i-2), y(i-2,:)) + ...
        4 * f(x_vec(i-1), y(i-1,:)) + f(x_vec(i), p)) / 3;

    y(i,:) = c';
end

end % function

