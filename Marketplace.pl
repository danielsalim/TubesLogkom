#barang specialty (level, harga) flat harga naik konstan sebanyak 200 gold
shovel_price(2, 200)
fishing_price(2, 200)
bucket_price(2, 200)


open_marketplace :- 
 
    write('---------------------------'), nl,
    write('Welcome to the Marketplace!'), nl,
    write('---------------------------'), nl,

    write('What do you want to do here?'), nl,
    write('1. Buy items'), nl,
    write('2. Sell items'), nl,
    write('3. I want to leave'), nl,
    write('4. Guide'), nl,

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
    #inisialisasi jumlah gold
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
         
        );

        user_choice = 11 -> (
            
        );

        user_choice = 12 -> (
            
        );

    ).

show_panel_sell :-
    #show inventory
    #tunggu implementasi inventory
    #semua item specialty flat dijual seharga 50 gold, kalau udah ga kepake


help_market :-
    write('******************************************************************************'), nl,
    write('*Hint: maximize the output of Marketplace to win the game!                   *'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Selling guide: You could sell your item, any item to gain the gold you need.*'), nl,
    write('*----------------------------------------------------------------------------*'), nl,
    write('*Buying guide: Buy the item you need to gain rare items and get more money.  *'), nl,
    write('******************************************************************************'), nl,
    
