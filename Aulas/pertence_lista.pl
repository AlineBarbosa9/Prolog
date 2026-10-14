pertence(X, [X|_]).

pertence(X, [_|Cauda]) :-
    pertence(X, Cauda).
