%opis grafu
gallery(entry,monsters).
gallery(entry,fountain).
gallery(fountain,hell).
gallery(fountain,food).
gallery(exit,gold_treasure).
gallery(fountain,mermaid).
gallery(robbers,gold_treasure).
gallery(fountain,robbers).
gallery(food,gold_treasure).
gallery(mermaid,exit).
gallery(monsters,gold_treasure).

%graf nieskierowany 
neighborroom(X, Y) :- 
    gallery(X, Y).
neighborroom(X, Y) :- 
    gallery(Y, X).

member(X,[_|H]) :- 
    member(X,H).
member(X,[X|_]).

%lista węzłów zakazanych
avoid([monsters,robbers]).

%rekurencyjne poszukiwanie drogi
route(Exit,Exit,VisitedRooms) :-
    member(gold_treasure,VisitedRooms), 
    write(VisitedRooms), nl.

route(Room,Way_out,VisitedRooms) :-
    neighborroom(Room,NextRoom),
    avoid(DangerousRooms),
    \+ member(NextRoom,DangerousRooms),
    \+ member(NextRoom,VisitedRooms),
    write(Room), nl,
    route(NextRoom,Way_out,[NextRoom|VisitedRooms]).

go(Here,There) :- route(Here, There,[Here]).

%sprawdzenie, czy element występuje w liście

