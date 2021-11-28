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
                      asserta(level_fishing(X, 5)),
                      asserta(exp_fishing(X, 76)),
                      asserta(level_rancher(X, 1)),
                      asserta(exp_rancher(X, 56)),
                      asserta(stamina(X,0)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 5, 0)),
                      asserta(shovel(X, 5, 200)),
                      asserta(bucket(X, 5, 200)).
baru :- 
    asserta(reservedSpace(10)),  
    asserta(storeditem(squid, 5)), asserta(storeditem(magic, 5)).

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
                      asserta(stamina(X,0)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 1, 200)),
                      asserta(shovel(X, 1, 0)),
                      asserta(bucket(X, 1, 200)).

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
                      asserta(stamina(X,0)),
                      asserta(exp(X, 0)),
                      asserta(gold(X, 1000)),
                      asserta(fishingrod(X, 1, 200)),
                      asserta(shovel(X, 1, 200)),
                      asserta(bucket(X, 1, 0)).

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
                        (level(Username, 50), write('MAX LEVEL!'), nl;
                        level(Username, Level), Level =\= 50, write(Level), nl),
                        write('--- Farming ---'), nl,
                        write('Level Farmer  : '), level_farming(Username, LvlFarming), write(LvlFarming), nl,
                        write('EXP Farmer    : '), exp_farming(Username, ExpFarming), write(ExpFarming), nl, nl,
                        write('--- Fishing ---'), nl,
                        write('Level Fisherman  : '), level_fishing(Username, LvlFishing), write(LvlFishing), nl,
                        write('EXP Fisherman    : '), exp_fishing(Username, ExpFishing), write(ExpFishing), nl, nl,
                        write('--- Raching ---'), nl,
                        write('Level Rancher  : '), level_rancher(Username, LvlRancher), write(LvlRancher), nl,
                        write('EXP Rancher    : '), exp_rancher(Username, ExpRancher), write(ExpRancher), nl, nl,
                        write('Stamina        : '), stamina(Username, Stamina), write(Stamina), nl,
                        write('EXP            : '), exp(Username, EXP), write(EXP), nl,
                        write('Gold           : '), gold(Username, Gold), write(Gold), nl, nl.
