:- dynamic(eggCount/1).

isEgg(X) :-
    eggCount(X).

currEgg(Y, Day) :-
    level_rancher(_, LvlRanch), eggCount(Y),
    (
        Var is Day mod 5,
        LvlRanch == 1, Var == 0 -> 
            E is 1, 
            retract(eggCount(_)), asserta(eggCount(E));

        Var is Day mod 4,
        LvlRanch == 2, Var == 0 -> 
            E is 1, 
            retract(eggCount(_)), asserta(eggCount(E));

        Var is Day mod 3,
        LvlRanch == 3, Var == 0-> 
            E is 1, 
            retract(eggCount(_)), asserta(eggCount(E));

        Var is Day mod 2,
        LvlRanch == 4, Var == 0 -> 
            E is 1,
            retract(eggCount(_)), asserta(eggCount(E));

        Var is Day mod 1,
        LvlRanch == 5, Var == 0 -> 
            E is 1, 
            retract(eggCount(_)), asserta(eggCount(E));
        E is 0, retract(eggCount(_)), asserta(eggCount(E))
    ).

enterRanch :- 
        write('                                             _         ___'), nl,
        write('          ,;;,                           _.-" "-._    [___]'), nl,
        write('           7T                        _.-"         "-._|   |'), nl,
        write('        _.-""-._                 _.-"                 "-._|'), nl,
        write('    _.-"        "-._         _.-"                         "-._'), nl,
        write(' .="                "-._ _.-"                                 "-._'), nl,
        write('"---;.------------;;.---"----------------------------------------"'), nl,
        write('    ||_  __ __  __|2|----.|    |".------|"|    |"|------|"|  |'), nl,
        write('    ||            |7| [] ||    | |><><><| |    | |><><><| |  |____'), nl,
        write('    ||--  --- ----|1| [] ||    |_|======|_|    |_|======|_|  |=-_=|'), nl,
        write('%%&_||____________|2|____||%&&%,,,,,,%&%&%&%&%%&,,%%&%&%&,,,,%&%&&%&%&%'), nl,
        write('|-|       ===                          \\|/          (__)            |-|'), nl,
        write('|-|        ===                              `\\------(oo)            |-|'), nl,
        write('|-|         ===                               ||    (__)            |-|'), nl,
        write('|-|          ===                              ||w--||     \\|/       |-|'), nl,
        write('|-|           ===                          \\|/                      |-|'), nl,
        write('|-|            ===          _._._._._._._._._._._._._._._._._._._._.|-|'), nl,
        write('|-|             ===        |=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=||-|'), nl,
        write('|^^^^^^^^^^^^^^^ === ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'), nl,
        write('                  ==='), nl, nl,

        write('Welcome to the ranch!'), nl,
        write('here\'s the list of animals you currently have on your ranch'), nl,
        (inInventory(chicken)),(itemCounter(chicken, Amount), write('1.'), write(Amount), write(' chicken. (SR = 10)')), nl,
        (inInventory(goat)),(itemCounter(goat, Count), write('2.'), write(Count), write(' goat. (SR = 15)')), nl,
        (inInventory(sheep)),(itemCounter(sheep, Count), write('3.'), write(Count), write(' sheep. (SR = 20)')), nl,
        (inInventory(cow)),(itemCounter(cow, Count), write('4.'), write(Count), write(' cow. (SR = 25)')), nl,
        (inInventory(horse)),(itemCounter(horse, Count), write('5.'), write(Count), write(' horse. (SR = 30)')), nl, nl,

        stamina(_,PrevStamina,_),
        level_rancher(X, LvlRanch),
        Day is 365,
        eggCount(Egg),
        write('So.. what are you going to check?'), nl,
        read_integer(User), nl,
        (
            User = 1 -> /* ================================ Chicken ================================= */
            (
                storeditem(chicken, Amount), Amount > 0,
                PrevStamina >= 10 ->
                (
                    storeditem(chicken, Amount), 
                    Amount == 0 -> 
                    (    
                        write('you have no chicken in your ranch.'), nl
                    );
                    currEgg(Egg, Day),
                    storeditem(chicken, Amount), Amount > 0, Egg == 1 ->
                    (
                        level_rancher(X, LvlRanch), LvlRanch == 1, /* lvl Ranching 1 */
                        0 is Day mod 5 ->
                        (
                            save_inventory2(egg, Amount),
                            write('you have collected '), write(Amount), write(' egg.'), nl,
                            
                            useStamina(X, 10),

                            job(X, rancher) -> (
                                addExpRanching(X,50), addExpOverall(X,10)
                            );addExpRanching(X,25), addExpOverall(X,10)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 2, /* lvl Ranching 2 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 4 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(egg, NewCount),
                            write('you have collected '), write(NewAmount), write(' egg.'), nl,
                            
                            useStamina(X, 10),

                            job(X, rancher) -> (
                                addExpRanching(X,50), addExpOverall(X,10)
                            );addExpRanching(X,25), addExpOverall(X,10)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 3, /* lvl Ranching 3 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 3 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(egg, NewCount),
                            write('you have collected '), write(NewAmount), write(' egg.'), nl,
                            
                            useStamina(X, 10),

                            job(X, rancher) -> (
                                addExpRanching(X,50), addExpOverall(X,10)
                            );addExpRanching(X,25), addExpOverall(X,10)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 4, /* lvl Ranching 4 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 2 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(egg, NewCount),
                            write('you have collected '), write(NewAmount), write(' egg.'), nl,
                            
                            useStamina(X, 10),

                            job(X, rancher) -> (
                                addExpRanching(X,50), addExpOverall(X,10)
                            );addExpRanching(X,25), addExpOverall(X,10)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 5, /* lvl Ranching 5 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 1 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(egg, NewCount),
                            write('you have collected '), write(NewAmount), write(' egg.'), nl,

                            useStamina(X,10),

                            job(X, rancher) -> (
                                addExpRanching(X,50), addExpOverall(X,10)
                            );addExpRanching(X,25), addExpOverall(X,10)
                        );
                    !); noEgg
                ); noStamina
            );

            User = 2 -> /* ================================ Goat ================================= */
            (
                (inInventory(Goat)),(itemCounter(Goat, Count)),
                currMilk(MilkCount), stamina(_,PrevStamina,_),
                PrevStamina >= 15 ->
                (
                    Count == 0 -> 
                    (    
                        write('you have no goat in your ranch.'), nl
                    );

                    Count > 0, MilkCount > 0 ->
                    (
                        level_rancher(X, LvlRanch), LvlRanch == 1, /* lvl Ranching 1 */ 
                        0 is Day mod 6 ->
                        (
                            save_inventory2(milk, Amount),
                            write('you have collected '), write(Count), write(' milk.'),
                            
                            useStamina(X, 15),

                            job(X, rancher) -> (
                                addExpRanching(X,60), addExpOverall(X,15)
                            );addExpRanching(X,40), addExpOverall(X,15)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 2, /* lvl Ranching 2 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 5 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(milk, NewCount),
                            write('you have collected '), write(NewCount), write(' milk.'),
                            
                            useStamina(X, 15),

                            job(X, rancher) -> (
                                addExpRanching(X,60), addExpOverall(X,15)
                            );addExpRanching(X,40), addExpOverall(X,15)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 3, /* lvl Ranching 3 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 4 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(milk, NewCount),
                            write('you have collected '), write(NewCount), write(' milk.'),
                            
                            useStamina(X, 15),

                            job(X, rancher) -> (
                                addExpRanching(X,60), addExpOverall(X,15)
                            );addExpRanching(X,40), addExpOverall(X,15)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 4, /* lvl Ranching 4 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 3 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(milk, NewCount),
                            write('you have collected '), write(NewCount), write(' milk.'),
                            
                            useStamina(X, 15),

                            job(X, rancher) -> (
                                addExpRanching(X,60), addExpOverall(X,15)
                            );addExpRanching(X,40), addExpOverall(X,15)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 5, /* lvl Ranching 5 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 2 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(milk, NewCount),
                            write('you have collected '), write(NewCount), write(' milk.'),

                            useStamina(X, 15),

                            job(X, rancher) -> (
                                addExpRanching(X,60), addExpOverall(X,15)
                            );addExpRanching(X,40), addExpOverall(X,15)
                        );
                    !); noMilk
                ); noStamina
            );

            User = 3 -> /* ================================ Sheep ================================= */
            (
                (inInventory(Sheep)),(itemCounter(Sheep, Count)),
                currWool(WoolCount), stamina(_,PrevStamina,_),
                PrevStamina >= 20 ->
                (
                    Count == 0 ->
                    (    
                        write('you have no sheep in your ranch.'), nl
                    );

                    Count > 0, WoolCount > 0 ->
                    (
                        level_rancher(X, LvlRanch), LvlRanch == 1, /* lvl Ranching 1 */ 
                        0 is Day mod 7 ->
                        (
                            save_inventory2(wool, Amount),
                            write('you have collected '), write(Count), write(' wool.'),
                            
                            useStamina(X, 20),

                            job(X, rancher) -> (
                                addExpRanching(X,80), addExpOverall(X,20)
                            );addExpRanching(X,40), addExpOverall(X,20)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 2, /* lvl Ranching 2 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 6 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(wool, NewCount),
                            write('you have collected '), write(NewCount), write(' wool.'),
                            
                            useStamina(X, 20),

                            job(X, rancher) -> (
                                addExpRanching(X,80), addExpOverall(X,20)
                            );addExpRanching(X,40), addExpOverall(X,20)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 3, /* lvl Ranching 3 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 5 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(wool, NewCount),
                            write('you have collected '), write(NewCount), write(' wool.'),
                            
                            useStamina(X, 20),

                            job(X, rancher) -> (
                                addExpRanching(X,80), addExpOverall(X,20)
                            );addExpRanching(X,40), addExpOverall(X,20)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 4, /* lvl Ranching 4 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 4 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(wool, NewCount),
                            write('you have collected '), write(NewCount), write(' wool.'),
                            
                            useStamina(X, 20),

                            job(X, rancher) -> (
                                addExpRanching(X,80), addExpOverall(X,20)
                            );addExpRanching(X,40), addExpOverall(X,20)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 5, /* lvl Ranching 5 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 3 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(wool, NewCount),
                            write('you have collected '), write(NewCount), write(' wool.'),

                            useStamina(X, 20),

                            job(X, rancher) -> (
                                addExpRanching(X,80), addExpOverall(X,20)
                            );addExpRanching(X,40), addExpOverall(X,20)
                        );
                    !); noWool
                ); noStamina
            );

            User = 4 -> /* ================================ Cow ================================= */
            (
                (inInventory(Cow)),(itemCounter(Cow, Count)),
                currSteak(SteakCount), stamina(_,PrevStamina,_),
                PrevStamina >= 25 ->
                (
                    Count == 0 -> 
                    (    
                        write('you have no cow in your ranch.'), nl
                    );

                    Count > 0, SteakCount > 0 ->
                    (
                        level_rancher(X, LvlRanch), LvlRanch == 1, /* lvl Ranching 1 */
                        0 is Day mod 8 ->
                        (
                            save_inventory2(steak, Amount),
                            write('you have collected '), write(Count), write(' steak.'),
                            
                            useStamina(X, 25),

                            job(X, rancher) -> (
                                addExpRanching(X,100), addExpOverall(X,25)
                            );addExpRanching(X,50), addExpOverall(X,25)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 2, /* lvl Ranching 2 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 7 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(steak, NewCount),
                            write('you have collected '), write(NewCount), write(' steak.'),
                            
                            useStamina(X, 25),

                            job(X, rancher) -> (
                                addExpRanching(X,100), addExpOverall(X,25)
                            );addExpRanching(X,50), addExpOverall(X,25)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 3, /* lvl Ranching 3 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 6 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(steak, NewCount),
                            write('you have collected '), write(NewCount), write(' steak.'),
                            
                            useStamina(X, 25),

                            job(X, rancher) -> (
                                addExpRanching(X,100), addExpOverall(X,25)
                            );addExpRanching(X,50), addExpOverall(X,25)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 4, /* lvl Ranching 4 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 5 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(steak, NewCount),
                            write('you have collected '), write(NewCount), write(' steak.'),
                            
                            useStamina(X, 25),

                            job(X, rancher) -> (
                                addExpRanching(X,100), addExpOverall(X,25)
                            );addExpRanching(X,50), addExpOverall(X,25)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 5, /* lvl Ranching 5 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 4 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(steak, NewCount),
                            write('you have collected '), write(NewCount), write(' steak.'),

                            useStamina(X, 25),

                            job(X, rancher) -> (
                                addExpRanching(X,100), addExpOverall(X,25)
                            );addExpRanching(X,50), addExpOverall(X,25)
                        );
                    !); noSteak
                ); noStamina
            );
            
            User = 5 -> /* ================================ Horse ================================= */
            (
                (inInventory(Horse)),(itemCounter(Horse, Count)),
                currHorsemilk(HorsemilkCount), stamina(_,PrevStamina,_),
                PrevStamina >= 30 ->
                (
                    Count == 0 -> 
                    (    
                        write('you have no horse in your ranch.'), nl
                    );

                    Count > 0, HorsemilkCount > 0 ->
                    (
                        level_rancher(X, LvlRanch), LvlRanch == 1, /* lvl Ranching 1 */ 
                        0 is Day mod 9 ->
                        (
                            save_inventory2(horsemilk, Amount),
                            write('you have collected '), write(Count), write(' horsemilk.'),
                            
                            useStamina(X, 30),

                            job(X, rancher) -> (
                                addExpRanching(X,120), addExpOverall(X,30)
                            );addExpRanching(X,60), addExpOverall(X,30)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 2, /* lvl Ranching 2 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 8 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(horsemilk, NewCount),
                            write('you have collected '), write(NewCount), write(' horsemilk.'),
                            
                            useStamina(X, 30),

                            job(X, rancher) -> (
                                addExpRanching(X,120), addExpOverall(X,30)
                            );addExpRanching(X,60), addExpOverall(X,30)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 3, /* lvl Ranching 3 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 7 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(horsemilk, NewCount),
                            write('you have collected '), write(NewCount), write(' horsemilk.'),
                            
                            useStamina(X, 30),

                            job(X, rancher) -> (
                                addExpRanching(X,120), addExpOverall(X,30)
                            );addExpRanching(X,60), addExpOverall(X,30)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 4, /* lvl Ranching 4 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 6 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(horsemilk, NewCount),
                            write('you have collected '), write(NewCount), write(' horsemilk.'),
                            
                            useStamina(X, 30),

                            job(X, rancher) -> (
                                addExpRanching(X,120), addExpOverall(X,30)
                            );addExpRanching(X,60), addExpOverall(X,30)
                        );

                        level_rancher(X, LvlRanch), LvlRanch == 5, /* lvl Ranching 5 */
                        bucket(X, LvlBucket, _),
                        0 is Day mod 5 ->
                        (
                            NewCount is Count*LvlBucket,
                            save_inventory2(horsemilk, NewCount),
                            write('you have collected '), write(NewCount), write(' horsemilk.'),

                            useStamina(X, 30),

                            job(X, rancher) -> (
                                addExpRanching(X,120), addExpOverall(X,30)
                            );addExpRanching(X,60), addExpOverall(X,30)
                        );
                    !);
                !);
            !);
        !).
    
notRanch :-
    write('You cannot enter the ranch from here.'), nl.

noStamina :-
    write('You are to exhausted to ranch right now... Get some rest first and return tomorrow :)'), nl.

noEgg :-
    write('your chicken have not layed any egg.'), nl.

noMilk :-
    write('your chicken have not layed any milk.'), nl.

noWool :-
    write('your chicken have not layed any wool.'), nl.

noSteak :-
    write('your chicken have not layed any steak.'), nl.

noHorsemilk :-
    write('your chicken have not layed any horsemilk.'), nl.

:- dynamic(currMilk/1).
currMilk(MilkCount) :-
    level_rancher(X, LvlRanch), LvlRanch == 1, 0 is Day mod 6 -> MilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 2, 0 is Day mod 5 -> MilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 3, 0 is Day mod 4 -> MilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 4, 0 is Day mod 3 -> MilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 5, 0 is Day mod 2 -> MilkCount == 1;
    MilkCount == 0.

:- dynamic(currWool/1).
currWool(WoolCount) :-
    level_rancher(X, LvlRanch), LvlRanch == 1, 0 is Day mod 5 -> WoolCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 2, 0 is Day mod 4 -> WoolCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 3, 0 is Day mod 3 -> WoolCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 4, 0 is Day mod 2 -> WoolCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 5, 0 is Day mod 1 -> WoolCount == 1;
    WoolCount == 0.

:- dynamic(currSteak/1).
currSteak(SteakCount) :-
    level_rancher(X, LvlRanch), LvlRanch == 1, 0 is Day mod 5 -> SteakCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 2, 0 is Day mod 4 -> SteakCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 3, 0 is Day mod 3 -> SteakCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 4, 0 is Day mod 2 -> SteakCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 5, 0 is Day mod 1 -> SteakCount == 1;
    SteakCount == 0.

:- dynamic(currHorsemilk/1).
currHorsemilk(HorsemilkCount) :-
    level_rancher(X, LvlRanch), LvlRanch == 1, 0 is Day mod 5 -> HorsemilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 2, 0 is Day mod 4 -> HorsemilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 3, 0 is Day mod 3 -> HorsemilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 4, 0 is Day mod 2 -> HorsemilkCount == 1;
    level_rancher(X, LvlRanch), LvlRanch == 5, 0 is Day mod 1 -> HorsemilkCount == 1;
    HorsemilkCount == 0.
