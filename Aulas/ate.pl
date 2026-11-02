ate(E,[E|_],[E]).
ate(E,[A|As],[A|X]) :- ate(E,As,X).