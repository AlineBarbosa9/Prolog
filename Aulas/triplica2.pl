tri2([],[]).
tri2([A],[A,A,A]).
tri2([A|X],[A,A,A|R]):- aux(X,R).

aux([],[]).
aux([A],[A,A,A]).
aux([A|As],[A|X]) :- aux(As,X).

