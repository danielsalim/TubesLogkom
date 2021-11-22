:- dynamic(inventory/1).

inventory :- inventory(Inv), displayInventory(Inv).

displayInventory([]) :-
    write('Your inventory (0/100)'), nl,
    write('inventory kosong').
displayInventory([Name, Count]) :-
    write('Your inventory ('), write(Inv), write('/100)'), nl,
    write(Count), write(' '), write(Name).