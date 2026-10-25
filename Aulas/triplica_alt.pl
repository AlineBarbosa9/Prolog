trialt([],[]).
trialt([A],[A,A,A]).
trialt([A,B|X],[A,A,A,B|Z]) :- trialt(X,Z).