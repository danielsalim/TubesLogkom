/* main.pl */

/* supporting files */

:- include('character.pl').
:- include('farming.pl').
:- include('fishing.pl').
:- include('house.pl').
:- include('inventory.pl').
:- include('map.pl').
:- include('marketplace.pl').
:- include('quest.pl').

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
                ; !), initialGameMenu.

initialGameMenu :-
    write('hello world'), nl,
    write('What do you want to do?'), nl,
    write('1. Check Player Status'), nl,
    write('2. Check Map'), nl,
    write('3. Move'), nl,
    write('4. Game Progress'), nl,
    write('5. Quit Game'), nl,
    write('>'), read(MenuChoice), nl,
    (
        MenuChoice = 1 -> (/*status*/);
        MenuChoice = 2 -> (/*map*/);
        MenuChoice = 3 -> (/*movemenu*/);
        MenuChoice = 4 -> (/*gameprogress*/);
        MenuChoice = 5 -> (/*quitgame*/);
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
    write('You are in front of the house.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter House Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(HMenuChoice), nl,
    (
        HMenuChoice = 1 -> (/*house*/);
        HMenuChoice = 2 -> (/*status*/);
        HMenuChoice = 3 -> (/*map*/);
        HMenuChoice = 4 -> (/*movemenu*/);
        HMenuChoice = 5 -> (/*gameprogress*/);
        HMenuChoice = 6 -> (/*quitgame*/);
    !).

marketplaceTileMenu :-
    write('You are in front of the marketplace.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Marketplace Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(MMenuChoice), nl,
    (
        MMenuChoice = 1 -> (/*marketplace*/);
        MMenuChoice = 2 -> (/*status*/);
        MMenuChoice = 3 -> (/*map*/);
        MMenuChoice = 4 -> (/*movemenu*/);
        MMenuChoice = 5 -> (/*gameprogress*/);
        MMenuChoice = 6 -> (/*quitgame*/);
    !).

ranchTileMenu :-
    write('You are in front of the ranching place.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Ranching Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(RMenuChoice), nl,
    (
        RMenuChoice = 1 -> (/*ranching*/);
        RMenuChoice = 2 -> (/*status*/);
        RMenuChoice = 3 -> (/*map*/);
        RMenuChoice = 4 -> (/*movemenu*/);
        RMenuChoice = 5 -> (/*gameprogress*/);
        RMenuChoice = 6 -> (/*quitgame*/);
    !).

alchemistTileMenu :-
    write('You are in front of the famous alchemist house.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Alchemist Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(AMenuChoice), nl,
    (
        AMenuChoice = 1 -> (/*alchemist*/);
        AMenuChoice = 2 -> (/*status*/);
        AMenuChoice = 3 -> (/*map*/);
        AMenuChoice = 4 -> (/*movemenu*/);
        AMenuChoice = 5 -> (/*gameprogress*/);
        AMenuChoice = 6 -> (/*quitgame*/);
    !).

questTileMenu :-
    write('You are in front of the quest place.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Quest Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(QMenuChoice), nl,
    (
        QMenuChoice = 1 -> (/*quest*/);
        QMenuChoice = 2 -> (/*status*/);
        QMenuChoice = 3 -> (/*map*/);
        QMenuChoice = 4 -> (/*movemenu*/);
        QMenuChoice = 5 -> (/*gameprogress*/);
        QMenuChoice = 6 -> (/*quitgame*/);
    !).

waterTileMenu :-
    write('You are near the fishing pond.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Fishing Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(WMenuChoice), nl,
    (
        WMenuChoice = 1 -> (/*fishing*/);
        WMenuChoice = 2 -> (/*status*/);
        WMenuChoice = 3 -> (/*map*/);
        WMenuChoice = 4 -> (/*movemenu*/);
        WMenuChoice = 5 -> (/*gameprogress*/);
        WMenuChoice = 6 -> (/*quitgame*/);
    !).

groundTileMenu :-
    write('You are on the farming ground.'), nl,
    write('What do you want to do?'), nl,
    write('1. Enter Farming Menu'), nl,
    write('2. Check Player Status'), nl,
    write('3. Check Map'), nl,
    write('4. Move'), nl,
    write('5. Game Progress'), nl,
    write('6. Quit Game'), nl,
    write('>'), read(FMenuChoice), nl,
    (
        FMenuChoice = 1 -> (/*farming*/);
        FMenuChoice = 2 -> (/*status*/);
        FMenuChoice = 3 -> (/*map*/);
        FMenuChoice = 4 -> (/*movemenu*/);
        FMenuChoice = 5 -> (/*gameprogress*/);
        FMenuChoice = 6 -> (/*quitgame*/);
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

about :-
    write('You were a famous designer back then, but one of your client cheated and refused to pay your work.'), nl,
    write('').  
