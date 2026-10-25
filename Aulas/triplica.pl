tri([],[]).
tri([A|As],[A,A,A|X]):- tri(As,X).