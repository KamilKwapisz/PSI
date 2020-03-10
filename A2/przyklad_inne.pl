%opis grafu
currency(pln,eur,1).
currency(pln,usd,2).
currency(pln,fjd,3).
currency(usd,eur,1).
currency(hrk,eur,6).
currency(czk,usd,3).
currency(bob,usd,4).
currency(eek,czk,7).
currency(bob,hrk,11).
currency(gnf,hrk,9).
currency(fjd,eek,5).
currency(xaf,eek,13).
currency(xaf,fjd,4).
currency(php,xaf,9).
currency(lsl,xaf,11).
currency(lsl,cad,16).
currency(cad,isk,1).
currency(php,isk,21).
currency(gnf,php,30).
currency(gnf,gel,7).
currency(isk,gel,9).


% graf nieskierowany 
neighborroom(X, Y,P) :- 
    currency(X, Y,P).
neighborroom(X, Y,P) :-
    currency(Y, X,P). 

%lista węzłów zakazanych 
avoid([php,fjd]).

go(Here,There) :- 
    route(Here, There,[Here],0). 

invertPrint([H|T]) :-
    invertPrint(T),
    write(H),
    write(" ").

invertPrint([]).

%rekurencyjne poszukiwanie drogi 
route(Exit,Exit,VisitedRooms, CurrentLength) :- 
    member(usd,VisitedRooms),
    invertPrint(VisitedRooms),
    write(CurrentLength),
    nl.




route(Room,Way_out,VisitedRooms, CurrentLength) :- 
    neighborroom(Room,NextRoom,X), 
    avoid(DangerousCurrency), 
    \+ member(NextRoom,DangerousCurrency),  
    \+ member(NextRoom,VisitedRooms),
    NewLength is CurrentLength + X,
    route(NextRoom,Way_out,[NextRoom|VisitedRooms], NewLength). 

%sprawdzenie, czy element występuje w liście 
member(X,[X|_]).
member(X,[_|H]) :- 
    member(X,H).