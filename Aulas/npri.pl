npri(0,_,[]).
npri(N,[A|As],[A|X]) :- N2 is N - 1, npri(N2,As,X).