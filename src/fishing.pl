fishing :-
    write('***************************************************** '), nl,
    write('____ _ ____ _  _ _ _   _ ____    ___  ____ _  _ ___   '), nl,
    write('|___ | [__  |__| | |\\| | __    |__] |  | |\\ | |  \\ '), nl,
    write('|    | ___] |  | | | \\| |__]   |    |__| | \\| |__/  '), nl,
    write('                                                      '), nl,
    write('***************************************************** '), nl,nl, nl,

    write('                 |                                       '), nl,                   
    write('                 |                                       '), nl,
    write('      _          |                                       '), nl,
    write('    _/=\\_        |                                       '), nl,
    write('  _/=====\\_      |                                       '), nl,
    write('    \'-\\-\'       / \\                                      '), nl,
    write('    - , -     /(o)|                                      '), nl,
    write('   __)-(____ /|^^^|                                      '), nl,
    write('  /  <\\/> __/_|\\/^|                                    '), nl,
    write(' / /|  : | /__|^^^|                                      '), nl,
    write('/ / |  : |/___|^^^|                                      '), nl,
    write('/_/ }===={)___|^^^|\\              .-.                    '), nl,
    write('((" |)  (| )__|^^^|_\\       ______/o  )                   '), nl,
    write('\\  |    |  )_|^^^|/        \\-----   (    /     _____      '), nl,
    write(' \\ |  | |  \\|^^^|          \\     / \\  //     |||||      '), nl,
    write('__\\|  | |____|^^^|___________\\   / \\\\///__   |||||      '), nl,
    write('/___)|  | |___///|\\\\_____=____\\_/(___\\)/___  |()||      '), nl,
    write('/___( |__|_|__////|\\\\ __ ___-______ | | \\____|||||      '), nl,
    write('/__=__)(___)__)^^^^^^^^^(  __________ | |______ |||||     '), nl,
    write('/_____(___________________)___________" "____=__|||||    '), nl,
    write('________________________________________________|||||    '), nl,
    write('                                                |||||    '), nl,

    write('I am the Revered Fisherman. I know the best spot to fish here. Most people consult to me first.'), nl, nl,
    
    write('-----------------------------------------'), nl,
    write('|?|   What do you want to do here?    |?|'), nl,
    write('|-|1. Tell me about this fishing pond |-|'), nl,
    write('|-|2. Fishing                         |-|'), nl,
    write('|-|3. Talk                            |-|'), nl,
    write('|-|4. See guide                       |-|'), nl,
    write('|-|5. Leave                           |-|'), nl,
    write('-----------------------------------------'), nl, nl,

    write('I want to....'), nl, nl,

    read_integer(User), nl,
    (
        User = 1 ->
            pond_story
        ;

        User = 2 -> 
            startfish
        ;

        User = 3 -> 
            alce_clue
        ;

        User = 4 ->
            guide
        ;

        User = 5 ->
            leavefishpond
        ;


    !).


/* here to start fishing */

startfish :- 

    inventory(Reserved), job(_, Jobs),

    write('So you want to start fishing now? Choose your bait first!'), nl, nl,
    show_inventory,
    write('Input your bait name here: '), read(UserInputs), nl,
    (
        write('Are you sure you want to use this bait?: '), read(User), nl,
        
        User = yes -> (
            UserInputs = corn -> (
                storeditem(UserInputs, Y), Y > 0 -> (
                    use_bait(UserInputs, Reserved),
                    Jobs == fisherman ->(
                        fisherman(UserInputs),
                    !); non-fisherman(UserInputs),
                    
                !); noitem
            );

            UserInputs = basic -> (
                storeditem(UserInputs, Y), Y > 0 -> (
                    use_bait(UserInputs, Reserved),
                    Jobs == fisherman ->(
                        fisherman(UserInputs),
                    !); non-fisherman(UserInputs),
                !);noitem
            );

            UserInputs = anchovy -> (
                storeditem(UserInputs, Y), Y > 0 -> (
                    use_bait(UserInputs, Reserved),
                    Jobs == fisherman ->(
                        fisherman(UserInputs),
                    !); non-fisherman(UserInputs),
                !);noitem
            );

            UserInputs = squid -> (
                storeditem(UserInputs, Y), Y > 0 -> (
                    use_bait(UserInputs, Reserved),
                    Jobs == fisherman ->(
                        fisherman(UserInputs),
                    !); non-fisherman(UserInputs),
                !); noitem
            );

            UserInputs = magic -> (
                storeditem(UserInputs, Y) -> (
                    use_bait(magic, Reserved), nl,
                    Jobs == fisherman -> (
                        fisherman(UserInputs),
                    !); non-fisherman(UserInputs),
                !); noitem
            );
        !); write('Invalid input.'), nl,

        User = no -> (
            fishing
        );
    !).



/* STORYLINE */

addFishExp :-
    job(Username, Chosenjob), 
    level_fishing(_, Lvlfishs),
    (
        Lvlfishs == 1 -> (
            Chosenjob == fisherman -> (
                addExpFishing(Username, 200), addExpOverall(Username, 200),
            !); addExpFishing(Username, 100), addExpOverall(Username, 100),
        !);

        Lvlfishs == 2 -> (
            Chosenjob == fisherman -> (
                addExpFishing(Username, 250), addExpOverall(Username, 250),
            !); addExpFishing(Username, 125), addExpOverall(Username, 125),

        !);

        Lvlfishs == 3 -> (
            Chosenjob == fisherman -> (
                addExpFishing(Username, 275), addExpOverall(Username, 275),
            !); addExpFishing(Username, 135), addExpOverall(Username, 135),

        !);

        Lvlfishs == 4 -> (
            Chosenjob == fisherman -> (
                addExpFishing(Username, 425), addExpOverall(Username, 425),
            !); addExpFishing(Username, 200), addExpOverall(Username, 200),

        !);

        Lvlfishs == 5 -> (
            write('You have reached the maximum level of Fishing Specialty.'), nl,
        !);

    !).



consume_stamina :-
    fishingrod(_, LvlEq, _),
    stamina(_, Y, _),
    (
        LvlEq == 1 -> (
            NewStamina is Y - 30,
            retract(stamina(X, _ , Z)), asserta(stamina(X, NewStamina, Z))
        );

        LvlEq == 2 -> (
            NewStamina is Y - 25,
            retract(stamina(X, _ , Z)), asserta(stamina(X, NewStamina, Z))
            
        );

        LvlEq == 3 -> (
            NewStamina is Y - 20,
            retract(stamina(X, _ , Z)), asserta(stamina(X, NewStamina, Z))
        );

        LvlEq == 4 -> (
            NewStamina is Y - 10,
            retract(stamina(X, _ , Z)), asserta(stamina(X, NewStamina, Z))
        );

        LvlEq == 5 -> (
            NewStamina is Y - 5,
            retract(stamina(X, _ , Z)), asserta(stamina(X, NewStamina, Z))
        );

    !).

fisherman(Bait) :-
    (
        fish_generator(sapu, Bait),
        fish_generator(lele, Bait),
        fish_generator(cupang, Bait),
        fish_generator(tuna, Bait),
        fish_generator(salmon, Bait), nl, addFishExp, nl, 
        fishing, consume_stamina,
    !).

non-fisherman(Bait) :-
    (
        fish_generator2(sapu, Bait),
        fish_generator2(lele, Bait),
        fish_generator2(cupang, Bait),
        fish_generator2(tuna, Bait),
        fish_generator2(salmon, Bait), nl, addFishExp, nl, 
        fishing, consume_stamina,
    !).

guide :-
    write('                                       GUIDE BOOK                                             '), nl,
    write('**********************************************************************************************'), nl,
    write('1. Level up your fishing rod, so the stamina consumed will be greatly reduced.                '), nl,
    write('2. Use the finest bait in order to get the rarest fish. You can buy it in the Old man\'s store'), nl,
    write('3. Doing fishing works will consume your stamina.                                             '), nl,
    write('**********************************************************************************************'), nl.



alce_clue :- 

    write('                                       REVERED FISHERMAN                                             '), nl, nl,
    write('Yes did the Old Man tell you about this? This pond is so legendary'), nl,
    write('This was used by warlocks or alchemist from the magic era to spend their free time'), nl,
    write('There was only one Alchemist left in this realm. He would come really soon.'), nl,
    write('Some even speculated that he was already here in disguise.'), nl,
    write('His name is Alce, I believe. Dealing with him comes with a heavy price, but will give you fortune.'), nl,
    write('Now, do you want to catch some good ol\' fish?'), nl,nl,
    write('continue? (yes or no)'), nl,

    read(Users),
    (
        Users = yes ->
            fishing
        ;

        Users = no ->
            leave
        ;
    !).

pond_story :-

    write('                                         REVERED FISHERMAN                                            '), nl, nl,
    write('You can get the best fish only in the pond in this village. The pond is blessed with expensive fishes.'), nl,
    write('Even this pond is more profitable than fishing in the sea. Probably because this pond used to be the place for the alchemists.'), nl,
    write('Back in the day, they would use magic to make this pond breed only the best fish'), nl,
    write('Even the legendary Old man would fish here sometimes, eh.'), nl,
    write('Only uncultured people did not want to do some fishing here.'), nl,
    write('So are you one of those uncultured masses?'), nl, nl,
    write('continue? (yes or no)'), nl,

    read(Users),
    (
        Users = yes ->
            fishing
        ;

        Users = no ->
            leave
        ;
    !).


leavefishpond :-
    write('                                       REVERED FISHERMAN                                            '), nl, nl,
    write('Come again really soon. Fish is the best asset during these desperate times.'), nl,
    drawmap.

noitem :-
    write('You do not own this item. Try again.'), nl, nl, fishing.

use_bait(X, Used) :-

    storeditem(X, Y) -> (
        retract(storeditem(X, Y)),
        Z is Y - 1,
        asserta(storeditem(X, Z)),
        retract(reservedSpace(Used)),
        NewAmount is Used - 1,
        asserta(reservedSpace(NewAmount)),
        write('You have used this bait'), nl, nl
    ); write('You do not own this item.'), nl, nl.

fish_generator(Fish, Bait) :-
    (
        /* SAPU - SAPU */

        Fish == sapu, Bait == corn -> (
            random(1, 100, Result),
            Result =< 100 -> (
                save_inventory(sapu),
                write('You received sapu-sapu fish'), nl
            );                   
        !);

        Fish == sapu, Bait == basic -> (
            random(1, 100, Result),
            Result =< 65 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 35 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        /* lele */

        Fish == lele, Bait == corn -> (
            random(1, 100, Result),
            Result =< 50 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);                
        !);

        Fish == lele, Bait == basic -> (
            random(1, 100, Result),
            Result =< 100 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 50 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        /* cupang */

        Fish == cupang, Bait == corn -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);
        Fish == cupang, Bait == basic -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);
        Fish == cupang, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);

        Fish == cupang, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);

        Fish == cupang, Bait == magic -> (
            random(1, 100, Result),
            Result =< 40 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);
        !);

        /* TUNA */

        Fish == tuna, Bait == corn -> (
            random(1, 100, Result),
            Result =< 1 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);
        Fish == tuna, Bait == basic -> (
            random(1, 100, Result),
            Result =< 1 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);
        Fish == tuna, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 5 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);
        Fish == tuna, Bait == squid -> (
            random(1, 100, Result),
            Result =< 25 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);

        Fish == tuna, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);

        /* SALMON */
        
        Fish == salmon, Bait == basic -> (
            random(1, 100, Result),
            Result =< 1 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);

        Fish == salmon, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 5 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);

        Fish == salmon, Bait == squid -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);

        Fish == salmon, Bait == magic -> (
            random(1, 100, Result),
            Result =< 15 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);
    !).

fish_generator2(Fish, Bait) :-
    (
        /* SAPU - SAPU */

        Fish == sapu, Bait == corn -> (
            random(1, 100, Result),
            Result =< 100 -> (
                save_inventory(sapu),
                write('You received sapu-sapu fish'), nl
            );                   
        !);

        Fish == sapu, Bait == basic -> (
            random(1, 100, Result),
            Result =< 30 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 20 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        Fish == sapu, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(sapu),
            write('You received sapu-sapu fish'), nl);
        !);

        /* lele */

        Fish == lele, Bait == corn -> (
            random(1, 100, Result),
            Result =< 30 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);                
        !);

        Fish == lele, Bait == basic -> (
            random(1, 90, Result),
            Result =< 100 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 45 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        Fish == lele, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(lele),
            write('You received lele fish'), nl);
        !);

        /* cupang */

        Fish == cupang, Bait == corn -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);
        Fish == cupang, Bait == basic -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);
        Fish == cupang, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 70 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);

        Fish == cupang, Bait == squid -> (
            random(1, 100, Result),
            Result =< 90 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);                
        !);

        Fish == cupang, Bait == magic -> (
            random(1, 100, Result),
            Result =< 40 -> (
            save_inventory(cupang),
            write('You received cupang fish'), nl);
        !);

        /* TUNA */

        Fish == tuna, Bait == basic -> (
            random(1, 100, Result),
            Result =< 1 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);
        Fish == tuna, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 5 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);
        Fish == tuna, Bait == squid -> (
            random(1, 100, Result),
            Result =< 15 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);

        Fish == tuna, Bait == magic -> (
            random(1, 100, Result),
            Result =< 80 -> (
            save_inventory(tuna),
            write('You received tuna fish'), nl);
        !);

        /* SALMON */
        

        Fish == salmon, Bait == anchovy -> (
            random(1, 100, Result),
            Result =< 5 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);

        Fish == salmon, Bait == squid -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);

        Fish == salmon, Bait == magic -> (
            random(1, 100, Result),
            Result =< 10 -> (
            save_inventory(salmon),
            write('You received salmon fish'), nl);
        !);
    !).
