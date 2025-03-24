function y = P2Z39_HBL_milne(b, a, x0, xN, y0, N)
% Projekt 2, zadanie 39
% Hubert Błonowski, 333181
%
% Funkcja rozwiązuje równanie różniczkowe drugiego rzędu o postaci:
% a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x), za pomocą metody Milne'a
% WEJSCIE
%   b, a   - uchwyty do funkcji opisujących równanie wyżej, gdzie a jest
%            tablica komórkową uchwytów do funkcji
%   x0, xN - końce przedziału całowania równania różniczkowego
%   y0     - wartość początkowa (lub wektor, gdzie pierwsza element to 
%            zadana wartość rozwiązania, drugi - jego pochodnej, itd.)
%   N      - liczba kroków (liczba podprzedziałów [x0, xN]
% WYJSCIE
%   y      - wektor przybliżeń wartości rozwiązania równania

x_span = linspace(x0, xN, N+1)';
dydx = @(x, y) get_dydx(x, y, a, b);

[~, y] = rk4_38(dydx, x_span(1:4), y0);
[~, y] = milne(dydx, x_span, y);

y = y(:,1);

end % function 

