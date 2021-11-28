/* farming.pl */

:- include('map.pl').
:- include('inventory.pl').

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
        
        write('What a sunny day! perfect time to do some Planting, right now you have:')
        write('1.'), write(CoconutSeedCount), write('coconut seed'), nl,
        write('2.'), write(TomatoSeedCount), write('tomato seed'), nl,
        write('3.'), write(MangoSeedCount), write('mango seed'), nl,
        write('4.'), write(StrawberrySeedCount), write('strawberry seed'), nl,
        write('5.'), write(BaobabSeedCount), write('baobab seed'), nl, nl,

        write('So, what are you planning to plant..?'), nl,
        write('<< Stamina requirement = 10 >>'), nl,
        read_integer(User), nl,
        (
            User = 1 -> /* nanem coconut */
            (
                totalStamina >= 10
                (
                    storeditem(coconut_seed,Y) ->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantCoconut(X,Y), /* nulis 'c' di tile + player pindah 1 tile di atas tile yg di plant */

                        newStamina is totalStamina - 10,
                        update_Stamina(newStamina),

                        timeToHarvestC = 1,
                        update_TimeCoconut(timeToHarvestC),

                        write('Planting finished! you have just planted a coconut seed!'), nl
                    ); write('you don\'t have enough coconut seed :('), nl
                ); noStamina. /* + insert fungsi auto ganti hari */
            );

            User = 2 -> /* nanem tomato */
            (
                totalStamina >= 10
                (
                    storeditem(coconut_seed,Y)->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantTomato(X,Y), /* nulis 't' di tile + player pindah 1 tile di atas tile yg di plant */

                        newStamina is totalStamina - 10,
                        update_Stamina(newStamina),
                        
                        timeToHarvestT = 2,
                        update_TimeTomato(timeToHarvestT),
                        
                        write('Planting finished! you have just planted a Tomato seed!'), nl

                    ); write('you don\'t have enough Tomato seed :('), nl
                ); noStamina. /* + insert fungsi auto ganti hari */
            );

            User = 3 -> /* nanem mango */
            (
                totalStamina >= 10
                (
                    storeditem(coconut_seed,Y)->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantMango(X,Y), /* nulis 'm' di tile + player pindah 1 tile di atas tile yg di plant */

                        newStamina is totalStamina - 10,
                        update_Stamina(newStamina),
                        
                        timeToHarvestM = 3,
                        update_TimeMango(timeToHarvestM),
                        
                        write('Planting finished! you have just planted a mango seed!'), nl

                    ); write('you don\'t have enough mango seed :('), nl
                ); noStamina. /* + insert fungsi auto ganti hari */
            );

            User = 4 -> /* nanem strawberry */
            (
                totalStamina >= 10
                (
                    storeditem(coconut_seed,Y)->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantStrawberry(X,Y), /* nulis 's' di tile + player pindah 1 tile di atas tile yg di plant */

                        newStamina is totalStamina - 10,
                        update_Stamina(newStamina),
                        
                        timeToHarvestS = 3,
                        update_TimeStrawberry(timeToHarvestS),
                        
                        write('Planting finished! you have just planted a coconut seed!'), nl
                    ); write('you don\'t have enough coconut seed :('), nl
                ); noStamina. /* + insert fungsi auto ganti hari */
            );

            User = 5 -> /* nanem baobab */
            (
                totalStamina >= 10
                (
                    storeditem(coconut_seed,Y)->
                    (
                        delete_inventory(coconut_seed,Used),
                        playerPosition(X,Y,'P'),
                        plantBaobab(X,Y), /* nulis 'b' di tile */

                        newStamina is totalStamina - 10,
                        update_Stamina(newStamina),
                        
                        timeToHarvestB = 4, 
                        update_TimeBaobab(timeToHarvestB),
                        
                        write('Planting finished! you have just planted a coconut seed!'), nl

                    ); write('you don\'t have enough coconut seed :('), nl
                ); noStamina. /* + insert fungsi auto ganti hari */
            );
        !).
    ); notDug.

notDug :-
    write('You cannot plant on this tile!'), nl.

/* stamina geming */
noStamina :-
    write('You are to exhausted to plant right now... Get some rest first and return tomorrow :)'), nl.

update_Stamina :-
    retract(stamina(User,_)), asserta(stamina(User,newStamina)).


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
    (
        plantCoconut(X,Y), playerPosition(X,Y,'P') ->
        (
            time_coconut(X,Y,0) ->
            (
                save_inventory(coconut),
                write('the wait is over! you successfully harvested a coconut!'), nl,
                
            ); stillGrowing.
        );

        plantTomato(X,Y), playerPosition(X,Y,'P') ->
        (
            save_inventory(tomato),
            write('the wait is over! you successfully harvested a tomato!'), nl,

        ); stillGrowing.

        plantMango(X,Y), playerPosition(X,Y,'P') ->
        (
            save_inventory(mango),
            write('the wait is over! you successfully harvested a mango!'), nl,

        ); stillGrowing.

        plantStrawberry(X,Y), playerPosition(X,Y,'P') ->
        (
            save_inventory(strawberry),
            expAdd
            write('the wait is over! you successfully harvested a strawberry!'), nl,

        ); stillGrowing.

        plantBaobab(X,Y), playerPosition(X,Y,'P') ->
        (
            save_inventory(baobab),
            write('the wait is over! you successfully harvested a baobab!'), nl,
    
        ); stillGrowing.
    ); noPlant.

stillGrowing :-
    write('Your plant is not ready to harvest yet, comeback here after a few days ^_^'), nl.

noPlant :-
    write('There is no plant to harvest.')
