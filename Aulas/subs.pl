subs(_,_,[],[]).
subs(A,B,[A|X],[B|Z]) :- subs(A,B,X,Z).
subs(A,B,[E|Es],[E|X]) :- subs(A,B,Es,X).