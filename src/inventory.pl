item('hehe').

:- dynamic(inventory/1).

inventory :- inventory(Inv), 
    itemCount(Inv, Total),
    (Total > 0 ->
    write('Your inventory ('), write(Total), write('/100):'), nl
    ; write('You don\'t have any items.')),
    displayInventory(Inv).

displayInventory([]) :- !.
displayInventory([[Name, Count]|T]) :-
    write(Count), write(' '), write(Name), nl, displayInventory(T).

/* itemCount(X, Y) berarti dalam inventory X terdapat Y item */
itemCount([], 0).
itemCount([[_, Count]|T], Total) :-
    itemCount(T, Temp),
    Total is Count + Temp.

/* drop(X, Y) membuang X sebanyak Y dari inventory jika ada */
drop(Item) :- drop(Item, 1).
drop(_, Count) :- Count =< 0, !, write('Item count must be more than 0'), fail.
drop(Item, Count) :-
    inventory(Inv),
    (member([Item, CountInv], Inv) ->
        (CountInv > Count ->
            NewCount is CountInv - Count,
            retract(inventory(Inv)),
            delete(Inv, [Item, CountInv], TempInv),
            append(TempInv, [[Item, NewCount]], NewInv),
            asserta(inventory(NewInv))
        ; CountInv =:= Count ->
            retract(inventory(Inv)),
            delete(Inv, [Item, CountInv], NewInv),
            asserta(inventory(NewInv))
        ;
            write('You do not have that many item in your inventory')
        )
    ;
        write('You do not have that item in your inventory')
    ).
     
/* addItem(X, Y) menambahkan X sebanyak Y ke dalam inventory */
addItem(_, Count) :- Count =< 0, !, write('Item count must be more than 0'), fail.
addItem(Item, Count) :-
    item(Item),
    inventory(Inv),
    itemCount(Inv, IC),
    (Count + IC =< 100 ->
        (member([Item, CountInv], Inv) ->
            NewCount is CountInv + Count,
            retract(inventory(Inv)),
            delete(Inv, [Item, CountInv], TempInv),
            append(TempInv, [[Item, NewCount]], NewInv),
            asserta(inventory(NewInv ))
        ;
            retract(inventory(Inv)),
            append(Inv, [[Item, Count]], NewInv),
            asserta(inventory(NewInv))
        )
    ;
        write('Failed to add item, inventory full')
    ).