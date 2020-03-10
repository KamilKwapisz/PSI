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

len(entry,monsters, 4).
len(entry,fountain, 1).
len(fountain,hell, 3).
len(fountain,food, 2).
len(exit,gold_treasure, 2).
len(fountain,mermaid, 6).
len(robbers,gold_treasure, 3).
len(fountain,robbers, 4).
len(food,gold_treasure, 2).
len(mermaid,exit, 6).
len(monsters,gold_treasure, 7).

length(X, Y, Length) :-
    len(X, Y, Length),
    neighborroom(X, Y).
length(X, Y, Length) :-
    len(Y, X, Length),
    neighborroom(Y, X).
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
	reverse(VisitedRooms), nl,
	measure(VisitedRooms, 0.0), nl.


route(Room,Way_out,VisitedRooms) :-
    neighborroom(Room,NextRoom),
    avoid(DangerousRooms),
    \+ member(NextRoom,DangerousRooms),
    \+ member(NextRoom,VisitedRooms),
    route(NextRoom,Way_out,[NextRoom|VisitedRooms]).

go(Here,There) :- route(Here, There, [Here]).


 measure([_],RoadLength) :-
	format("Długość trasy: ~0f",RoadLength), nl.
 measure([H|T], RoadLength) :- 
    first(T, NextElement),
    length(H, NextElement, L),
    NewLength is RoadLength + L,
    measure(T, NewLength).

measure([]).


reverse([H|T]) :-
    reverse(T),
    write(H),
    write(" ").

reverse([]).

first([E|_], E).


    

%sprawdzenie, czy element występuje w liście

