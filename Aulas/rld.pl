rpt(_,0,[]).
rpt(C,N,[C|X]) :- N2 is N - 1, rpt(C,N2,X).

rld([],[]).
rld([(C,N)|X],R) :- rpt(C,N,L), rld(X,T), append(L,T,R).