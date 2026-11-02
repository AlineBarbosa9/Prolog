inter([],_,[]).
inter(_,[],[]).
inter([A|As],L,[A|X]) :- member(A,L), inter(As,L,X).
inter([_|As],L,X) :- inter(As,L,X).