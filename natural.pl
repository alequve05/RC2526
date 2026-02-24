
% Lógica de primer orden

/*
Principio de Inducción Matemático

Sea S un conjunto ordenable.
Sea n0 el elemento más pequeño de S.
Quiero demostrar que la propiedad P se cumple
para todo elemento del conjunto S.

1. P es cierta para n0.
2. Para todo elemento mayor que n0: Si P(n-1) es cierto, también lo será P(n)
	Ej: "Si mi padre es humano, yo también"
*/

natural(n-1) :- natural(n).

natural(N) :- N > 1, N2 is N - 1, natural(N2).

% 1. Caso Base (n0): El 1 es un número natural.
natural(1).

% 2. Paso Inductivo: P(n) es cierto si P(n-1) es cierto.
% Leemos: "N es natural SI N es mayor que 1 Y su anterior (N2) es natural".
natural(N) :- 
    N > 1,           % Condición de seguridad
    N2 is N - 1,     % Calculamos el n-1
    natural(N2).     % Comprobamos la propiedad P para el anterior