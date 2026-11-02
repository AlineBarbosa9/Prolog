deldup([],[]).
deldup([A|X],[A|Y]) :- not(member(A,X)), deldup(X,Y).
deldup([_|X],Y) :- deldup(X,Y).