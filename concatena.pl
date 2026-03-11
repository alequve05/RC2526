/*
concatena(+Lista1, +Lista2, -ListaR).
    es cierto cuando ListaR unifica con una lista 
    que contiene los elementos de la lista Lista1
    en el mismo orden y seguidos de los elementos
    de la lista Lista2 en el mismo orden.
*/

concatena([], Lista, Lista).
concatena([Cabeza|Resto], Lista, [Cabeza|R]) :- concatena(Resto, Lista, R).