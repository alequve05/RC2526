/*
ordena_burbuja(+Lista, -ListaR).
    es cierto cuando ListaR unifica con una lista que
    contiene los mismos elementos que Lista ordenados
    de menor a mayor.

ordenada(+Lista).
    es cierto si Lista está ordenada demenor a mayor.
*/

ordenada([]).
ordenada([_]).
ordenada([Cabeza1, Cabeza2|Resto]) :- Cabeza1 =< Cabeza2, ordenada([Cabeza2|Resto]).

% ordena_burbuja([],[]) :- ordenada([]).
ordena_burbuja(Lista, Lista) :- ordenada(Lista).
ordena_burbuja(Lista, R) :- \+ ordenada(Lista), append(Lista1, [Elem1, Elem2|Lista2], Lista), Elem1 > Elem2, append(Lista1, [Elem2, Elem1|Lista2], R2), ordena_burbuja(R2, R).

ordena_burbuja(Lista, R) :- \+ ordenada(Lista), append(_, [Elem1, Elem2|_], Lista), Elem1 =< Elem2, ordena_burbuja(Lista, R).