/* main.pl */

/* supporting files */

:- include('src/character.pl').
:- include('src/farming.pl').
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
                write('>'), read(JobChoice), nl,
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
    write('What do you want to do?'), nl,
    write('1. Check Player Status'), nl,
    write('2. Check Map'), nl,
    write('3. Check Inventory'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(MenuChoice), nl,
    (
        MenuChoice = 1 -> (checkStatus(_));
        MenuChoice = 2 -> (drawmap);
        MenuChoice = 3 -> (show_inventory);
        MenuChoice = 4 -> (moveMenu);
        MenuChoice = 5 -> (gameProgress);
        MenuChoice = 6 -> (/*quitgame*/);
    !).

moveMenu :-
    write('Which way you want to move?'), nl,
    write('1. North (^)'), nl,
    write('2. South (v)'), nl,
    write('3. East  (>)'), nl,
    write('4. West  (<)'), nl,
    write('>'), read(Walk), nl,
    (
        Walk = 1 -> w;
        Walk = 2 -> s;
        Walk = 3 -> d;
        Walk = 4 -> a;
    !).

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

waterTileMenu :-
    write('You are near the fishing pond. Do you want to go fishing? (y/n)'), nl,
    write('>'), read(WMenuChoice), nl,
    (
        WMenuChoice = y -> (fishing);
        WMenuChoice = n -> (gameMenu);
    !).

groundTileMenu :-
    write('You are on the farming ground. Do you want to go farming? (y/n)'), nl,
    write('>'), read(FMenuChoice), nl,
    (
        FMenuChoice = y -> (/*farming*/);
        FMenuChoice = n -> (gameMenu);
    !).

about :-
    write('You were a famous designer back then, but one of your client cheated and refused to pay your work.'), nl,
    write('').  

gameProgress :-
    day(DayNow),
    gold(_, GoldNow),
    Deadline is 366 - DayNow,
    Debt is 20000 - GoldNow,
    write('You have '), write(Deadline), write(' more days to collect '), write(Debt), write(' more Gold.'), nl, nl, !.

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