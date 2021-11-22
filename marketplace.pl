#barang specialty (level, harga) flat harga naik konstan sebanyak 200 gold
shovel_price(2, 200)
fishing_price(2, 200)
bucket_price(2, 200)


open_marketplace :- 
 
    write('---------------------------'), nl,
    write('Welcome to the Marketplace!'), nl,
    write('---------------------------'), nl,
    
    write('---------------------------------------'), nl,
    write('|?|   What do you want to do here?  |?|'), nl,
    write('|-|1. Buy items                     |-|'), nl,
    write('|-|2. Sell items                    |-|'), nl,
    write('|-|3. I want to leave               |-|'), nl,
    write('|-|4. See guide                     |-|'), nl,
    write('---------------------------------------'), nl,


    read_integer(user_choice), nl,
    (
        user_choice = 1 -> (
            show_panel_buy,
        );

        user_choice = 2 -> (
            show_panel_sell,
        );

        user_choice = 3 -> (
            leave,
        );

        user_choice = 4 -> {
            help_market,
        };

    )

show_panel_buy :- 
    write('***********************************'), nl,
    write('*1. Coconut Seeds: 50 gold        *'), nl,
    write('*2. Chocolate Seeds: 100 gold     *'), nl,
    write('*3. Mango Seeds: 250 gold         *'), nl,
    write('*4. Corn Bait: 50 gold            *'), nl,
    write('*5. Basic Bait: 100 gold          *'), nl,
    write('*6. Anchovy Bait: 250 gold        *'), nl,
    write('*7. Chicken: 200 gold             *'), nl,
    write('*8. Goat: 500 gold                *'), nl,
    write('*9. Cow: 1000 gold                *'), nl,
    write('*10. Upgrade Fishing Rod          *'), nl,
    write('*11. Upgrade Bucket               *'), nl,
    write('*12. Upgrade Shovel               *'), nl,
    write('***********************************'), nl,

    write('Show me what you have!'), nl,

    gold(_, total),
    read_integer(item_choice), nl,
    (
        item_choice = 1 -> (
            (
                total >= 50 ->
                newAmount is total - 50,
                update_amount(newAmount),
                save_inventory(coconut_seeds),
                write('You are proven worthy to wield these coconut seeds.'), nl,
                ; write('You are not worthy to wield these coconut seeds.'), nl,
            )
        );

        user_choice = 2 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(choco_seeds),
                write('You are proven worthy to wield these chocolate seeds.'), nl,
                ; write('You are not worthy to wield these chocolate seeds.'), nl,
            )
        );

        user_choice = 3 -> (
            (
                total >= 250 ->
                newAmount is total - 250,
                update_amount(newAmount),
                save_inventory(mango_seeds),
                write('You are proven worthy to wield these mango seeds.'), nl,
                ; write('You are not worthy to wield these mango seeds.'), nl,
            )
        );

        user_choice = 4 -> (
            (
                total >= 50 ->
                newAmount is total - 50,
                update_amount(newAmount),
                save_inventory(corn_bait),
                write('You are proven worthy to wield these corn bait.'), nl,
                ; write('You are not worthy to wield these corn bait.'), nl,
            )
        );

        user_choice = 5 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(basic_bait),
                write('You are proven worthy to wield these basic bait.'), nl,
                ; write('You are not worthy to wield these basic bait.'), nl,
            )
        );

        user_choice = 6 -> (
            (
                total >= 250 ->
                newAmount is total - 250,
                update_amount(newAmount),
                save_inventory(anchovy_bait),
                write('You are proven worthy to get this anchovy_bait.'), nl,
                ; write('You are not worthy to get this anchovy_bait.'), nl,
            )
        );

        user_choice = 7 -> (
            (
                total >= 200 ->
                newAmount is total - 200,
                update_amount(newAmount),
                save_inventory(chicken),
                write('You are proven worthy to get the chicken.'), nl,
                ; write('You are not worthy to get the chicken.'), nl,
            )
        );

        user_choice = 8 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(goat),
                write('You are proven worthy to get the goat.'), nl,
                ; write('You are not worthy to get the goat.'), nl,
            )
        );

        user_choice = 9 -> (
            (
                total >= 1000 ->
                newAmount is total - 1000,
                update_amount(newAmount),
                save_inventory(cow),
                write('You are proven worthy to get the cow.'), nl,
                ; write('You are not worthy to get the cow.'), nl,
            )
        );

        user_choice = 10 -> (
            (
                Y <= 4 ->
                    #konfigurasi level fishing rod
                    fishing_price(Y, X),
                    newPrice X + 200,
                    newLevel Y + 1,


                    #Jika uang cukup, maka akan ada proses pembelian
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    #update informasi fishing rod
                    update_level_fishing,

                    save_inventory(fishing_rod(newLevel)),
                    write('You have leveled up your fishing rod.'), nl,
                    ; write('You are not worthy to wield this fishing rod.'), nl,
                ;max_level
            )
        );

        user_choice = 11 -> (
            (
                Y <= 4 ->
                    #konfigursi level shovel
                    shovel_price(Y, X),
                    newPrice X + 200,
                    newLevel Y + 1,


                    #Jika uang cukup, maka akan ada proses pembelian
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    #update informasi shovel
                    update_level_shovel,

                    save_inventory(shovel(newLevel)),
                    write('You have leveled up your shovel.'), nl,
                    ; write('You are not worthy to wield this shovel.'), nl,
                ;max_level
            )
        );

        user_choice = 12 -> (
            (
                #konfigurasi level bucket
                bucket_price(Y, X),
                Y <= 4 ->
                    newPrice X + 200,
                    newLevel Y + 1,


                    #Jika uang cukup, maka akan ada proses pembelian
                    total >= newPrice ->
                    newAmount is total - newPrice,
                    update_amount(newAmount),


                    #update informasi bucket
                    update_level_bucket,

                    save_inventory(bucket(newLevel)),
                    write('You have leveled up your bucket.'), nl,
                    ; write('You are not worthy to wield this bucket.'), nl,
                ;max_level
            )
        );

    ).

show_panel_sell :-
    #show inventory
    #tunggu implementasi inventory
    #semua item specialty flat dijual seharga 50 gold, kalau udah ga kepake

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
    write('******************************************************************************'), nl,
    
