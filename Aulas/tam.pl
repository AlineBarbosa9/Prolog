tam([],0).
tam([A|As],R) :- tam(As,R2), R is R2 + 1.