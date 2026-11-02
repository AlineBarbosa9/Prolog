menores(_,[],[]).
menores(E,[A|As],[A|X]) :- A < E, menores(E,As,X).
menores(E,[_|As],X) :- menores(E,As,X).