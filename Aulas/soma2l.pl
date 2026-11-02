soma2l(L,[],L).
soma2l([],L,L).
soma2l([A|As],[B|Bs],[R|Rs]) ;- R is A + B, soma2l(As,Bs,Rs).