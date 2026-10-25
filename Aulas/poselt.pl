poselt(E,L,Pos) :- poselt(E,L,1,Pos).
poselt(E,[E|_],N,N).
poselt(E,[A|As],N,R) :- N2 is N+1, poselt(E,As,N2,R).