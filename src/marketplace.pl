marketplace :- 
 
    write('************************************************************************************************************'), nl, nl,

    write(' .d88b.  db      d8888b.      .88b  d88.  .d8b.  d8b   db Cb .d8888.      .d8888. db   db  .d88b.  d8888b.  '), nl,
    write('.8P  Y8. 88      88  `8D      88 YbdP 88 d8" 8b 888o  88 `D 88"  YP      88"  YP 88   88 .8P  Y8. 88  `8D   '), nl,
    write('88    88 88      88   88      88  88  88 88ooo88 88V8o 88  "  8bo.        `8bo.   88ooo88 88    88 88oodD   '), nl,
    write('88    88 88      88   88      88  88  88 88~~~88 88 V8o88      Y8b.        `Y8b. 88~~~88 88    88 88~~~      '), nl,
    write('`8b  d8" 88booo. 88  .8D      88  88  88 88   88 88  V888    db   8D      db   8D 88   88 `8b  d8 88        '), nl,
    write(' `Y88P"  Y88888P Y8888D       YP  YP  YP YP   YP VP   V8P    `8888Y      `8888Y YP   YP   Y88P"  88         '), nl, nl,

    write('************************************************************************************************************'), nl, nl,

    write('              _,._           '), nl,
    write(' .||,       /_ _\\           '), nl,
    write('\\.`",/     |\'L\'| |        '), nl,
    write('= ,. =     | -,| L          '), nl,
    write('/ || |    ,-"\"/,"`.         '), nl,
    write('  ||     ,"   `,,. `.        '), nl,
    write('  ,|____," ``  " \\| |       '), nl,
    write('  (3|\\    _/|/"   _| |      '), nl,
    write('  ||/,-"  | >-" _,\\         '), nl,
    write('  ||`      ==\\ ,-"`  ,``    '), nl,
    write('  ||       |  V\\ ,||        '), nl,
    write('  ||       |    |` ||        '), nl,
    write('  ||       |    |   \\       '), nl,
    write('  ||       |    |    \\      '), nl,
    write('  ||       |     \\   \\     '), nl,
    write('  ||       |      \\_,-"     '), nl,
    write('  ||       |___,,--")_\\     '), nl,
    write('  ||         |_|   ccc/      '), nl,
    write('  ||        ccc/             '), nl,
    write('  ||                         '), nl,
                
    write('---------------------------------------'), nl,
    write('|?|   What do you want to do here?  |?|'), nl,
    write('|-|1. Buy items                     |-|'), nl,
    write('|-|2. Sell items                    |-|'), nl,
    write('|-|3. I want to leave               |-|'), nl,
    write('|-|4. See guide                     |-|'), nl,
    write('|-|5. I want to talk                |-|'), nl,
    write('---------------------------------------'), nl,

    write('I want to...'), nl, nl,

    read_integer(User), nl,
    (
        User = 1 -> (
            show_panel_buy
        );

        User = 2 -> (
            show_panel_sell
        );

        User = 3 -> (
            leavemarket
        );

        User = 4 -> (
            help_market
        );

        User = 5 -> (
            alce_msg
        );

    !).

show_panel_buy :- 
    write('***********************************'), nl,
    write('*1. Coconut Seeds: 50 gold        *'), nl,
    write('*2. Tomato Seeds: 100 gold        *'), nl,
    write('*3. Mango Seeds: 250 gold         *'), nl,
    write('*4. Strawberry Seeds: 500 gold    *'), nl,
    write('*5. Baobab Seeds: 1000 gold       *'), nl,
    write('*6. Corn Bait: 50 gold            *'), nl,
    write('*7. Basic Bait: 100 gold          *'), nl,
    write('*8. Anchovy Bait: 250 gold        *'), nl,
    write('*9. Squid Bait: 500 gold          *'), nl,
    write('*10. Magic Bait: 1000 gold        *'), nl,
    write('*11. Chicken: 200 gold            *'), nl,
    write('*12. Goat: 500 gold               *'), nl,
    write('*13. Sheep: 1000 gold             *'), nl,
    write('*14. Cow: 1500 gold               *'), nl,
    write('*15. Horse: 2000 gold             *'), nl,
    write('*16. Upgraded Fishing Rod         *'), nl,
    write('*17. Upgraded Bucket              *'), nl,
    write('*18. Upgraded Shovel              *'), nl,
    write('***********************************'), nl,

    /* untuk inisiasi variabel terlebih dahulu */
    gold(_, Total), nl , write('Your gold: '), write(Total), nl,
    level_fishing(_, Lvlfish), 
    level_farming(_, Lvlfarm),
    level_rancher(_, Lvlranch),

    /* item specialty */ 
    fishingrod(_, LvlEqFish, PriceFish), 
    shovel(_, LvlEqFarm, PriceFarm), 
    bucket(_, LvlEqRanch, PriceRanch),

    write('Show me what you have!'), nl,


    read_integer(Item), nl,

    (
        Item = 1 -> (
            (
                Lvlfarm >= 1 -> (
                    Total >= 50 -> (
                        NewAmount is Total - 50,
                        update_amount(NewAmount),
                        save_inventory(coconut_seeds),
                        write('You are proven worthy to wield these coconut seeds.'), nl, marketplace
                    ); write('You are not worthy to wield these coconut seeds.'), nl, marketplace
                ); level_req
            )
        );

        Item = 2 -> (
            (
                Lvlfarm >= 2 -> (
                    Total >= 100 ->(
                        NewAmount is Total - 100,
                        update_amount(NewAmount),
                        save_inventory(tomato_seeds),
                        write('You are proven worthy to wield these chocolate seeds.'), nl, marketplace
                    ); write('You are not worthy to wield these chocolate seeds.'), nl, marketplace
                ); level_req
            )
        );

        Item = 3 -> (
            (
                Lvlfarm >= 3 -> (
                    Total >= 250 ->(
                        NewAmount is Total - 250,
                        update_amount(NewAmount),
                        save_inventory(mango_seeds),
                        write('You are proven worthy to wield these mango seeds.'), nl, marketplace
                    ); write('You are not worthy to wield these mango seeds.'), nl, marketplace
                ); level_req
            )
        );

        Item = 4 -> (
            (
                Lvlfarm >= 4 -> (
                    Total >= 500 ->(
                        NewAmount is Total - 500,
                        update_amount(NewAmount),
                        save_inventory(strawberry_seeds),
                        write('You are proven worthy to wield these blueberry seeds.'), nl, marketplace
                    ); write('You are not worthy to wield these blueberry seeds.'), nl, marketplace
                ); level_req
            )
        );

        Item = 5 -> (
            (
                Lvlfarm >= 5 -> (
                    Total >= 1000 ->(
                        NewAmount is Total - 1000,
                        update_amount(NewAmount),
                        save_inventory(baobab_seeds),
                        write('You are proven worthy to wield these baobab seeds.'), nl, marketplace
                    ); write('You are not worthy to wield these baobab seeds.'), nl, marketplace
                ); level_req
            )
        );

        Item = 6 -> (
            (
                Lvlfish >= 1 -> (
                    Total >= 50 ->(
                        NewAmount is Total - 50,
                        update_amount(NewAmount),
                        save_inventory(corn),
                        write('You are proven worthy to wield these corn bait.'), nl, marketplace
                    ); write('You are not worthy to wield these corn bait.'), nl, marketplace
                ); level_req
            )
        );

        Item = 7 -> (
            (
                Lvlfish >= 2 ->(
                    Total >= 100 -> (
                        NewAmount is Total - 100,
                        update_amount(NewAmount),
                        save_inventory(basic),
                        write('You are proven worthy to wield these basic bait.'), nl, marketplace
                    ); write('You are not worthy to wield these basic bait.'), nl, marketplace
                ); level_req
            )
        );

        Item = 8 -> (
            (
                Lvlfish >= 3 -> (
                    Total >= 250 ->(
                        NewAmount is Total - 250,
                        update_amount(NewAmount),
                        save_inventory(anchovy),
                        write('You are proven worthy to get this anchovy_bait.'), nl, marketplace
                    ); write('You are not worthy to get this anchovy_bait.'), nl, marketplace
                ); level_req
            )
        );

        Item = 9 -> (
            (
                Lvlfish >= 4 -> (
                    Total >= 500 ->(
                        NewAmount is Total - 500,
                        update_amount(NewAmount),
                        save_inventory(squid),
                        write('You are proven worthy to get this squid bait.'), nl, marketplace
                    ); write('You are not worthy to get this squid bait.'), nl, marketplace
                ); level_req
            )
        );

        Item = 10 -> (
            (
                Lvlfish >= 5 -> (
                    Total >= 1000 ->(
                        NewAmount is Total - 1000,
                        update_amount(NewAmount),
                        save_inventory(magic),
                        write('You are proven worthy to get this magic bait.'), nl, marketplace
                    ); write('You are not worthy to get this magic bait.'), nl, marketplace
                ); level_req
            )
        );

        Item = 11 -> (
            (
                Lvlranch >= 1 -> (
                    Total >= 200 ->
                        NewAmount is Total - 200,
                        update_amount(NewAmount),
                        save_inventory(chicken),
                        write('You are proven worthy to get the chicken.'), nl, marketplace
                    ; write('You are not worthy to get the chicken.'), nl, marketplace
                ); level_req
            )
        );

        Item = 12 -> (
            (
                Lvlranch >= 2 -> (
                    Total >= 500 ->
                        NewAmount is total - 500,
                        update_amount(NewAmount),
                        save_inventory(goat),
                        write('You are proven worthy to get the goat.'), nl, marketplace
                    ; write('You are not worthy to get the goat.'), nl, marketplace
                ); level_req
            )
        );

        Item = 13 -> (
            (
                Lvlranch >= 3 -> (
                    Total >= 1000 ->(
                        NewAmount is total - 1000,
                        update_amount(NewAmount),
                        save_inventory(sheep),
                        write('You are proven worthy to get the sheep.'), nl, marketplace
                    ); write('You are not worthy to get the sheep.'), nl, marketplace
                ); level_req
            )
        );

        Item = 14 -> (
            (
                Lvlranch >= 4 -> (
                    Total >= 1500 ->(
                        NewAmount is total - 1500,
                        update_amount(NewAmount),
                        save_inventory(cow),
                        write('You are proven worthy to get the cow.'), nl, marketplace
                    ); write('You are not worthy to get the cow.'), nl, marketplace
                ); level_req
            )
        );

        Item = 15 -> (
            (
                Lvlranch >= 5 -> (
                    Total >= 2000 ->(
                        NewAmount is Total - 2000,
                        update_amount(NewAmount),
                        save_inventory(horse),
                        write('You are proven worthy to get the horse.'), nl, marketplace
                    ); write('You are not worthy to get the horse.'), nl, marketplace
                ); level_req
            )
        );

        Item = 16 -> (
            LevelReq is LvlEqFish + 1,
            Lvlfish  >= LevelReq, LvlEqFish =< 4 -> (
                NewPrice is PriceFish + 300,
                Total >= NewPrice -> (
                    Price is Total - NewPrice,
                    update_fishing(LevelReq, NewPrice),
                    update_amount(Price),
                    write('You have succesfully upgraded your item.'), nl, nl, marketplace
                ); write('Not enough gold. Come back later.'), nl, marketplace
            ); insufficient
        );

        Item = 17 -> (
            LevelReq is LvlEqFarm + 1,
            Lvlfarm  >= LevelReq, LvlEqFarm =< 4 -> (
                NewPrice is PriceFarm + 300,
                Total >= NewPrice ->(
                    Price is Total - NewPrice,
                    update_farm(LevelReq, NewPrice),
                    update_amount(Price),
                    write('You have succesfully upgraded your item.'), nl, nl, marketplace
                ); write('Not enough gold. Come back later.'), nl, marketplace
            ); insufficient
        );

        Item = 18 -> (
            LevelReq is LvlEqRanch + 1,
            Lvlranch  >= LevelReq, LvlEqRanch =< 4 -> (
                NewPrice is PriceRanch + 300,
                Total >= NewPrice ->(
                    Price is Total - NewPrice,
                    update_ranch(LevelReq, NewPrice),
                    update_amount(Price),
                    write('You have succesfully upgraded your item.'), nl, nl, marketplace
                ); write('Not enough gold. Come back later.'), nl, marketplace
            ); insufficient
        );


    !).



/* PANEL BELI */

/* show_panel_sell :- */

show_panel_sell :-

    gold(_, Total),

    inventory(Space),
    show_inventory,

    write('Anything you want to sell?'), nl,
    read(UserInputs), nl,
    write('Enter Amount: '), nl,
    read_integer(Amounts), nl,
    (
        (
            UserInputs = coconut -> (
                storeditem(coconut, X), !,  X >= Amounts -> (
                    sell_items(coconut, Space, Amounts), nl, nl,
                    write('You gained 70 gold per item'), nl,
                    Totalgold is 70 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold),
                !);
            !); 

            UserInputs = tomato -> (
                storeditem(tomato, X), !,  X >= Amounts -> (
                    sell_items(tomato, Space, Amounts), nl, nl,
                    write('You gained 125 gold per item'), nl,
                    Totalgold is 125 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = mango -> (
                storeditem(mango, X), !,  X >= Amounts -> (
                    sell_items(mango, Space, Amounts), nl, nl,
                    write('You gained 275 gold per item'), nl,
                    Totalgold is 275 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = strawberry -> (
                storeditem(strawberry, X), !,  X >= Amounts -> (
                    sell_items(strawberry, Space, Amounts), nl, nl,
                    write('You gained 590 gold per item'), nl,
                    Totalgold is 590 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = baobab -> (
                storeditem(baobab, X), !,  X >= Amounts -> (
                    sell_items(baobab, Space, Amounts), nl, nl,
                    write('You gained 1190 gold per item'), nl,
                    Totalgold is 1190 * Amounts,
                    NewGold is Total + totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = sapu -> (
                storeditem(sapu, X), !,  X >= Amounts -> (
                    sell_items(sapu, Space, Amounts), nl, nl,
                    write('You gained 60 gold per item'), nl,
                    Totalgold is 60 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = lele -> (
                storeditem(lele, X), !,  X >= Amounts -> (
                    sell_items(lele, Space, Amounts), nl, nl,
                    write('You gained 140 gold per item'), nl,
                    Totalgold is 140 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = cupang -> (
                storeditem(cupang, X), !,  X >= Amounts -> (
                    sell_items(cupang, Space, Amounts), nl, nl,
                    write('You gained 320 gold per item'), nl,
                    Totalgold is 320 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = tuna -> (
                storeditem(tuna, X), !,  X >= Amounts -> (
                    sell_items(tuna, Space, Amounts), nl, nl,
                    write('You gained 790 gold per item'), nl,
                    Totalgold is 790 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            
            UserInputs = salmon -> (
                storeditem(salmon, X), !,  X >= Amounts -> (
                    sell_items(salmon, Space, Amounts), nl, nl,
                    write('You gained 1550 gold per item'), nl,
                    Totalgold is 1550 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

                /* ranching */ 

            UserInputs = egg -> (
                storeditem(egg, X), !,  X >= Amounts -> (
                    sell_items(egg, Space, Amounts), nl, nl,
                    write('You gained 60 gold per item'), nl,
                    Totalgold is 60 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = milk -> (
                storeditem(milk, X), !,  X >= Amounts -> (
                    sell_items(milk, Space, Amounts), nl, nl,
                    write('You gained 100 gold per item'), nl,
                    Totalgold is 100 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold),
                !);
            !);

            UserInputs = wool -> (
                storeditem(wool, X), !,  X >= Amounts -> (
                    sell_items(wool, Space, Amounts), nl, nl,
                    write('You gained 150 gold per item'), nl,
                    Totalgold is 150 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = steak -> (
                storeditem(steak, X), !, X >= Amounts -> (
                    sell_items(steak, Space, Amounts), nl, nl,
                    write('You gained 250 gold per item'), nl,
                    Totalgold is 250 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );
            !);

            UserInputs = horsemilk -> (
                storeditem(horsemilk, X), !, X >= Amounts -> (
                    sell_items(horsemilk, Space, Amounts), nl, nl,
                    write('You gained 500 gold per item'), nl,
                    Totalgold is 500 * Amounts,
                    NewGold is Total + Totalgold,
                    update_amount(NewGold)
                );

            !); write('We do not accept that item, psh! Try again, little kid.'), nl, nl, marketplace,
        !)
    ).


/* INFORMASI LAINNYA */

max_level :-
    write('Your item is maxed up.'), nl.

update_amount(NewAmount) :- 
    retract(gold(X,_)), asserta(gold(X, NewAmount)).

update_fishing(NewLevel, NewPrice):-
    retract(fishingrod(A, _, X)), asserta(fishingrod(A, NewLevel, X)),
    retract(fishingrod(A, Y, _)), asserta(fishingrod(A, Y, NewPrice)).

update_farm(NewLevel, NewPrice):-
    retract(shovel(A, _, X)), asserta(shovel(A, NewLevel, X)),
    retract(shovel(A, Y, _)), asserta(shovel(A, Y, NewPrice)).

update_ranch(NewLevel, NewPrice):-
    retract(bucket(A, _, X)), asserta(bucket(A, NewLevel, X)),
    retract(bucket(A, Y, _)), asserta(bucket(A, Y, NewPrice)).

leavemarket :-
    write('Goodbye. Come back when you are worthy enough to wield these items.'), nl, marketplaceTileMenu, !.

help_market :-
    write('                                 GUIDE BOOK                                   '), nl,
    write('******************************************************************************'), nl,
    write('*Hint: maximize the output of Marketplace to win the game!                   *'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Selling guide: You could sell your item, any item to gain the gold you need.*'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Buying guide: Buy the item you need to gain rare items and get more money.  *'), nl,
    write('******************************************************************************'), nl, nl, nl,
    write('continue? (yes or no)'), nl, nl,
    read(Users), nl,
    (
        Users = yes ->
            marketplace
        ;

        Users = no ->
            leave
        ;
    !).

alce_msg :-
    write('                                       MYSTERIOUS OLD MAN                                             '), nl, nl,
    write('Someone is coming to town. People are talking about him. I heard he is bringing some goodies. Psh!                       '), nl,
    write('I do not believe in those kind of superstitions. People are in desperate times. They are trying to make things up.               '), nl,
    write('Legend says that this person would catch the rarest fish around, as his hobby is fishing. But that is just his side job..'), nl,
    write('I do not have time for this superstitious nonsense. So are you here to bring me some gold, eh? Don\'t waste my time.     '), nl, nl, nl,
    write('continue? (yes or no)'), nl, nl,
    read(Users), nl,
    (
        Users = yes ->
            marketplace
        ;

        Users = no ->
            leave
        ;
    !).

level_req :-
    write('Level up your specialty first.'), nl,
    write('Do not waste my time. Do you want to buy another item? (yes or no)'), nl, nl,
    read(Users), nl,
    (
        Users = yes ->
            marketplace
        ;

        Users = no ->
            leave
        ;
    !).


sell_items(X, Used, Amount) :-

    write('Are you sure you want to sell this item?'), nl, nl,
    read(Users), nl,
    (
        Users = yes -> (
            storeditem(X, Y) -> (
                retract(storeditem(X, Y)),
                Z is Y - Amount,
                asserta(storeditem(X, Z)),
                retract(reservedSpace(Used)),
                NewAmount is Used - Amount,
                asserta(reservedSpace(NewAmount)),
                write('You have sold this item'), nl
            ); write('You do not own this item.'), nl, nl
        )
        ;

        Users = no ->(
            inv
        )
        ;
    !).

insufficient :-
    write('Failed to upgrade. You either have already upgraded your item or your current level is insufficient.'), nl.
