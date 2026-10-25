eltpos(1,[E|_],E).
eltpos(N,[_|X],R) :- N2 is N-1, eltpos(N2,X,R).