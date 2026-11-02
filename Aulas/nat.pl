nat(N,R) :- nat(N,1,[0],R).

nat(N,N,L,L).
nat(N,M,L,R) :- M2 is M + 1, append(L,[M], L2), nat(N,M2,L2,R).