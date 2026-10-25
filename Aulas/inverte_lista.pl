inv([],[]).
inv([A|X],R) :- 
    inv(X,T),
    append(T,[A],R).