/* farming.pl */

:- include('map.pl').
:- include('inventory.pl').
:- include('character.pl').

/* Definisi fungsi tanem taneman */
plantSeed :-
    dug(X,Y) -> /* nge check tile udh di dig blm dan player harus satu tile di atas tile yg udah di dig */
    (
        write('       wWWWw               wWWWw                     '), nl,
        write(' vVVVv (___) wWWWw         (___)  vVVVv              '), nl,
        write(' (___)  ~Y~  (___)  vVVVv   ~Y~   (___)              '), nl,
        write('  \\|   \\ |/   \\| /  \\~Y~/   \\|    \\ |/         '), nl,
        write(' \\\\|// \\\\|// \\\\|/// \\\\|//  \\\\|// \\\\\\|///'), nl,
        write('****************************************             '), nl, nl,
        
        write('What a sunny day! perfect time to do some Planting, right now you have:'), nl,
        (inInventory(Coconut_seed)),(itemCounter(Coconut_seed, Count), write('1.'), write(Count), write('coconut seed.')), nl,
        (inInventory(Tomato_seed)),(itemCounter(Tomato_seed, Count), write('2.'), write(Count), write('goat.')), nl,
        (inInventory(Mango_seed)),(itemCounter(Mango_seed, Count), write('3.'), write(Count), write('Mango_seed.')), nl,
        (inInventory(Strawberry_seed)),(itemCounter(Strawberry_seed, Count), write('4.'), write(Count), write('Strawberry_seed.')), nl,
        (inInventory(Baobab_seed)),(itemCounter(Baobab_seed, Count), write('5.'), write(Count), write('Baobab_seed.')), nl, nl,

        write('So, what are you planning to plant..?'), nl,
        write('<< Stamina requirement = 10 >>'), nl,
        read_integer(User), nl,
        (
            User = 1 -> /* nanem coconut */
            (
                stamina(_,PrevStamina,_),
                PrevStamina >= 10 ->
                (
                    storeditem(coconut_seed,Y), Y > 0  ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantCoconut(X,Y), /* nulis 'c' di tile + player pindah 1 tile di atas tile yg di plant */

                        useStamina(X, 10),

                        timeToHarvestC = 1,
                        update_TimeCoconut(timeToHarvestC),

                        write('Planting finished! you have just planted a coconut seed!'), nl
                    ); write('you don\'t have enough coconut seed :(')
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 2 -> /* nanem tomato */
            (
                stamina(_,PrevStamina,_),
                PrevStamina >= 10 ->
                (
                    storeditem(coconut_seed,Y), Y > 0 ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantTomato(X,Y), /* nulis 't' di tile + player pindah 1 tile di atas tile yg di plant */

                        useStamina(X, 10),
                        
                        timeToHarvestT = 2,
                        update_TimeTomato(timeToHarvestT),
                        
                        write('Planting finished! you have just planted a Tomato seed!'), nl

                    ); write('you don\'t have enough Tomato seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 3 -> /* nanem mango */
            (
                stamina(_,PrevStamina,_),
                PrevStamina >= 10 ->
                (
                    storeditem(coconut_seed,Y), Y > 0 ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantMango(X,Y), /* nulis 'm' di tile + player pindah 1 tile di atas tile yg di plant */

                        useStamina(X, 10),
                        
                        timeToHarvestM = 3,
                        update_TimeMango(timeToHarvestM),
                        
                        write('Planting finished! you have just planted a mango seed!'), nl

                    ); write('you don\'t have enough mango seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 4 -> /* nanem strawberry */
            (
                stamina(_,PrevStamina,_),
                PrevStamina >= 10 ->
                (
                    storeditem(coconut_seed,Y), Y > 0 ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantStrawberry(X,Y), /* nulis 's' di tile + player pindah 1 tile di atas tile yg di plant */

                        useStamina(X, 10),
                        
                        timeToHarvestS = 3,
                        update_TimeStrawberry(timeToHarvestS),
                        
                        write('Planting finished! you have just planted a coconut seed!'), nl
                    ); write('you don\'t have enough coconut seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 5 -> /* nanem baobab */
            (
                stamina(_,PrevStamina,_),
                PrevStamina >= 10 ->
                (
                    storeditem(coconut_seed,Y), Y > 0 ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantBaobab(X,Y), /* nulis 'b' di tile */

                        useStamina(X, 10),
                        
                        timeToHarvestB = 4, 
                        update_TimeBaobab(timeToHarvestB),
                        
                        write('Planting finished! you have just planted a coconut seed!'), nl

                    ); write('you don\'t have enough coconut seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            )
        )
    ).

notDug :-
    write('You cannot plant on this tile!'), nl.

/* stamina geming */
noStamina :-
    write('You are to exhausted to plant right now... Get some rest first and return tomorrow :)'), nl.

/* update waktu panen */
update_TimeCoconut :-
    retract(time_coconut(X,Y,_)), asserta(time_coconut(X,Y,timeToHarvestC).

update_TimeTomato :-
    retract(time_tomato(X,Y,_)), asserta(time_tomato(X,Y,timeToHarvestT).

update_TimeMango :-
    retract(time_mango(X,Y,_)), asserta(time_mango(X,Y,timeToHarvestM).

update_TimeStrawberry :-
    retract(time_strawberry(X,Y,_)), asserta(time_strawberry(X,Y,timeToHarvestS).

update_TimeBaobab :-
    retract(time_baobab(X,Y,_)), asserta(time_baobab(X,Y,timeToHarvestB).


/*-------------------------------*/
/* Definisi fungsi panen taneman */
harvestPlant :- /* dengan syarat player berada satu tile di atas tile yang ingin di harvest dengan indikator salah satu inisial tenaman (ex. 'c', 'm', dst) */
    playerPosition(X,Y,'P')
    (
        plantCoconut(X,Y)->
        (
            time_coconut(X,Y,0) ->
            (
                shovel(_, LvlShovel, _),
                NewAmount is LvlShovel,
                save_inventory2(coconut, NewAmount),
                write('the wait is over! you successfully harvested '), write(NewAmount), write(' coconut.'), nl,

                useStamina(X, 10),

                job(X, rancher) -> (
                    addExpFarming(X,50), addExpOverall(X,10)
                );addExpFarming(X,25), addExpOverall(X,10)
                
            ); stillGrowing
        );

        plantTomato(X,Y)->
        (
            time_tomato(X,Y,0) ->
            (
                shovel(X, LvlShovel, _),
                NewAmount is LvlShovel,
                save_inventory2(coconut, NewAmount),
                write('the wait is over! you successfully harvested '), write(NewAmount), write(' tomato.'), nl,

                useStamina(X, 10),

                job(X, rancher) -> (
                    addExpFarming(X,50), addExpOverall(X,10)
                );addExpFarming(X,25), addExpOverall(X,10)

            ); stillGrowing
        );

        plantMango(X,Y)->
        (
            time_mango(X,Y,0) ->
            (
                shovel(_, LvlShovel, _),
                NewAmount is LvlShovel,
                save_inventory2(coconut, NewAmount),
                write('the wait is over! you successfully harvested '), write(NewAmount), write(' mango.'), nl,

                useStamina(X, 10),

                job(X, rancher) -> (
                    addExpFarming(X,50), addExpOverall(X,10)
                );addExpFarming(X,25), addExpOverall(X,10)

            ); stillGrowing
        );

        plantStrawberry(X,Y)->
        (
            time_strawberry(X,Y,0) ->
            (
                shovel(_, LvlShovel, _),
                NewAmount is LvlShovel,
                save_inventory2(coconut, NewAmount),
                write('the wait is over! you successfully harvested '), write(NewAmount), write(' strawberry.'), nl,

                useStamina(X, 10),

                job(X, rancher) -> (
                    addExpFarming(X,50), addExpOverall(X,10)
                );addExpFarming(X,25), addExpOverall(X,10)

            ); stillGrowing
        );

        plantBaobab(X,Y)->
        (
            time_baobab(X,Y,0) ->
            (
                shovel(_, LvlShovel, _),
                NewAmount is LvlShovel,
                save_inventory2(coconut, NewAmount),
                write('the wait is over! you successfully harvested '), write(NewAmount), write(' baobab.'), nl,

                useStamina(X, 10),

                job(X, rancher) -> (
                    addExpFarming(X,50), addExpOverall(X,10)
                );addExpFarming(X,25), addExpOverall(X,10)

            ); stillGrowing
        !);
    ); noPlant.

stillGrowing :-
    write('Your plant is not ready to harvest yet, comeback here after a few days ^_^'), nl.

noPlant :-
    write('There is no plant to harvest.')
