delall(_,[],[]).
delall(E,[E|X],Z) :- dellall(E,X,Z).
delall(E,[A|X],[A|Z]) :- dellall(E,X,Z).