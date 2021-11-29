/* main.pl */

/* supporting files */

:- include('src/character.pl').
%:- include('src/farming.pl').
:- include('src/fishing.pl').
:- include('src/house.pl').
:- include('src/inventory.pl').
:- include('src/map.pl').
:- include('src/marketplace.pl').
:- include('src/quest.pl').

:- dynamic(started/1).

startGame :-     started(_), write('You had started your journey. Let\'s collect 20000 Gold in 365 days!'), nl.
startGame :-
    nl,
    write(' $$\\   $$\\                                                     $$\\            $$$$$$\\    $$\\                                    '), nl,
    write(' $$ |  $$ |                                                    $$ |          $$  __$$\\   $$ |                                       '), nl,
    write(' $$ |  $$ | $$$$$$\\   $$$$$$\\ $$\\    $$\\  $$$$$$\\   $$$$$$$\\ $$$$$$\\         $$ /  \\__|$$$$$$\\    $$$$$$\\   $$$$$$\\       '), nl,
    write(' $$$$$$$$ | \\____$$\\ $$  __$$\\\\$$\\  $$  |$$  __$$\\ $$  _____|\\_$$  _|        \\$$$$$$\\  \\_$$  _|   \\____$$\\ $$  __$$\\    '), nl,
    write(' $$  __$$ | $$$$$$$ |$$ |  \\__|\\$$\\$$  / $$$$$$$$ |\\$$$$$$\\    $$ |           \\____$$\\   $$ |     $$$$$$$ |$$ |  \\__|        '), nl,
    write(' $$ |  $$ |$$  __$$ |$$ |       \\$$$  /  $$   ____| \\____$$\\   $$ |$$\\       $$\\   $$ |  $$ |$$\\ $$  __$$ |$$ |                '), nl,
    write(' $$ |  $$ |\\$$$$$$$ |$$ |        \\$  /   \\$$$$$$$\\ $$$$$$$  |  \\$$$$  |      \\$$$$$$  |  \\$$$$  |\\$$$$$$$ |$$ |              '), nl,
    write(' \\__|  \\__| \\_______|\\__|         \\_/     \\_______|\\_______/    \\____/        \\______/    \\____/  \\_______|\\__|          '), nl,
    nl, nl,            
    write('Let\'s play and pay our debts together!'), nl, nl,
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl,
    write('$    1. Start Your Journey   $'), nl,
    write('$    2. About This Game      $'), nl,
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl, nl,
    write('>'), read_integer(Menu),
    (Menu = 1 ->
        start
    ;
    Menu = 2 -> 
        about
    ; !).


start    :-     started(_), write('You had started your journey. Let\'s collect 20000 Gold in 365 days!'), nl.
start    :-     \+started(_), asserta(started(true)),
                write('Welcome to Harvest Star. Choose your job'), nl, nl,
                write('1. Fisherman'), nl, 
                write('2. Farmer'), nl, 
                write('3. Rancher'), nl,
                write('>'), read_integer(JobChoice), nl,
                (
                    JobChoice = 1 -> createFisherman(Username),
                        write('     ,%&& %&& %'                               ), nl,  
                        write('   ,%&%& %&%& %&'                              ), nl,   
                        write('  %& %&% &%&% % &%'                            ), nl,
                        write(' % &%% %&% &% %&%&,'                           ), nl,
                        write(' &%&% %&%& %& &%& %'                           ), nl,
                        write('%%& %&%& %&%&% %&%%&'                          ), nl,
                        write('&%&% %&% % %& &% %%&'                          ), nl,
                        write('&& %&% %&%& %&% %&%\''                          ), nl,
                        write(' \'%&% %&% %&&%&%%\'%'                           ), nl,
                        write('  % %& %& %&% &%%'                             ), nl,
                        write('    `\\%%.\'  /`%&\''                             ), nl,
                        write('      |    |            /`-._           _\\/'  ), nl,
                        write('      |,   |_          /     `-._ ..--~`_'     ), nl,
                        write('      |;   |_`\\_      /  ,\\.~`  `-._ -  ^'    ), nl,
                        write('      |;:  |/^}__..-,@   .~`    ~    `o ~'     ), nl,
                        write('      |;:  |(____.-\'     \'.   ~   -    `    ~' ), nl,
                        write('      |;:  |  \\ / `\\       //.  -    ^   ~'    ), nl,
                        write('      |;:  |\\ /\' /\\_\\_        ~. _ ~   -   //-'), nl,
                        write('    \\\\/;:   \\\'--\' `---`           `\\\\//-\\\\///' ), nl, nl,
                        write('You choose Fisherman!, let\'s start fishing!'), nl
                    ;
                    JobChoice = 2 -> createFarmer(Username),
                        write('                               ,%%%%,             '), nl,                  
                        write('                             %%%%%%%%             '), nl,                  
                        write('                             ###%%%%%%%%&%%%%(    '), nl,                  
                        write('                        ,%%%&&@*&&@*%%%%&#        '), nl,                  
                        write('          *          &%&&&&%(,**,**,###           '), nl,                  
                        write('  .   ,                     .&/#&@,,,,            '), nl,                  
                        write('  ,    *   ,                ,,*,,,,,(%%(#         '), nl,                  
                        write('   *   *.  **            .&##    ,###%######      '), nl,                  
                        write('   *,  **. **           ,%(#(# ######%%%#######   '), nl,                  
                        write('    ********,          #%%###########%&%########( '), nl,                  
                        write('        ,*            #%%###########%%&&&    #####'), nl,                  
                        write('         ..         /#%#############%%%&%% ####(  '), nl,                  
                        write('         ,,,  *%%%%%%%#############%%%%%%####.    '), nl,                  
                        write('         ,,*(%%%%%%%%%(############%%%%,,,,.      '), nl,                  
                        write('           #          (###########%%%%%,,,,       '), nl,                  
                        write('            #         &(################          '), nl,                  
                        write('            #.          ###############/          '), nl,                  
                        write('             #          ((((((# (((((#(           '), nl,                  
                        write('             *(        ((((((   /#(((#            '), nl,                  
                        write('              #       /((((      (((#             '), nl,                  
                        write('              .#      ((##       (((#             '), nl,                  
                        write('               #.   #(((#       %%%%&             '), nl,                  
                        write('                #   %%%%&        %%&&             '), nl,                  
                        write('                #/ %%&,          %&&              '), nl,                  
                        write('                 #%%&           %%&#              '), nl,                  
                        write('            %%%%%%&%&...........%%%&              '), nl,nl,
                        write('You choose Farmer!, let\'s start farming!'), nl
                    ;
                    JobChoice = 3 -> createRancher(Username),
                        write('                                                                  /%%##(#    '), nl,                       
                        write('                                                                 *%&,#&%&%%  '), nl,                       
                        write('                                                                  ..,.,,@    '), nl,                       
                        write('           /%&&&&&/...............&&&&&&@&&&&&&@     &&/#&(       ,/**#*     '), nl,                      
                        write('       .&&&&&&&& .................(&&&&&&@&&&&&&&% @&&&&&&&&,   (&%%%(/%%%   '), nl,                      
                        write('      /&&&&&&&&&,...................  .  .... #&&&@  &&@ &&&&&   %%%%%  %%   '), nl,                     
                        write('      &&&&&&&&&&&.........&&&&   .&&&@@.......((&&&& 0...0..     (%%%%.  %%  '), nl,                     
                        write('      &@# ................#&&&&&&/.............*#  ...           /%%%%%%  &% '), nl,                      
                        write('        ........./.................., .. #%.....*,**,,*,          %%%%%%%. ,*'), nl,                      
                        write('       ,....... &#&#..............&&&&&&&&&&@..      * ,,         %%%,%#%    '), nl,                      
                        write('      ,  ..*&&&@&@............... &&&&&&&&&&&@,.                  /%% #%(    '), nl,             
                        write('     *  /&&&&@,,,,,,,,..........&&&&&&&&&&&*,**.                  ,%% %%     '), nl,            
                        write('(((     /&&&&,*,,,,,,,**.          (&&&&   ****.                   %# %%.    '), nl,              
                        write('         .. .**   ,                .&&&&   .**,                   #% %%%/    '), nl,              
                        write('         ....*                      &&&.(****                     %%  %&     '), nl,                     
                        write('         ...**                      ....&&                        **  **     '), nl,                     
                        write('        ,&&&@@                      @&&&                         ***  **     '), nl,nl,
                        write('You choose Rancher!, let\'s start ranching!'), nl
                ; !), gameMenu.

gameMenu :-
    checkGoal, nl, nl,
    write('What do you want to do?'), nl,
    write('1. Check Player Status'), nl,
    write('2. Check Map'), nl,
    write('3. Check Inventory'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read_integer(MenuChoice), nl,
    (
        MenuChoice = 1 -> (checkStatus(Username), gameMenu);
        MenuChoice = 2 -> (drawmap, gameMenu);
        MenuChoice = 3 -> (show_inventory, gameMenu);
        MenuChoice = 4 -> (moveMenu, gameMenu);
        MenuChoice = 5 -> (gameProgress, gameMenu);
        %MenuChoice = 6 -> (/*quitgame*/);
    !).

moveMenu :-
    write('Which way you want to move?'), nl,
    write('1. North (^)'), nl,
    write('2. South (v)'), nl,
    write('3. East  (>)'), nl,
    write('4. West  (<)'), nl,
    write('>'), read_integer(Walk), nl,
    (
        Walk = 1 -> w;
        Walk = 2 -> s;
        Walk = 3 -> d;
        Walk = 4 -> a;
    !).

w :- playerPosition(X,Y,'P') , NewY is Y - 1,
	(	
		\+isWall(X,NewY), \+waterTile(X,NewY), \+questTile(X,NewY), \+alchemistTile(X,NewY), \+marketplaceTile(X,NewY), \+ranchTile(X,NewY), \+houseTile(X,NewY), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		isWall(X,NewY),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(X,NewY),! ->
			fishing, nl, drawmap;
        isTempatfishing(X,NewY),! ->
			fishingTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		questTile(X,NewY),! ->
			questTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		alchemistTile(X,NewY),! ->
			alchemistTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		marketplaceTile(X,NewY),! ->
			marketplaceTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		ranchTile(X,NewY),! ->
			ranchTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		houseTile(X,NewY),! ->
			houseTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'))
	).

a :- playerPosition(X,Y,'P') , NewX is X - 1,
	(	
		\+isWall(NewX,Y), \+waterTile(NewX,Y), \+questTile(NewX,Y) ,\+alchemistTile(NewX,Y),\+marketplaceTile(NewX,Y), \+ranchTile(NewX,Y), \+houseTile(NewX,Y), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		isWall(NewX,Y),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(NewX,Y),! ->
			fishing, nl, drawmap;
        isTempatfishing(NewX,Y),! ->
			fishingTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		questTile(NewX,Y),! ->
			questTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		alchemistTile(NewX,Y),! ->
			alchemistTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		marketplaceTile(NewX,Y),! ->
			marketplaceTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		ranchTile(NewX,Y),! ->
			ranchTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		houseTile(NewX,Y),! ->
			houseTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'))	
	).

s :- playerPosition(X,Y,'P') , NewY is Y + 1,
	(	
		\+isWall(X,NewY), \+waterTile(X,NewY),\+questTile(X,NewY) , \+alchemistTile(X,NewY), \+marketplaceTile(X,NewY), \+ranchTile(X,NewY), \+houseTile(X,NewY), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		isWall(X,NewY),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(X,NewY),! ->
			fishing, nl, drawmap;
        isTempatfishing(X,NewY),! ->
			fishingTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		questTile(X,NewY),! ->
			questTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		alchemistTile(X,NewY),! ->
			alchemistTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		marketplaceTile(X,NewY),! ->
			marketplaceTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		ranchTile(X,NewY),! ->
            ranchTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'));
		houseTile(X,NewY),! ->
            houseTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P'))		
	).

d :- playerPosition(X,Y,'P') , NewX is X + 1,
	(	
		\+isWall(NewX,Y), \+waterTile(NewX,Y), \+questTile(NewX,Y), \+alchemistTile(NewX,Y),\+marketplaceTile(NewX,Y), \+ranchTile(NewX,Y), \+houseTile(NewX,Y), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		isWall(NewX,Y),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(NewX,Y),! ->
			fishing ,nl, drawmap;
        isTempatfishing(NewX,Y),! ->
			fishingTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		questTile(NewX,Y),! ->
			questTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		alchemistTile(NewX,Y),! ->
			alchemistTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		marketplaceTile(NewX,Y),! ->
			marketplaceTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		ranchTile(NewX,Y),! ->
			ranchTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'));
		houseTile(NewX,Y),! ->
			houseTileMenu,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P'))	
	).

houseTileMenu :-
    write('You are in front of your home sweet home. Do you want to get in? (y/n)'), nl,
    write('>'), read(HMenuChoice), nl,
    (
        HMenuChoice = y -> (house);
        HMenuChoice = n -> (gameMenu);
    !).

marketplaceTileMenu :-
    write('You are in front of the marketplace. Do you want to get in? (y/n)'), nl,
    write('>'), read(MMenuChoice), nl,
    (
        MMenuChoice = y -> (marketplace);
        MMenuChoice = n -> (gameMenu);
    !).

ranchTileMenu :-
    write('You are in front of the ranching house. Do you want to go ranching? (y/n)'), nl,
    write('>'), read(RMenuChoice), nl,
    (
        RMenuChoice = y -> (enterRanch);
        RMenuChoice = n -> (gameMenu);
    !).

alchemistTileMenu :-
    write('You are in front of the famous alchemist house. Do you want to get in? (y/n)'), nl,
    write('>'), read(AMenuChoice), nl,
    (
        AMenuChoice = y -> (alce);
        AMenuChoice = n -> (gameMenu);
    !).

questTileMenu :-
    write('You are in front of the quest tower. Do you want to get in? (y/n)'), nl,
    write('>'), read(QMenuChoice), nl,
    (
        QMenuChoice = y -> (quest);
        QMenuChoice = n -> (gameMenu);
    !).

fishingTileMenu :-
    write('You are near the fishing pond. Do you want to go fishing? (y/n)'), nl,
    write('>'), read(WMenuChoice), nl,
    (
        WMenuChoice = y -> (fishing);
        WMenuChoice = n -> (gameMenu);
    !).
/*
groundTileMenu :-
    write('You are on the farming ground. Do you want to go farming? (y/n)'), nl,
    write('>'), read(FMenuChoice), nl,
    (
        FMenuChoice = y -> (farming);
        FMenuChoice = n -> (gameMenu);
    !).
*/
about :-
    write('You owned a famous company back then, but one of your client scammed you and your company to a big debt.'), nl,
    write('The debt collector from Bank chased you to pay the debt, unfortunately you are broke right now.'), nl,
    write('They give you a chance for you to pay the debt in 365 days.'), nl,
    write('Can you collect 20000 Gold in 365 days to pay the debt?').

gameProgress :-
    day(DayNow),
    gold(_, GoldNow),
    Deadline is 366 - DayNow,
    Debt is 20000 - GoldNow,
    write('You have '), write(Deadline), write(' more days to collect '), write(Debt), write(' more Gold.'), nl, nl, !.

checkGoal :-
    day(DayToday),
    gold(_, Golds),
    (
        Golds >= 20000, DayToday =< 365 -> (
            write('Congrats!!!'), nl,
            write('Your hardwork just paid off your debt.'), nl,
            write('The debt collector will no longer chase you and you will live a peaceful world.'), nl,
            write('Good game...'), nl
        );
        Golds < 20000, DayToday >= 365 -> (
            write('Oh no!'), nl,
            write('You have given 365 days to collect 20000 Golds, unfortunately you failed :('), nl,
            write('We are sorry to tell you that the debt collector is waiting for you outside the borders.'), nl,
            write('The end...'), nl
        );
    !).

quitMechanism :-
    retractall(started(_)), retractall(job(_,_)), retractall(level(_,_)),
    retractall(level_farming(_,_)), retractall(level_fishing(_,_)), retractall(level_rancher(_,_)),
    retractall(exp_farming(_,_)), retractall(exp_fishing(_,_)), retractall(exp_rancher(_,_)),
    retractall(exp(_,_)), retractall(gold(_,_)), retractall(stamina(_,_,_)),
    retractall(fishingrod(_,_,_)), retractall(shovel(_,_,_)), retractall(bucket(_,_,_)),
    retractall(reservedSpace(_)), retractall(storeditem(_,_)), retractall(inInventory(_)),
    retractall(inventory(_)), retractall(day(_)).

quitGame :-
    write('Are you sure you want to quit Harvest Star? '), read(Quit), nl,
    (
        Quit == yes -> 
            write('Till we meet again, then!'), nl,
            quitMechanism
        ;
        write('Pyuuhh. Let us continue, then!'), nl;
    !).

/*          
help :-
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl,
    write('$    1. start    : start the game            $'), nl,
    write('$    2. map      : display map               $'), nl,
    write('$    3. status   : display player status     $'), nl,
    write('$    4. w        : move north 1 tile         $'), nl,
    write('$    5. s        : move south 1 tile         $'), nl,
    write('$    6. d        : move east 1 tile          $'), nl,
    write('$    7. a        : move west 1 tile          $'), nl,
    write('$    8. help     : display help              $'), nl,
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl, nl,
    write('continue? (yes or no)'), nl, nl,
    read(Users), nl,
    (
        Users = yes ->
            startGame
        ;

        Users = no ->
            leave
        ;
    !).
*/