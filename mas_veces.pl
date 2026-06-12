/*
mas_veces(+Lista, -Elem, -Num).
    es cierto cuando Elem unifica con el elemento
    que se repite más veces en la lista Lista
    y Num unifica con el número de veces que se
    repite dicho elemento
*/

mas_veces([], _, 0).
mas_veces([Elem], Elem, 1).
mas_veces(Lista, Elem, N) :- msort(Lista, ListaO), comprime(ListaO, ListaC), mayor_n(ListaC, Elem, N).

/*
mayor_n(+ListaComprimida, -Elem, -N).
    es cierto si Elem unifica con el elemento que se
    repite más veces en ListaComprimida y N unifica con
    el número de veces que se repite elem.
    ListaComprimida tiene el siguiente formato:
    ListaComprimida = [(a,3), (b,3), (c,1), (d,2)]
*/

mayor_n([(Elem, N)], Elem, N).
mayor_n([(Elem, N)|Resto], Elem, N) :- mayor_n(Resto, _, NMayor), NMayor < N.
mayor_n([(_, N)|Resto], Mayor, NMayor) :- mayor_n(Resto, Mayor, NMayor), NMayor > N.
mayor_n([(_, N)|Resto], Mayor, NMayor) :- mayor_n(Resto, Mayor, NMayor), NMayor = N.

/*
comprime(+Lista, -ListaR).
    es cierto si ListaR unifica con una lista con
    el siguiente formato:
    comprime([a,a,b,b,b,c,d,d,a], R)
    R = [(a,2), (b,3), (c,1), (d,2), (a,1)]
*/

comprime([], []).
comprime([Elem], [(Elem, 1)]).
comprime([Cab, Cab|Resto], [(Elem, N2)|R]) :- comprime([Cab|Resto], [(Elem, N)|R]), N2 is N + 1.
comprime([Cab1, Cab2|Resto], [(Cab1, 1)|R]) :- Cab1 \= Cab2, comprime([Cab2|Resto], R).