
pai(joao, maria).
pai(maria, pedro).
pai(pedro, lucas).

avo(Avo, Neto) :-
    pai(Avo, Pai),
    pai(Pai, Neto).
