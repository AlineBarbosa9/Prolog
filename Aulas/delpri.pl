delpri(_,[],[]).
delpri(E,[E|X],X).
delpri(E,[A|X],[A|Z]) :- delpri(E,X,Z).
