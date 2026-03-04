/*
invertir(+Lista, -ListaR)
    es cierto cuando ListaR
    unifica con una lista que contiene los mismos
    elementos que Lista en orden inverso.

Principio de Inducción
1. P(n0)
2. ∀ n > n0, P(n-1) -> P(n)

El método:

0. Intentar con el principio de inducción
    1. P(n0)
    2. ∀ todo n > n0, P(n-1) -> P(n)
1. Empezar por lo más fácil (Dar la solución para lista vacía)
invertir([], []).
2. Seguimos con los demás casos (La lista sí tiene elementos)
invertir([Cabeza|Resto], ) :- invertir(Resto, R), append(Resto, [Cab], R2). % append es una forma de meter un elemento al final
*/

invertir([], []). % Caso base, lista vacía
invertir([Cabeza|Resto], ) :- invertir(Resto, R), append(Resto, [Cab], R2).