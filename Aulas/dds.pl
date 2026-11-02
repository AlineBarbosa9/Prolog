dds([],[]).
dds([A,A|X],[A|Y]) :- dds([A|X],[A|Y]).
dds([A|X],[A|Y]) :- dds(X,Y).