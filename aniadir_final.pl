/*
    aniadir_final(+Elem, +Lista, -ListaR)
        es cierto cuando ListaR
        unifica con una lista que contiene los mismos elementos que
        Lista con el elemento Elem ñadido al final.
*/ 

aniadir_final(Elem, [], [Elem]).
aniadir_final(Elem, [Cabeza|Resto], [Cabeza|R]) :- aniadir_final(Elem, Resto, R). % P(n-1) -> P(n)