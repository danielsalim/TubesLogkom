
open_marketplace :- 
 
    write('------------------------------------------'), nl,
    write('-----------The Old Man\'s Shop------------'), nl,
    write('------------------------------------------'), nl,

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
    write('|-|3. Leave                         |-|'), nl,
    write('|-|4. See guide                     |-|'), nl,
    write('|-|5. Talk                          |-|'), nl,
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
    write('*16. Upgrade Fishing Rod          *'), nl,
    write('*17. Upgrade Bucket               *'), nl,
    write('*18. Upgrade Shovel               *'), nl,
    write('***********************************'), nl,

    write('Show me what you have!'), nl,

    gold(_, total),
    read_integer(Item), nl,
    (
        Item = 1 -> (
            (
                total >= 50 ->
                newAmount is total - 50,
                update_amount(newAmount),
                save_inventory(coconut_seeds),
                write('You are proven worthy to wield these coconut seeds.'), nl
                ; write('You are not worthy to wield these coconut seeds.'), nl
            )
        );

        Item = 2 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(choco_seeds),
                write('You are proven worthy to wield these chocolate seeds.'), nl
                ; write('You are not worthy to wield these chocolate seeds.'), nl
            )
        );

        Item = 3 -> (
            (
                total >= 250 ->
                newAmount is total - 250,
                update_amount(newAmount),
                save_inventory(mango_seeds),
                write('You are proven worthy to wield these mango seeds.'), nl
                ; write('You are not worthy to wield these mango seeds.'), nl
            )
        );

        Item = 4 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(blu_seeds),
                write('You are proven worthy to wield these blueberry seeds.'), nl
                ; write('You are not worthy to wield these blueberry seeds.'), nl
            )
        );

        Item = 5 -> (
            (
                total >= 1000 ->
                newAmount is total - 1000,
                update_amount(newAmount),
                save_inventory(baobab_seeds),
                write('You are proven worthy to wield these baobab seeds.'), nl
                ; write('You are not worthy to wield these baobab seeds.'), nl
            )
        );

        Item = 6 -> (
            (
                total >= 50 ->
                newAmount is total - 50,
                update_amount(newAmount),
                save_inventory(corn_bait),
                write('You are proven worthy to wield these corn bait.'), nl
                ; write('You are not worthy to wield these corn bait.'), nl
            )
        );

        Item = 7 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(basic_bait),
                write('You are proven worthy to wield these basic bait.'), nl
                ; write('You are not worthy to wield these basic bait.'), nl
            )
        );

        Item = 8 -> (
            (
                total >= 250 ->
                newAmount is total - 250,
                update_amount(newAmount),
                save_inventory(anchovy_bait),
                write('You are proven worthy to get this anchovy_bait.'), nl
                ; write('You are not worthy to get this anchovy_bait.'), nl
            )
        );

        Item = 9 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(squid_bait),
                write('You are proven worthy to get this squid bait.'), nl
                ; write('You are not worthy to get this squid bait.'), nl
            )
        );

        Item = 10 -> (
            (
                total >= 1000 ->
                newAmount is total - 1000,
                update_amount(newAmount),
                save_inventory(magic_bait),
                write('You are proven worthy to get this magic bait.'), nl
                ; write('You are not worthy to get this magic bait.'), nl
            )
        );

        Item = 11 -> (
            (
                total >= 200 ->
                newAmount is total - 200,
                update_amount(newAmount),
                save_inventory(chicken),
                write('You are proven worthy to get the chicken.'), nl
                ; write('You are not worthy to get the chicken.'), nl
            )
        );

        Item = 12 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(goat),
                write('You are proven worthy to get the goat.'), nl
                ; write('You are not worthy to get the goat.'), nl
            )
        );

        Item = 13 -> (
            (
                total >= 1000 ->
                newAmount is total - 1000,
                update_amount(newAmount),
                save_inventory(sheep),
                write('You are proven worthy to get the cow.'), nl
                ; write('You are not worthy to get the cow.'), nl
            )
        );

        Item = 14 -> (
            (
                total >= 1500 ->
                newAmount is total - 1500,
                update_amount(newAmount),
                save_inventory(cow),
                write('You are proven worthy to get the cow.'), nl
                ; write('You are not worthy to get the cow.'), nl
            )
        );

        Item = 15 -> (
            (
                total >= 2000 ->
                newAmount is total - 2000,
                update_amount(newAmount),
                save_inventory(cow),
                write('You are proven worthy to get the cow.'), nl
                ; write('You are not worthy to get the cow.'), nl
            )
        );

        Item = 16 -> (
            (
                fisher_level(Y),
                Y =< 4 ->
                    
                    fishing_price(Y, X),
                    newPrice is X + 200,
                    newLevel is Y + 1,


                    
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    
                    update_level_fishing,

                    save_inventory(fishing_rod(newLevel)),
                    write('You have leveled up your fishing rod.'), nl
                    ; write('You are not worthy to wield this fishing rod.'), nl
                ;max_level
            )
        );

        Item = 17 -> (
            (
                farming_level(Y),
                Y =< 4 ->
                   
                    shovel_price(Y, X),
                    newPrice is X + 200,
                    newLevel is Y + 1,


                    
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    
                    update_level_shovel,

                    save_inventory(shovel(newLevel)),
                    write('You have leveled up your shovel.'), nl
                    ; write('You are not worthy to wield this shovel.'), nl
                ;max_level
            )
        );

        Item = 18 -> (
            (
                
                ranching_level(Y),
                Y =< 4 ->
                    newPrice is X + 200,
                    newLevel  is Y + 1,


                    
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    
                    update_level_bucket,

                    save_inventory(bucket(newLevel)),
                    write('You have leveled up your bucket.'), nl
                    ; write('You are not worthy to wield this bucket.'), nl
                ;max_level
            )
        );

    !).

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

    write('I am the Alchemist. The Legend that people talk about.        '), nl,
    write('Are you worthy to wield my legendary potions?                 '), nl,
    write('People come at me to become rich. Thy opportunity are limited.'), nl, nl.

max_level :-
    write('Your item is maxed up.').

update_amount :- 
    retract(gold(X,_)), asserta(gold(X, newAmount)).

update_level_fishing :-
    retract(fishing_price(_, X)), asserta(fishing_price(newLevel, X)),
    retract(fishing_price(Y, _)), asserta(fishing_price(Y, newPrice)).

update_level_shovel :-
    retract(shovel_price(_, X)), asserta(shovel_price(newLevel, X)),
    retract(shovel_price(Y, _)), asserta(shovel_price(Y, newPrice)).

update_level_bucket :-
    retract(bucket_price(_, X)), asserta(bucket_price(newLevel, X)),
    retract(bucket_price(Y, _)), asserta(bucket_price(Y, newPrice)).

leave :-
    write('Goodbye. Come back when you are worthy enough to wield these items.').

help_market :-
    write('******************************************************************************'), nl,
    write('*Hint: maximize the output of Marketplace to win the game!                   *'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Selling guide: You could sell your item, any item to gain the gold you need.*'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Buying guide: Buy the item you need to gain rare items and get more money.  *'), nl,
    write('******************************************************************************'), nl, nl, nl,
    open_marketplace.

alce_msg :-

    write('Someone is coming to town. People are talking about him. I heard he is bringing some goodies. Psh!                       '), nl,
    write('I do not believe in those kind of superstition. People are in desperate times. They try to make things up.               '), nl,
    write('Legend says that this person would catch the rarest fish around, as his hobby is fishing. But that is just his side job..'), nl,
    write('I do not have time for this superstitious nonsense. So are you here to bring me some gold, eh? Don\'t waste my time.     '), nl, nl, nl,
    open_marketplace.
