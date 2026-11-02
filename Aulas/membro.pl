membro(A,[A|_]).
membro(A,[_|X]) :- membro(A,X).