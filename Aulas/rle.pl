rle([],[]).
rle([C|Cs],R) :- rle(Cs,C,1,R).

rle([],C,N,[(C,N)]).
rle([C|Cs],C,N,R) :- N2 is N + 1, rle(Cs,C,N2,R).
rle([A|X],C,N,[(C,N)],R) :- rle(X,A,1,R).