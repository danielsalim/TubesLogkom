/* INISIALISASI NANTI DISINI */


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
            leave
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
    write('*2. Chocolate Seeds: 100 gold     *'), nl,
    write('*3. Mango Seeds: 250 gold         *'), nl,
    write('*4. Blueberry Seeds: 500 gold     *'), nl,
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

    write('Show me what you have!'), nl,

    gold(_, total),
    read_integer(Item), nl,
    level_fishing(_, lvlfish), 
    level_farming(_, lvlfarm),
    level_rancher(_, lvlranch),
    eq_fish(_, eqlvlfish, priceqfish),
    eq_farm(_, eqlvlfarm, priceqfarm),
    eq_ranch(_, eqlvlranch, priceqranch),

    
    (
        Item = 1 -> (
            (
                lvlfarm >= 1 ->(
                    total >= 50 ->
                        newAmount is total - 50,
                        update_amount(newAmount),
                        save_inventory(coconut_seeds),
                        write('You are proven worthy to wield these coconut seeds.'), nl
                    ; write('You are not worthy to wield these coconut seeds.'), nl
                ); level_req
            )
        );

        Item = 2 -> (
            (
                lvlfarm >= 2 -> (
                    total >= 100 ->
                        newAmount is total - 100,
                        update_amount(newAmount),
                        save_inventory(choco_seeds),
                        write('You are proven worthy to wield these chocolate seeds.'), nl
                    ; write('You are not worthy to wield these chocolate seeds.'), nl
                ); level_req
            )
        );

        Item = 3 -> (
            (
                lvlfarm >= 3 -> (
                    total >= 250 ->
                        newAmount is total - 250,
                        update_amount(newAmount),
                        save_inventory(mango_seeds),
                        write('You are proven worthy to wield these mango seeds.'), nl
                    ; write('You are not worthy to wield these mango seeds.'), nl
                ); level_req
            )
        );

        Item = 4 -> (
            (
                lvlfarm >= 4 -> (
                    total >= 500 ->
                        newAmount is total - 500,
                        update_amount(newAmount),
                        save_inventory(blu_seeds),
                        write('You are proven worthy to wield these blueberry seeds.'), nl
                    ; write('You are not worthy to wield these blueberry seeds.'), nl
                ); level_req
            )
        );

        Item = 5 -> (
            (
                lvlfarm >= 5 -> (
                    total >= 1000 ->
                        newAmount is total - 1000,
                        update_amount(newAmount),
                        save_inventory(baobab_seeds),
                        write('You are proven worthy to wield these baobab seeds.'), nl
                    ; write('You are not worthy to wield these baobab seeds.'), nl
                ); level_req
            )
        );

        Item = 6 -> (
            (
                lvlfish >= 1 -> (
                    total >= 50 ->
                        newAmount is total - 50,
                        update_amount(newAmount),
                        save_inventory(corn_bait),
                        write('You are proven worthy to wield these corn bait.'), nl
                    ; write('You are not worthy to wield these corn bait.'), nl
                ); level_req
            )
        );

        Item = 7 -> (
            (
                lvlfish >= 2 ->(
                    total >= 100 ->
                        newAmount is total - 100,
                        update_amount(newAmount),
                        save_inventory(basic_bait),
                        write('You are proven worthy to wield these basic bait.'), nl
                    ; write('You are not worthy to wield these basic bait.'), nl
                ); level_req
            )
        );

        Item = 8 -> (
            (
                lvlfish >= 3 -> (
                    total >= 250 ->
                        newAmount is total - 250,
                        update_amount(newAmount),
                        save_inventory(anchovy_bait),
                        write('You are proven worthy to get this anchovy_bait.'), nl
                    ; write('You are not worthy to get this anchovy_bait.'), nl
                ); level_req
            )
        );

        Item = 9 -> (
            (
                lvlfish >= 4 -> (
                    total >= 500 ->
                    newAmount is total - 500,
                    update_amount(newAmount),
                    save_inventory(squid_bait),
                    write('You are proven worthy to get this squid bait.'), nl
                    ; write('You are not worthy to get this squid bait.'), nl
                ); level_req
            )
        );

        Item = 10 -> (
            (
                lvlfish >= 5 -> (
                    total >= 1000 ->
                        newAmount is total - 1000,
                        update_amount(newAmount),
                        save_inventory(magic_bait),
                        write('You are proven worthy to get this magic bait.'), nl
                    ; write('You are not worthy to get this magic bait.'), nl
                ); level_req
            )
        );

        Item = 11 -> (
            (
                lvlranch >= 1 -> (
                    total >= 200 ->
                        newAmount is total - 200,
                        update_amount(newAmount),
                        save_inventory(chicken),
                        write('You are proven worthy to get the chicken.'), nl
                    ; write('You are not worthy to get the chicken.'), nl
                ); level_req
            )
        );

        Item = 12 -> (
            (
                lvlranch >= 2 -> (
                    total >= 500 ->
                        newAmount is total - 500,
                        update_amount(newAmount),
                        save_inventory(goat),
                        write('You are proven worthy to get the goat.'), nl
                    ; write('You are not worthy to get the goat.'), nl
                ); level_req
            )
        );

        Item = 13 -> (
            (
                lvlranch >= 3 -> (
                    total >= 1000 ->
                        newAmount is total - 1000,
                        update_amount(newAmount),
                        save_inventory(sheep),
                        write('You are proven worthy to get the sheep.'), nl
                    ; write('You are not worthy to get the sheep.'), nl
                ); level_req
            )
        );

        Item = 14 -> (
            (
                lvlranch >= 4 -> (
                    total >= 1500 ->
                        newAmount is total - 1500,
                        update_amount(newAmount),
                        save_inventory(cow),
                        write('You are proven worthy to get the cow.'), nl
                    ; write('You are not worthy to get the cow.'), nl
                ); level_req
            )
        );

        Item = 15 -> (
            (
                lvlranch >= 5 -> (
                    total >= 2000 ->
                        newAmount is total - 2000,
                        update_amount(newAmount),
                        save_inventory(horse),
                        write('You are proven worthy to get the horse.'), nl
                    ; write('You are not worthy to get the horse.'), nl
                ); level_req
            )
        );

        Item = 16 -> (
            oldmanask,
            read_integer(User2), nl,
            (
                User2 = 1 ->(
                    total >= priceqfish ->
                        newAmount is total - priceqfish,
                        update_amount(newAmount),
                        save_inventory(fishingrod(eq_lvl_fish)),
                        write('Next time you should upgrade your equipment.'), nl
                    ; write('You do not have enough gold, kids.'), nl
                );

                User2 = 2 ->(
                    eqlvlfish =< 4 ->(
                        newPrice is priceqfish + 500,
                        total >= newPrice ->
                            newLevel is eqlvlfish + 1,
                            newAmount is total - newPrice,
                            save_inventory(fishingrod(newLevel)),
                            write('Congratulations. You will become one of the legendaries.'), nl,
                            update_level_fishing(newLevel, newPrice)
                            
                        ; write('Too bad you do not have what it takes to wield this equipment.'), nl
            

                    ); max_level
                );
            )
        );

        Item = 17 -> (
            oldmanask,
            read_integer(User2), nl,
            (
                User2 = 1 ->(
                    total >= priceqfarm ->
                        newAmount is total - priceqfarm,
                        update_amount(newAmount),
                        save_inventory(shovel(eq_lvl_farm)),
                        write('Next time you should upgrade your equipment.'), nl
                    ; write('You do not have enough gold, kids.'), nl
                );

                User2 = 2 ->(
                    eqlvlfarm =< 4 ->(
                        newPrice is priceqfarm + 500,
                        total >= newPrice ->
                            newLevel is eqlvlfarm + 1,
                            newAmount is total - newPrice,
                            save_inventory(shovel(newLevel)),
                            write('Congratulations. You will become one of the legendaries.'), nl,
                            update_level_farming(newLevel, newPrice)
                            
                        ; write('Too bad you do not have what it takes to wield this equipment.'), nl
            

                    ); max_level
                );
            )
        );

        Item = 18 -> (
            oldmanask,
            read_integer(User2), nl,
            (
                User2 = 1 ->(
                    total >= priceqranch ->
                        newAmount is total - priceqranch,
                        update_amount(newAmount),
                        save_inventory(bucket(eq_lvl_ranch)),
                        write('Next time you should upgrade your equipment.'), nl
                    ; write('You do not have enough gold, kids.'), nl
                );

                User2 = 2 ->(
                    eqlvlranch =< 4 ->(
                        newPrice is priceqranch + 500,
                        total >= newPrice ->
                            newLevel is eqlvlranch + 1,
                            newAmount is total - newPrice,
                            save_inventory(bucket(newLevel)),
                            write('Congratulations. You will become one of the legendaries.'), nl,
                            update_level_ranch(newLevel, newPrice)
                            
                        ; write('Too bad you do not have what it takes to wield this equipment.'), nl
            

                    ); max_level
                );
            )
        );

    !).


/* ALCHEMIST DISINI AKSESNYA */

alce :-

    write('                        .    '), nl,
    write('                             '), nl,
    write('                    .        '), nl,
    write('            /\\     .        '), nl,
    write('      /\\   "V"              '), nl,
    write('     /__\\   I      O  o     '), nl,
    write('    //..\\|  I     .         '), nl, 
    write('    \\].`[// I               '), nl,
    write('    /l\\|j\\ (]    .  O      '), nl,
    write('   /. ~~ ,\\/I          .    '), nl,
    write('   \\L__j^\\/I       o       '), nl,
    write('    \\/--v}\\I     o   .     '), nl,
    write('    ||    |  I   _________   '), nl,
    write('    ||    |  I c(`       ")o '), nl,
    write('    ||    l  I   \\.     /   '), nl,
    write('   _||/j  L l\\_!_//^---^\\_ '), nl, nl,
    write('                                       ALCHEMIST                                             '), nl, nl,
    write('I am the Alchemist. The Legend that people talk about.        '), nl,
    write('Are you worthy to wield my legendary potions?                 '), nl,
    write('People come at me to become rich. Thy opportunity are limited.'), nl, nl.



/* PANEL BELI */

/* nuggu inventory mau gimana
show_panel_sell :-
*/









/* INFORMASI LAINNYA */

max_level :-
    write('Your item is maxed up.').

update_amount(newAmount) :- 
    retract(gold(X,_)), asserta(gold(X, newAmount)).

update_level_fishing(NewLevel, NewPrice):-
    retract(eq_fish(A, _, X)), asserta(eq_fish(A, NewLevel, X)),
    retract(eq_fish(A, Y, _)), asserta(eq_fish(A, Y, NewPrice)).

update_level_shovel(NewLevel, NewPrice):-
    retract(eq_farm(A, _, X)), asserta(eq_farm(A, NewLevel, X)),
    retract(eq_farm(A, Y, _)), asserta(eq_farm(A, Y, NewPrice)).

update_level_bucket(NewLevel, NewPrice):-
    retract(eq_ranch(A, _, X)), asserta(eq_ranch(A, NewLevel, X)),
    retract(eq_ranch(A, Y, _)), asserta(eq_ranch(A, Y, NewPrice)).

leave :-
    write('Goodbye. Come back when you are worthy enough to wield these items.'), nl.

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
    write('I do not believe in those kind of superstition. People are in desperate times. They try to make things up.               '), nl,
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
    write('Level up your specialty first'), nl.

oldmanask :-
    write(' You only have two options.'), nl,
    write(' What do you want to do? '), nl, nl,
    write('1. Buy the item with current level unlocked'), nl,
    write('2. Upgrade item to the next level'), nl.
