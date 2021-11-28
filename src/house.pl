:- include('character.pl').
:- include('map.pl').

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
    write('>'), read(HouseMenu), nl,
    (
    HouseMenu = 1 -> (sleep);
    HouseMenu = 2 -> (writeDiary);
    HouseMenu = 3 -> (readDiary);
    !).


:- dynamic(day/1).
:- dynamic(diary/1).

day(1).
diary([]).

nextDay :-
    retract(day(Dnow)),
    Dnext is Dnow + 1,
    asserta(day(Dnext)).

sleep :-
    write('Have a nice dream ^_^'), nl, nl,
    write('...'), nl, nl,
    nextDay, day(Today),
    random(1, 5, LuckyNumber), write(LuckyNumber), nl,
    (LuckyNumber =:= 4 -> (
        write('What a lucky day! I am Snooze Fairy and I will grant your wish to teleport in the morning'), nl,
        snoozeFairy, write('...'), nl, nl
        );
    !),
    % stamina(Username, PrevStamina),
    % update jadi full
    write('Good morning!'), nl,
    write('Today is day '), write(Today), nl,
    write('Good luck with your journey today!'), nl.

writeDiary :-
    diary(Story),
    day(Now),
    (member([Now, Message], Story) ->   (
            write('You already wrote a diary for today, do you want to replace it? (y/n)'), nl,
            write('>'), read(Rewrite), nl,
            (Rewrite = y -> (
                write('Rewrite your diary for day '), write(Now), nl,
                write(', write between single quote (\'<your diary here>\')'), nl,
                write('>'), read(NewMessage), nl,
                delete(Story, [Now, Message], TempStory),
                append(TempStory, [[Now, NewMessage]], NewStory),
                retract(diary(Story)),
                asserta(diary(NewStory)),
                write('Your diary for today has been saved.'), nl
            ); !)   
        );  
        (   write('Write your diary for day '), write(Now), 
            write(', write between single quote (\'<your diary here>\')'), nl,
            write('>'), read(NewMessage), nl,
            append(Story, [[Now, NewMessage]], NewStory),
            retract(diary(Story)),
            asserta(diary(NewStory)),
            write('Your diary for today has been saved.'), nl
    ); !).

readDiary :-
    diary(Story),
    write('Which diary you want to read?'), nl,
    write('>'), read(DayDiary), nl,
    (member([DayDiary, Message], Story) ->   (
            write('Here is your diary from day '), write(DayDiary), nl,
            write('>'), write(Message), nl
        );  
        (   write('You didn\'t write any diary on day '), write(DayDiary), nl
    ); !).

snoozeFairy :-
	write('Bantuan pilihan ni boss :'),nl,
	write('House       : (7, 6)'),nl,
	write('Quest       : (7, 3)'),nl,
	write('Marketplace : (10, 12)'),nl,
	write('Ranch       : (10, 5)'),nl,
	write('Alchemist   : (3, 14)'),nl,nl,
	write('Enter x-coordinate: '), read(X),
	write('Enter y-coordinate: '), read(Y),
    (
        X > 14 -> (write('You can not pass the borders.'), nl, nl, snoozeFairy)
        ;
        Y > 17 -> (write('You can not pass the borders.'), nl, nl, snoozeFairy)
        ;
        waterTile(X,Y) -> (write('You can not stand on the pond.'), nl, nl, snoozeFairy)
        ;
        (   retract(playerPosition(_,_,'P')),
            asserta(playerPosition(X,Y,'P')),
            write('You will be teleported to that place in the morning.'), nl,
            write('See you in another day :D'), nl, nl
        ); 
    !).