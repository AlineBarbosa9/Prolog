idade(ana, 20).
idade(bruno, 16).
idade(carla, 25).

maior_de_idade(Pessoa) :-
    idade(Pessoa, Idade),
    Idade >= 18.
