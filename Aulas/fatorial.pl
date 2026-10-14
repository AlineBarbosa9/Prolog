fatorial(0, 1).

fatorial(N, Resultado) :-
    N > 0,
    N1 is N - 1,
    fatorial(N1, Resultado1),
    Resultado is N * Resultado1.
