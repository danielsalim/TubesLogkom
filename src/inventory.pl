/* DEFINISI INVENTORY */

:- dynamic(reservedSpace/1).

inventory(X) :- 
    reservedSpace(X).

:- dynamic(storeditem/2).

inInventory(X) :- 
    storeditem(X,Y),
    Y > 0.

save_inventory(X) :- 
    (
        inventory(Reserved), Reserved < 100 ->

        (
            storeditem(X, Y) ->(
                retract(storeditem(X, Y)),
                NewAmount is Y + 1,
                asserta(storeditem(X, NewAmount)),
                retract(reservedSpace(Reserved)),
                NewAmount is Reserved + 1, 
                asserta(reservedSpace(NewAmount))
                
            ); newItem(X, Reserved)

        ); write('Your inventory is full. Throw some useless items. Or Sell? perhaps.'), nl

    ).

newItem(Var, Used) :-
    asserta(storeditem(Var, 1)),
    retract(reservedSpace(Used)),
    NewAmount is Used + 1,
    asserta(reservedSpace(NewAmount)), 
    write('You have added new item.'), nl.

itemCounter(Items, Counter) :-
    storeditem(Items, Count).
