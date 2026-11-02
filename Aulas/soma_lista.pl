soma_lista([],0).
soma_lista([A|As],R) :- soma_lista(As,R2), R is R2 + A.