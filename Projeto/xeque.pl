/*
 * Projeto 2: Esta em xeque? (Prolog)
 * Nome: Aline Barbosa Vidal RA: 10721348
 *
 * Pecas: r=rei d=dama t=torre b=bispo c=cavalo p=peao
 * Minuscula = preta (topo), MAIUSCULA = branca (base).
 *
 * Como executar:
 *   $ swipl -q -s xeque.pl
 *   chess(["tcbdrbct","pppppppp",8,8,8,8,"PPPPPPPP","TCBDRBCT"]).
 *   nil
 */

% imprime t se o rei branco esta em xeque, senao nil
chess(Linhas) :-
    monta(Linhas, Tab),
    (   xeque(Tab) -> write(t) ; write(nil) ),
    nl.

% ---------- Tabuleiro (casa vazia = '.') ----------

monta([], []).
monta([L|Ls], [R|Rs]) :- linha(L, R), monta(Ls, Rs).

linha(N, Casas) :- integer(N), !, vazias(N, Casas).
linha(S, Casas) :- string_chars(S, Cs), expande(Cs, Casas).

expande([], []).
expande([C|Cs], Casas) :-
    digito(C, N), !,
    vazias(N, V),
    junta(V, Resto, Casas),
    expande(Cs, Resto).
expande([C|Cs], [C|Resto]) :- expande(Cs, Resto).

digito('1', 1). digito('2', 2). digito('3', 3). digito('4', 4).
digito('5', 5). digito('6', 6). digito('7', 7). digito('8', 8).

vazias(0, []) :- !.
vazias(N, ['.'|T]) :- N1 is N - 1, vazias(N1, T).

junta([], L, L).
junta([X|Xs], Ys, [X|Zs]) :- junta(Xs, Ys, Zs).

% ---------- Acesso ao tabuleiro ----------

elemento(1, [X|_], X) :- !.
elemento(I, [_|T], X) :- I > 1, I1 is I - 1, elemento(I1, T, X).

% falha se (L,C) estiver fora do tabuleiro
casa(Tab, L, C, P) :-
    L >= 1, L =< 8, C >= 1, C =< 8,
    elemento(L, Tab, Linha),
    elemento(C, Linha, P).

% posicao do rei branco
rei(Tab, L, C) :- rei_linha(Tab, 1, L, C).

rei_linha([Linha|Resto], I, L, C) :-
    (   rei_coluna(Linha, 1, J) -> L = I, C = J
    ;   I1 is I + 1, rei_linha(Resto, I1, L, C)
    ).

rei_coluna(['R'|_], J, J) :- !.
rei_coluna([_|Ps], J, C) :- J1 is J + 1, rei_coluna(Ps, J1, C).

% ---------- Deslocamentos (linha, coluna) ----------

reta(-1, 0).  reta(1, 0).  reta(0, -1).  reta(0, 1).
diag(-1, -1). diag(-1, 1). diag(1, -1).  diag(1, 1).

vizinho(DL, DC) :- reta(DL, DC).
vizinho(DL, DC) :- diag(DL, DC).

cavalo(-2, -1). cavalo(-2, 1). cavalo(-1, -2). cavalo(-1, 2).
cavalo(1, -2).  cavalo(1, 2).  cavalo(2, -1).  cavalo(2, 1).

% peao preto captura para baixo: fica uma linha acima do rei
peao(-1, -1). peao(-1, 1).

% pecas que atacam em reta e em diagonal
ataca_reta(t). ataca_reta(d).
ataca_diag(b). ataca_diag(d).

% ---------- Deteccao de xeque ----------

xeque(Tab) :- rei(Tab, L, C), ameaca(Tab, L, C), !.

ameaca(Tab, L, C) :- peao(DL, DC),    ocupa(Tab, L, C, DL, DC, p).
ameaca(Tab, L, C) :- cavalo(DL, DC),  ocupa(Tab, L, C, DL, DC, c).
ameaca(Tab, L, C) :- vizinho(DL, DC), ocupa(Tab, L, C, DL, DC, r).
ameaca(Tab, L, C) :- reta(DL, DC), raio(Tab, L, C, DL, DC, P), ataca_reta(P).
ameaca(Tab, L, C) :- diag(DL, DC), raio(Tab, L, C, DL, DC, P), ataca_diag(P).

% a casa (L+DL, C+DC) contem a peca Peca
ocupa(Tab, L, C, DL, DC, Peca) :-
    L1 is L + DL, C1 is C + DC,
    casa(Tab, L1, C1, Peca).

% primeira peca encontrada andando na direcao (DL, DC)
raio(Tab, L, C, DL, DC, P) :-
    L1 is L + DL, C1 is C + DC,
    casa(Tab, L1, C1, Q),
    (   Q == '.' -> raio(Tab, L1, C1, DL, DC, P) ; P = Q ).