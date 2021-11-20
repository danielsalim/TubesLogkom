
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
    write('*4. Corn Bait: 100 gold           *'), nl,
    write('*5. Anchovy Bait: 500 gold        *'), nl,
    write('*6. Cow: 1000 gold                *'), nl,
    write('*7. Horse: 1500 gold              *'), nl,
    write('*8. Upgrade Fishing Rod           *'), nl,
    write('*9. Upgrade Bucket                *'), nl,
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
                ; write('You are not worthy to wield these coconut seeds.').
            )
        );

        user_choice = 2 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(choco_seeds),
                write('You are proven worthy to wield these chocolate seeds.'), nl,
                ; write('You are not worthy to wield these chocolate seeds.').
            )
        );

        user_choice = 3 -> (
            (
                total >= 250 ->
                newAmount is total - 250,
                update_amount(newAmount),
                save_inventory(mango_seeds),
                write('You are proven worthy to wield these mango seeds.'), nl,
                ; write('You are not worthy to wield these mango seeds.').
            )
        );

        user_choice = 4 -> (
            (
                total >= 100 ->
                newAmount is total - 100,
                update_amount(newAmount),
                save_inventory(corn_bait),
                write('You are proven worthy to wield these corn bait.'), nl,
                ; write('You are not worthy to wield these corn bait.').
            )
        );

        user_choice = 5 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(anchovy_bait),
                write('You are proven worthy to wield these anchovy bait.'), nl,
                ; write('You are not worthy to wield these anchovy bait.').
            )
        );

        user_choice = 6 -> (
            (
                total >= 1000 ->
                newAmount is total - 1000,
                update_amount(newAmount),
                save_inventory(Cow),
                write('You are proven worthy to get the cow.'), nl,
                ; write('You are not worthy to get the cow.').
            )
        );

        user_choice = 7 -> (
            (
                total >= 1500 ->
                newAmount is total - 1500,
                update_amount(newAmount),
                save_inventory(blueberry_seeds),
                write('You are proven worthy to get the horse.'), nl,
                ; write('You are not worthy to get the horse.').
            )
        );

        user_choice = 8 -> (
            (
                total >= 500 ->
                newAmount is total - 500,
                update_amount(newAmount),
                save_inventory(blueberry_seeds),
                write('You are proven worthy to wield these blueberry seeds.'), nl,
                ; write('You are not worthy to wield these blueberry seeds.').
            )
        );

    ).


help_market :-
    write('*****************************************************************************'), nl,
    write('Hint: maximize the output of Marketplace to win the game!'), nl,
    write('-----------------------------------------------------------------------------'), nl,
    write('Selling guide: You could sell your item, any item to gain the gold you need.'), nl,
    write('-----------------------------------------------------------------------------'), nl,
    write('Buying guide: Buy the item you need to gain rare items and get more money.'), nl,
    write('*****************************************************************************'), nl,
    