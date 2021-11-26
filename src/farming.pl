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
                    totalCS >= 1 -> /* CS -> coconut seed */
                    newCS is totalCS - 1,
                    update_CSCount(newCS),
                    plantCoconut(X,Y), /* nulis 'c' di tile + player pindah 1 tile di atas tile yg di plant */

                    newStamina is totalStamina - 10,
                    update_Stamina(newStamina),

                    timeToHarvestC = 1,
                    update_TimeCoconut(timeToHarvestC),

                    write('Planting finished! you have just planted a coconut seed!'), nl
                    ; write('you don\'t have enough coconut seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 2 -> /* nanem tomato */
            (
                totalStamina >= 10
                (
                    totalTS >= 1 ->
                    newTS is totalTS - 1,
                    update_TSCount(newTS),
                    plantTomato(X,Y), /* nulis 't' di tile + player pindah 1 tile di atas tile yg di plant */

                    newStamina is totalStamina - 10,
                    update_Stamina(newStamina),
                    
                    timeToHarvestT = 2,
                    update_TimeTomato(timeToHarvestT),
                    
                    write('Planting finished! you have just planted a Tomato seed!'), nl
                    ; write('you don\'t have enough Tomato seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 3 -> /* nanem mango */
            (
                totalStamina >= 10
                (
                    totalMS >= 1 ->
                    newMS is totalMS - 1,
                    update_MSCount(newMS),
                    plantMango(X,Y), /* nulis 'm' di tile + player pindah 1 tile di atas tile yg di plant */

                    newStamina is totalStamina - 10,
                    update_Stamina(newStamina),
                    
                    timeToHarvestM = 3,
                    update_TimeMango(timeToHarvestM),
                    
                    write('Planting finished! you have just planted a mango seed!'), nl
                    ; write('you don\'t have enough mango seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 4 -> /* nanem strawberry */
            (
                totalStamina >= 10
                (
                    totalSS >= 1 ->
                    newSS is totalSS - 1,
                    update_SSCount(newSS),
                    plantStrawberry(X,Y), /* nulis 's' di tile + player pindah 1 tile di atas tile yg di plant */

                    newStamina is totalStamina - 10,
                    update_Stamina(newStamina),
                    
                    timeToHarvestS = 3,
                    update_TimeStrawberry(timeToHarvestS),
                    
                    write('Planting finished! you have just planted a coconut seed!'), nl
                    ; write('you don\'t have enough coconut seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
            );

            User = 5 -> /* nanem baobab */
            (
                totalStamina >= 10
                (
                    totalBS >= 1 ->
                    newBS is totalBS - 1,
                    update_BSCount(newBS),
                    plantBaobab(X,Y), /* nulis 'b' di tile */

                    newStamina is totalStamina - 10,
                    update_Stamina(newStamina),
                    
                    timeToHarvestB = 4, 
                    update_TimeBaobab(timeToHarvestB),
                    
                    write('Planting finished! you have just planted a coconut seed!'), nl
                    ; write('you don\'t have enough coconut seed :('), nl
                ); noStamina /* + insert fungsi auto ganti hari */
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

/* update jumlah seed */
update_CoconutSeedCount :- 
    retract(coconut_seeds(User,_)), asserta(coconut_seeds(User,newCS)).

update_TomatoSeedCount :-
    retract(tomato_seeds(User,_)), asserta(tomato_seeds(User,newTS)).

update_MangoSeedCount :-
    retract(mango_seeds(User,_)), asserta(mango_seeds(User,newMS)).

update_StrawberrySeedCount :-
    retract(strawberry_seeds(User,_)), asserta(strawberry_seeds(User,newSS)).

update_BaobabSeedCount :-
    retract(baobab_seeds(User,_)), asserta(baobab_seeds(User,newBS)).

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
        plantCoconut(X,Y) ->
        (
            time_coconut(X,Y,0) ->
            (
                coconut(_,totalCoconut),
                newAmount is totalCoconut + 1,
                update_CoconutCount(newAmount),
                write('the wait is over! you successfully harvested a coconut!'), nl,
                
            ); stillGrowing
        );

        plantTomato(X,Y) ->
        (
            tomato(_,totalTomato),
            newAmount is totalTomato + 1,
            update_TomatoCount(newAmount),
            write('the wait is over! you successfully harvested a tomato!'), nl,

        ); stillGrowing

        plantMango(X,Y) ->
        (
            mango(_,totalMango),
            newAmount is totalMango + 1,
            update_MangoCount(newAmount),
            write('the wait is over! you successfully harvested a mango!'), nl,

        ); stillGrowing

        plantStrawberry(X,Y) ->
        (
            strawberry(_,totalStrawberry),
            newAmount is totalStrawberry + 1,
            update_StrawberryCount(newAmount),
            write('the wait is over! you successfully harvested a strawberry!'), nl,

        ); stillGrowing

        plantBaobab(X,Y) ->
        (
            baobab(_,totalBaobab),
            newAmount is totalBaobab + 1,
            update_BaobabCount(newAmount),
            write('the wait is over! you successfully harvested a baobab!'), nl,
    
        ); stillGrowing
    !).

stillGrowing :-
    write('Your plant is not ready to harvest yet, comeback here after a few days ^_^'), nl.

/* update jumlah taneman */
update_CoconutCount :-
    retract(coconut(User,_)), asserta(coconut(User,newAmount)).

update_TomatoCount :-
    retract(tomato(User,_)), asserta(tomato(User,newAmount)).

update_MangoCount :-
    retract(mango(User,_)), asserta(mango(User,newAmount)).

update_StrawberryCount :-
    retract(strawberry(User,_)), asserta(strawberry(User,newAmount)).

update_BaobabCount :-
    retract(baobab(User,_)), asserta(baobab(User,newAmount)).
