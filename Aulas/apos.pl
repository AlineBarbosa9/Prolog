apos(E,[E|X],X).
apos(E,[_|As],R) :- apos(E,As,R).