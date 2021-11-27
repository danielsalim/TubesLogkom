house :-
    write('                 _ _'), nl,  
    write('                ( Y )'), nl,
    write('                 \\ /  '), nl,
    write('                  \\          /^\\'), nl,
    write('                    )       //^\\\\'), nl,
    write('                 (         //   \\\\'), nl,
    write('                   )      //     \\\\'), nl,
    write('                  __     //       \\\\'), nl,
    write('                 |=^|   //    _    \\\\'), nl,
    write('               __|= |__//    (+)    \\\\'), nl,
    write('              /LLLLLLL//      ~      \\\\'), nl,
    write('             /LLLLLLL//               \\\\'), nl,
    write('            /LLLLLLL//                 \\\\'), nl,
    write('           /LLLLLLL//  |~[|]~| |~[|]~|  \\\\'), nl,
    write('           ^| [|] //   | [|] | | [|] |   \\\\'), nl,
    write('            | [|] ^|   |_[|]_| |_[|]_|   |^'), nl,
    write('         ___|______|                     |'), nl,
    write('        /LLLLLLLLLL|_____________________|'), nl,
    write('       /LLLLLLLLLLL/LLLLLLLLLLLLLLLLLLLLLL\\'), nl,
    write('      /LLLLLLLLLLL/LLLLLLLLLLLLLLLLLLLLLLLL\\'), nl,
    write('      ^||^^^^^^^^/LLLLLLLLLLLLLLLLLLLLLLLLLL\\'), nl,
    write('       || |~[|]~|^^||^^^^^^^^^^||^|~[|]~|^||^^'), nl,
    write('       || | [|] |  ||  |~~~~|  || | [|] | ||'), nl,
    write('       || |_[|]_|  ||  | [] |  || |_[|]_| ||'), nl,
    write('       ||__________||  |   o|  ||_________||'), nl,
    write('     .\'||][][][][][||  | [] |  ||[][][][][||.\'.'), nl,
    write('    ."\'||[][][][][]||_-`----\'-_||][][][][]||"."'), nl,
    write('  .(\')^(.)(\').( )\'^@/-- -- - --\\@( )\'( ).(( )^(.)^'), nl,
    write(' \'( )^(`)\'.(\').( )@/-- -- - -- -\\@ (.)\'(.),( ).(\').'), nl,
    write(' ".\'.\'." ." \'.". @/- - --- -- - -\\@ \'.".\'.".\'.".\'."'), nl,
    write(' ". \'\' ".".".\'.\'@/ - -- -- -- -- -\\@".\'..\'".\'."\'.\'.\''), nl,
    write('\'.".".\'\'.".\'\'."@/ -- --- --- -- - -\\@.".\'\'.".\'\'.".\'".'), nl, nl,
    write('***      Welcome to your Home Sweet Home.    ***'), nl,
    write('After an exhausting day, you can rest here and wake up tomorrow with a full energy.'), nl,
    write('If you are lucky, you will meet Snooze Fairy in your sleep and'), nl,
    write('she could grants your wish to teleport to any places when you wake up.'), nl,
    write('You can also write a diary about your journey today or read any diary you wrote in the past.'), nl, nl,
    write('**************************************'), nl,
    write('*    What do you want to do here?    *'), nl,
    write('**************************************'), nl,
    write('*        1. Sleep                    *'), nl,
    write('*        2. Write a Diary            *'), nl,
    write('*        3. Read a Diary             *'), nl,
    write('*        4. Exit House               *'), nl,
    write('**************************************'), nl,
    write('>'), read_integer(HouseMenu), nl,
    (HouseMenu = 1 ->
            sleep
        ;
    !).

:- dynamic(diary/2).
:- dynamic(day/1).

day(1).

nextDay :-
    retract(day(Dnow)),
    Dnext is Dnow + 1,
    asserta(day(Dnext)).

sleep :-
    write('Have a nice dream ^_^'), nl, nl,
    write('...'), nl, nl,
    nextDay, day(Today),
    write('Good morning!'), nl,
    write('Today is day '), write(Today), nl,
    write('Good luck with your journey today!'), nl.

%writeDiary :-

