menor([A|L],R) :- menor(L,A,R).

menor([],M,M).
menor([A|X],M,R) :- A < M, menor(X,A,R).
menor([_|X],M,R) :- menor(X,M,R).