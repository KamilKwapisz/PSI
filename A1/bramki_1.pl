% opis działania bramek
brAnd(0,0,0).
brAnd(1,0,0).
brAnd(0,1,0).
brAnd(1,1,1).

brOr(0,0,0).
brOr(1,0,1).
brOr(0,1,1).
brOr(1,1,1).

brXor(0,0,0).
brXor(1,0,1).
brXor(0,1,1).
brXor(1,1,0).
%opis układu

uklad(A, B, C, D, E, F, G, H, I) :-
    brOr(A, B, E),
    brAnd(C, D, F),
    brXor(B, D, G),
    brAnd(F, G, H),
    brXor(H, E, I).



uklad(0, 0, 0, 0, _, _, _, _, I).
uklad(0, 0, 0, 1, _, _, _, _, I).
uklad(0, 0, 1, 0, _, _, _, _, I).
uklad(0, 0, 1, 1, _, _, _, _, I).
uklad(0, 1, 0, 0, _, _, _, _, I).
uklad(0, 1, 0, 1, _, _, _, _, I).
uklad(0, 1, 1, 0, _, _, _, _, I).
uklad(0, 1, 1, 1, _, _, _, _, I).
uklad(1, 0, 0, 0, _, _, _, _, I).
uklad(1, 0, 0, 1, _, _, _, _, I).
uklad(1, 0, 1, 0, _, _, _, _, I).
uklad(1, 0, 1, 1, _, _, _, _, I).
uklad(1, 1, 0, 0, _, _, _, _, I).
uklad(1, 1, 0, 1, _, _, _, _, I).
uklad(1, 1, 1, 0, _, _, _, _, I).
uklad(1, 1, 1, 1, _, _, _, _, I).