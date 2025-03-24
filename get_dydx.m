function dydx = get_dydx(x, y, a, b)
% Projekt 2, zadanie 39
% Hubert Błonowski, 333181
%
% Funkcja przekształca równanie różniczkowe drugiego stopnia w postaci:
% a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x) do układu równań pierwszego
% stopnia
% WEJSCIE 
%   x,
%   y,
%   b, a - uchwyty do funkcji opisujących równanie wyżej, gdzie a jest
%            tablica komórkową uchwytów do funkcji
% WYJSCIE
%   dydx - układ równań różniczkowych pierwszego stopnia 
dydx = [
    y(2);
    (b(x) - a{1}(x) * y(1) - a{2}(x) * y(2)) / a{3}(x) 
];

end % function

