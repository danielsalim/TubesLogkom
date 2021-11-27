:- dynamic(diary/2).

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
    write('Welcome to your Home Sweet Home. After an exhausting day, you can rest here and wake up tomorrow with a full energy.'), nl,
    write('If you are lucky, you will meet Snooze Fairy in your sleep and she could grants your wish to teleport to any places when you wake up.'), nl,
    write(''), nl, nl,
    write('**************************************'), nl,
    write('*    So, what do you want to do?     *'), nl,
    write('**************************************'), nl,
    write('*        1. Sleep                    *'), nl,
    write('*        2. Write a Diary            *'), nl,
    write('*        3. Read a Diary             *'), nl,
    write('*        4. Exit House               *'), nl,
    write('**************************************'), nl,
    %write('>'), read_integer(HouseMenu), nl,