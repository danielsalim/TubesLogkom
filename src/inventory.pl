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
                Z is Y + 1,
                asserta(storeditem(X, Z)),
                retract(reservedSpace(Reserved)),
                NewAmount is Reserved + 1, 
                asserta(reservedSpace(NewAmount))
                
            ); newItem(X, Reserved)

        )
        
        ; write('Your inventory is full. Throw some useless items. Or Sell? perhaps.'), nl

    ).

save_inventory2(X, Amount) :- 
    (
        inventory(Reserved), Reserved < 100 ->

        (
            storeditem(X, Y) ->(
                retract(storeditem(X, Y)),
                Z is Y + Amount,
                asserta(storeditem(X, Z)),
                retract(reservedSpace(Reserved)),
                NewAmount is Reserved + Amount, 
                asserta(reservedSpace(NewAmount))
                
            ); newItem(X, Reserved)

        )
        
        ; write('Your inventory is full. Throw some useless items. Or Sell? perhaps.'), nl

    ).

newItem(Var, Used) :-
    asserta(storeditem(Var, 1)),
    retract(reservedSpace(Used)),
    NewAmount is Used + 1,
    asserta(reservedSpace(NewAmount)), 
    write('You have added new item.'), nl.

itemCounter(Items, Counter) :-
    storeditem(Items, Counter).

/* akses user interface untuk inventory, untuk delete harus ketik nama item */

inv :-

    write('****************************************************'), nl, nl,

    write('___ _   ___     _______ _   _ _____ ___  ______ '), nl,
    write('|_ _|\\ |\\ \\  / | ____|\\ | |_   _/ _\\|  _\\\\ / /'), nl,
    write('| | | \\| |\\\\ //|  _| | \\| | | || | || |_)\\ V /'), nl, 
    write('| | | |\\ |\\ V /| |___| |\\ | | || |_||  _ < | |'), nl,  
    write('|___|_|\\_| \\_/ |_____|_|\\_| |_|\\___/|_| \\_\\|_|'), nl, nl,

    write('*****************************************************'), nl, nl,

    write('---------------------------------------'), nl,
    write('|?|   What do you want to do here?  |?|'), nl,
    write('|-|1. See Inventory                 |-|'), nl,
    write('|-|2. Delete Item                   |-|'), nl,
    write('---------------------------------------'), nl,

    write('I want to...'), nl, nl,

    inventory(UsedItems), 

    read_integer(UserChoice), nl,
    (
        UserChoice = 1 -> (
            show_inventory
        );

        UserChoice = 2 -> (
            write('Type your item name: '), nl,
            read(UserInput), nl, nl,
            delete_inventory(UserInput, UsedItems) 
            
        );

    !).
    
show_inventory :-

    write('Used Space: '), 
    inventory(X), write(X), write('/'), write('100.'), nl, nl,
    write('                        INVENTORY ITEMS                          '), nl, nl,
    forall((inInventory(Items)),(itemCounter(Items, Count), write(Items), write(' : '), write(Count), write(' count'), nl)), 
    nl.

delete_inventory(X, Used) :-

    write('Are you sure you want to delete this item?'), nl, nl,
    read(Users), nl,
    (
        Users = yes -> (
            storeditem(X, Y) -> (
                retract(storeditem(X, Y)),
                Z is Y - 1,
                asserta(storeditem(X, Z)),
                retract(reservedSpace(Used)),
                NewAmount is Used - 1,
                asserta(reservedSpace(NewAmount)),
                write('You have deleted this item'), nl
            ); write('You do not own this item.'), nl, nl
        )
        ;

        Users = no ->(
            inv
        )
        ;
    !).
