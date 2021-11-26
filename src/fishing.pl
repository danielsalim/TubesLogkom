fishing :-
    write('***************************************************** '), nl,
    write('____ _ ____ _  _ _ _   _ ____    ___  ____ _  _ ___   '), nl,
    write('|___ | [__  |__| | |\\| | __    |__] |  | |\\ | |  \\ '), nl,
    write('|    | ___] |  | | | \\| |__]   |    |__| | \\| |__/  '), nl,
    write('                                                      '), nl,
    write('***************************************************** '), nl,nl, nl,

    write('                 |                                       '), nl,                   
    write('                 |                                       '), nl,
    write('      _          |                                       '), nl,
    write('    _/=\\_        |                                       '), nl,
    write('  _/=====\\_      |                                       '), nl,
    write('    \'-\\-\'       / \\                                      '), nl,
    write('    - , -     /(o)|                                      '), nl,
    write('   __)-(____ /|^^^|                                      '), nl,
    write('  /  <\\/> __/_|\\/^|                                    '), nl,
    write(' / /|  : | /__|^^^|                                      '), nl,
    write('/ / |  : |/___|^^^|                                      '), nl,
    write('/_/ }===={)___|^^^|\\              .-.                    '), nl,
    write('((" |)  (| )__|^^^|_\\       ______/o  )                   '), nl,
    write('\\  |    |  )_|^^^|/        \\-----   (    /     _____      '), nl,
    write(' \\ |  | |  \\|^^^|          \\     / \\  //     |||||      '), nl,
    write('__\\|  | |____|^^^|___________\\   / \\\\///__   |||||      '), nl,
    write('/___)|  | |___///|\\\\_____=____\\_/(___\\)/___  |()||      '), nl,
    write('/___( |__|_|__////|\\\\ __ ___-______ | | \\____|||||      '), nl,
    write('/__=__)(___)__)^^^^^^^^^(  __________ | |______ |||||     '), nl,
    write('/_____(___________________)___________" "____=__|||||    '), nl,
    write('________________________________________________|||||    '), nl,
    write('                                                |||||    '), nl,

    write('My name is Master Kang. I know the best spot to fish here. Most people consult to me first.'), nl, nl,
    
    write('-----------------------------------------'), nl,
    write('|?|   What do you want to do here?    |?|'), nl,
    write('|-|1. Tell me about this fishing pond |-|'), nl,
    write('|-|2. Fishing                         |-|'), nl,
    write('|-|3. Talk                            |-|'), nl,
    write('|-|4. See guide                       |-|'), nl,
    write('|-|5. Leave                           |-|'), nl,
    write('-----------------------------------------'), nl, nl,

    write('I want to....'), nl, nl,

    read_integer(User), nl,
    (
        User = 1 ->
            pond_story
        ;

        User = 2 -> 
            startfish
        ;

        User = 3 -> 
            alce_clue
        ;

        User = 4 ->
            guide
        ;

        User = 5 ->
            leave
        ;


    !).


/* here to start fishing */




/* STORYLINE */

guide :-
    write('                                       GUIDE BOOK                                             '), nl,
    write('**********************************************************************************************'), nl,
    write('1. Level up your fishing rod, so the stamina consumed will be greatly reduced.                '), nl,
    write('2. Use the finest bait in order to get the rarest fish. You can buy it in the Old man\'s store'), nl,
    write('3. Doing fishing works will consume your stamina.                                             '), nl,
    write('**********************************************************************************************'), nl.


alce_clue :- 

    write('Yes did the Old Man tell you about this? This pond is so legendary'), nl,
    write('This was used by warlocks or alchemist from the magic era to spend their free time'), nl,
    write('There was only one Alchemist left in this realm. He would come really soon.'), nl,
    write('Some even speculated that he was already here in disguised.'), nl,
    write('His name is Alce, I believe. Dealing with him comes with a heavy price, but will give you fortune.'), nl,
    write('Now, do you want to catch some good ol\' fish?'), nl,nl,
    fishing.

pond_story :-

    write('You can get the best fish only in the pond in this village. The pond is blessed with expensive fishes.'), nl,
    write('Even this pond is more profitable than fishing in the sea. Probably because this pond used to be the place for the alchemists.'), nl,
    write('Back in the day, they would use magic to make this pond breed only the best fish'), nl,
    write('Even the legendary Old man would fish here sometimes, eh.'), nl,
    write('Only uncultured people did not want to do some fishing here.'), nl,
    write('So are you one of those uncultured masses?'), nl, nl, 
    fishing.

leave :-

    write('Come again really soon. Fish is the best asset in these desperate times.').
