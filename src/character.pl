/* character.pl */

/* job list */
isJob(fisherman).
isJob(farmer).
isJob(rancher).

/* Definisi job fisherman */

:- dynamic(createFisherman/1).
createFisherman(X) :- asserta(job(X, fisherman)),
                      asserta(level(X, 1)),
                      asserta(level_farming(X, 1)),
                      asserta(exp_farming(X, 56)),
                      asserta(level_fishing(X, 1)),
                      asserta(exp_fishing(X, 76)),
                      asserta(level_rancher(X, 1)),
                      asserta(exp_rancher(X, 56)),
                      asserta(stamina(X,100,100)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 1, 0)),
                      asserta(shovel(X, 1, 200)),
                      asserta(bucket(X, 1, 200)),
                      init.

/* Definisi job fisherman */

:- dynamic(createFarmer/1).
createFarmer(X) :-    asserta(job(X, farmer)),
                      asserta(level(X, 1)),
                      asserta(level_farming(X, 1)),
                      asserta(exp_farming(X, 76)),
                      asserta(level_fishing(X, 1)),
                      asserta(exp_fishing(X, 56)),
                      asserta(level_rancher(X, 1)),
                      asserta(exp_rancher(X, 56)),
                      asserta(stamina(X,100,100)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 1, 200)),
                      asserta(shovel(X, 1, 0)),
                      asserta(bucket(X, 1, 200)),
                      init.

/* Definisi job fisherman */

:- dynamic(createRancher/1).
createRancher(X) :-   asserta(job(X, rancher)),
                      asserta(level(X, 1)),
                      asserta(level_farming(X, 1)),
                      asserta(exp_farming(X, 56)),
                      asserta(level_fishing(X, 1)),
                      asserta(exp_fishing(X, 56)),
                      asserta(level_rancher(X, 1)),
                      asserta(exp_rancher(X, 76)),
                      asserta(stamina(X,100,100)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 1, 200)),
                      asserta(shovel(X, 1, 200)),
                      asserta(bucket(X, 1, 0)),
                      init.
init :- 
    asserta(reservedSpace(15)),  
    asserta(storeditem(corn, 5)), asserta(storeditem(chicken, 5)),
    asserta(storeditem(coconut, 5)).

/* Definisi Check Status */

checkStatus(Username) :-write(' _____  _                         _____ _        _              '), nl,             
                        write('|  __ \\| |                       / ____| |      | |             '), nl,
                        write('| |__) | | __ _ _   _  ___ _ _  | (___ | |_ __ _| |_ _   _ ___  '), nl,
                        write('|  ___/| |/ _` | | | |/ _ \\ \'\'_|  \\___ \\| __/ _` | __| | | / __| '), nl,
                        write('| |    | | (_| | |_| |  __/ |    ____) | || (_| | |_| |_| \\__ \\ '), nl,
                        write('|_|    |_|\\__,_|\\__, |\\___|_|   |_____/ \\__\\__,_|\\__|\\__,_|___/ '), nl,
                        write('                 __/ |                                          '), nl,
                        write('                |___/                                           '), nl, nl,

                        write('---------Your Status---------'), nl, nl,
                        write('Username       : '), write(Username), nl,
                        write('Job            : '), job(Username, Job), write(Job), nl,
                        write('Level          : '),
                        (level(Username, 5), write('MAX LEVEL!'), nl;
                        level(Username, Level), Level =\= 5, write(Level), nl),
                        write('Stamina        : '), stamina(Username, Stamina, StaminaCAP), write(Stamina), write('/'), write(StaminaCAP), nl,
                        write('EXP            : '), exp(Username, EXP), write(EXP), nl,
                        write('Gold           : '), gold(Username, Gold), write(Gold), nl, nl,
                        write('--- Farming ---'), nl,
                        write('Level Farmer  : '), level_farming(Username, LvlFarming), write(LvlFarming), nl,
                        write('EXP Farmer    : '), exp_farming(Username, ExpFarming), write(ExpFarming), nl, nl,
                        write('--- Fishing ---'), nl,
                        write('Level Fisherman  : '), level_fishing(Username, LvlFishing), write(LvlFishing), nl,
                        write('EXP Fisherman    : '), exp_fishing(Username, ExpFishing), write(ExpFishing), nl, nl,
                        write('--- Ranching ---'), nl,
                        write('Level Rancher  : '), level_rancher(Username, LvlRancher), write(LvlRancher), nl,
                        write('EXP Rancher    : '), exp_rancher(Username, ExpRancher), write(ExpRancher), nl, nl, !.

addExpOverall(X, Add) :-       
    exp(X, PrevEXP), 
    retract(exp(X, PrevEXP)), 
    NewEXP is PrevEXP + Add, 
    asserta(exp(X, NewEXP)),
    level(X, Level),
    write(Add), write(' EXP earned!'), nl,                  
    (
        Level < 2, NewEXP >= 2048 -> (
            retract(level(X, _)),
            asserta(level(X, 2)),
            addStaminaCAP(X, 50),
            write('You just leveled up to level 2!'), nl, nl
        );
        Level < 3, NewEXP >= 4096 -> (
            retract(level(X, _)),
            asserta(level(X, 3)),
            addStaminaCAP(X, 50),
            write('You just leveled up to level 3!'), nl, nl
        );
        Level < 4, NewEXP >= 8192 -> (
            retract(level(X, _)),
            asserta(level(X, 4)),
            addStaminaCAP(X, 50),
            write('You just leveled up to level 4!'), nl, nl
        );
        NewEXP >= 16384 -> (
            retract(level(X, _)),
            asserta(level(X, 5)), 
            addStaminaCAP(X, 50),
            write('You hit max level! You are a Harvest SuperStar!!'), nl, nl
        );
    !).

addExpFarming(X, Add) :-       
    exp_farming(X, PrevEXP), 
    retract(exp_farming(X, PrevEXP)), 
    NewEXP is PrevEXP + Add, 
    asserta(exp_farming(X, NewEXP)),
    level_farming(X, Level),
    write(Add), write(' Farming EXP earned!'), nl,                  
    (
        Level < 2, NewEXP >= 1024 -> (
            retract(level_farming(X, _)),
            asserta(level_farming(X, 2)),
            write('Your Farming Specialty just leveled up to level 2!'), nl, nl
        );
        Level < 3, NewEXP >= 2048 -> (
            retract(level_farming(X, _)),
            asserta(level_farming(X, 3)),
            write('Your Farming Specialty just leveled up to level 3!'), nl, nl
        );
        Level < 4, NewEXP >= 4096 -> (
            retract(level_farming(X, _)),
            asserta(level_farming(X, 4)),
            write('Your Farming Specialty just leveled up to level 4!'), nl, nl
        );
        NewEXP >= 8192 -> (
            retract(level_farming(X, _)),
            asserta(level_farming(X, 5)), 
            write('Your Farming Specialty hit max level! You are a Farming Specialist!!'), nl, nl
        );
    !).

addExpFishing(X, Add) :-       
    exp_fishing(X, PrevEXP), 
    retract(exp_fishing(X, PrevEXP)), 
    NewEXP is PrevEXP + Add, 
    asserta(exp_fishing(X, NewEXP)),
    level_fishing(X, Level),
    write(Add), write(' Fishing EXP earned!'), nl,                  
    (
        Level < 2, NewEXP >= 1024 -> (
            retract(level_fishing(X, _)),
            asserta(level_fishing(X, 2)),
            write('Your Fishing Specialty just leveled up to level 2!'), nl, nl
        );
        Level < 3, NewEXP >= 2048 -> (
            retract(level_fishing(X, _)),
            asserta(level_fishing(X, 3)),
            write('Your Fishing Specialty just leveled up to level 3!'), nl, nl
        );
        Level < 4, NewEXP >= 4096 -> (
            retract(level_fishing(X, _)),
            asserta(level_fishing(X, 4)),
            write('Your Fishing Specialty just leveled up to level 4!'), nl, nl
        );
        NewEXP >= 8192 -> (
            retract(level_fishing(X, _)),
            asserta(level_fishing(X, 5)), 
            write('Your Fishing Specialty hit max level! You are a Fishing Specialist!!'), nl, nl
        );
    !).

addExpRanching(X, Add) :-       
    exp_rancher(X, PrevEXP), 
    retract(exp_rancher(X, PrevEXP)), 
    NewEXP is PrevEXP + Add, 
    asserta(exp_rancher(X, NewEXP)),
    level_rancher(X, Level),
    write(Add), write(' Ranching EXP earned!'), nl,                  
    (
        Level < 2, NewEXP >= 1024 -> (
            retract(level_rancher(X, _)),
            asserta(level_rancher(X, 2)),
            write('Your Ranching Specialty just leveled up to level 2!'), nl, nl
        );
        Level < 3, NewEXP >= 2048 -> (
            retract(level_rancher(X, _)),
            asserta(level_rancher(X, 3)),
            write('Your Ranching Specialty just leveled up to level 3!'), nl, nl
        );
        Level < 4, NewEXP >= 4096 -> (
            retract(level_rancher(X, _)),
            asserta(level_rancher(X, 4)),
            write('Your Ranching Specialty just leveled up to level 4!'), nl, nl
        );
        NewEXP >= 8192 -> (
            retract(level_rancher(X, _)),
            asserta(level_rancher(X, 5)), 
            write('Your Ranching Specialty hit max level! You are a Ranching Specialist!!'), nl, nl
        );
    !).

useStamina(X, Delta) :-
    retract(stamina(X, PrevStamina, StaminaCAP)),
    NewStamina is PrevStamina - Delta, 
    asserta(stamina(X, NewStamina, StaminaCAP)), !.

addStaminaCAP(X, Add) :-
    retract(stamina(X, _, PrevStaminaCAP)),
    NewStaminaCAP is PrevStaminaCAP + Add, 
    asserta(stamina(X, NewStaminaCAP, NewStaminaCAP)),
    write('Your stamina has increased up to '), write(NewStaminaCAP), nl, nl, !.
