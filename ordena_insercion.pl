/*
inserta_en_list_ord(+Elem, +Lista, -ListaR).
    es cierto cuando ListaR unifica con una lista
    que contiene los elementos de la lista ordenada
    Lista, con el elemento Elem insertado de forma
    ordenada.
*/

inserta_en_list_ord(Elem, [], [Elem]).
inserta_en_list_ord(Elem, [Cabeza|Resto], [Elem, Cabeza|Resto]) :- Elem =< Cabeza.
inserta_en_list_ord(Elem, [Cabeza|Resto], [Cabeza|ListaR]) :- Elem > Cabeza, inserta_en_list_ord(Elem, Resto, ListaR).

/*
ordena_insercion(+Lista, -ListaR).
    es cierto cuando ListaR unifica con una lista que
    contiene los mismos elementos que Lista ordenados
    de menor a mayor.
*/

ordena_insercion([], []).
ordena_insercion([Cabeza|Resto], ListaR) :- ordena_insercion(Resto, R), inserta_en_list_ord(Cabeza, R, ListaR).