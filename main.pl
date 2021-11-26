/* main.pl */

/* supporting files */
:- include('src/character.pl').
:- include('src/inventory.pl').
:- include('src/map.pl').

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
    nl, nl, nl,         
    write('Let\'s play and pay our debts together').         
    write('Let\'s play and pay our debts together!'), nl, nl,
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl,
    write('$            1. Start Your Journey           $'), nl,
    write('$                    2. Help                 $'), nl,
    write('$                    3. Quit                 $'), nl,
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl, nl,
    write('>'), read_integer(menu),
    (menu = 1 -> start,
    menu = 2 -> help,
    menu = 3 -> quit).

/* insert algoritma start , ini masi template */

/*:- dynamic(started/1).*/
start    :-     write('Welcome to Harvest Star. Choose your job'), nl, nl,
                write('1. Fisherman'), nl, 
                write('2. Farmer'), nl, 
                write('3. Rancher'), nl,
                write('>'), read_integer(JobChoice), nl,

                (JobChoice = 1 -> createFisherman(Username),
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

                write('You choose Fisherman!, let\'s start fishing!'), nl;

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

                write('You choose Farmer!, let\'s start farming!'), nl;

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
                write('        ,&&&@@                      @&&&                         ***  **     '), nl,nl.

                write('You choose Rancher!, let\'s start ranching!'), nl).
            
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
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'), nl.