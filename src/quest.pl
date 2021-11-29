:-dynamic(isHaveQuest/1).
:-dynamic(todoQuest/2).

:-dynamic(getQuest/0).
:-dynamic(player/1).

isHaveQuest(no).

todoQuest(fishing,0).
todoQuest(ranching,0).
todoQuest(harvesting,0).

player(9).


getQuest :- write('Welcome, you have a quest to do'),nl,player(Level),
                ( Level = 1 ->
                    retract(todoQuest(fishing,_)),
                    retract(todoQuest(ranching,_)),
                    retract(todoQuest(harvesting,_)),
                    random(5,11,X),
                    random(5,11,Y),
                    random(5,11,Z),
                    asserta(todoQuest(fishing,X)),
                    asserta(todoQuest(ranching,Y)),
                    asserta(todoQuest(harvesting,Z)),
                    retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
                    harvestingQuest,
                    fishingQuest,
                    ranchingQuest;
                Level = 2 -> 
                    retract(todoQuest(fishing,_)),
                    retract(todoQuest(ranching,_)),
                    retract(todoQuest(harvesting,_)),
                    random(11,16,X),
                    random(11,16,Y),
                    random(11,16,Z),
                    asserta(todoQuest(fishing,X)),
                    asserta(todoQuest(ranching,Y)),
                    asserta(todoQuest(harvesting,Z)),
                    retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
                    harvestingQuest,
                    fishingQuest,
                    ranchingQuest;
                Level = 3 ->
                    retract(todoQuest(fishing,_)),
                    retract(todoQuest(ranching,_)),
                    retract(todoQuest(harvesting,_)),
                    random(16,21,X),
                    random(16,21,Y),
                    random(16,21,Z),
                    asserta(todoQuest(fishing,X)),
                    asserta(todoQuest(ranching,Y)),
                    asserta(todoQuest(harvesting,Z)),
                    retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
                    harvestingQuest,
                    fishingQuest,
                    ranchingQuest;
                Level = 4 ->
                    retract(todoQuest(fishing,_)),
                    retract(todoQuest(ranching,_)),
                    retract(todoQuest(harvesting,_)),
                    random(21,26,X),
                    random(21,26,Y),
                    random(21,26,Z),
                    asserta(todoQuest(fishing,X)),
                    asserta(todoQuest(ranching,Y)),
                    asserta(todoQuest(harvesting,Z)),
                    retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
                    harvestingQuest,
                    fishingQuest,
                    ranchingQuest;
                Level = 5 ->
                    retract(todoQuest(fishing,_)),
                    retract(todoQuest(ranching,_)),
                    retract(todoQuest(harvesting,_)),
                    random(26,31,X),
                    random(26,31,Y),
                    random(26,31,Z),
                    asserta(todoQuest(fishing,X)),
                    asserta(todoQuest(ranching,Y)),
                    asserta(todoQuest(harvesting,Z)),
                    retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
                    harvestingQuest,
                    fishingQuest,
                    ranchingQuest
                ).

fishingQuest :- todoQuest(fishing,FishtoCollect),
                (FishtoCollect > 0 ->
                    write(FishtoCollect),
                    write(' fish'),nl;
                FishtoCollect < 1 ->
                    write('0 fish'),nl
                ).
ranchingQuest :- todoQuest(ranching,RanchtoCollect),
                (RanchtoCollect > 0 ->
                    write(RanchtoCollect),
                    write(' ranch item'),nl;
                RanchtoCollect < 1 ->
                    write('0 ranch item'),nl
                ).

harvestingQuest :- todoQuest(fishing,HarvesttoCollect),
                    (HarvesttoCollect > 0 ->
                        write(HarvesttoCollect),
                        write(' harvest item'),nl;
                    HarvesttoCollect < 1 ->
                        write('0 harvest item'),nl
                    ).

quest :- isHaveQuest(Check),
            (Check = yes ->
                write('Sorry, you need to finish your quest first to get another quest'),nl,
                harvestingQuest,
                fishingQuest,
                ranchingQuest,
                exitQuest;
            Check = no ->
                getQuest
            ).

getReward :- level(_,Level), isQuestDone, gold(_,Total),
            (Level = 1 ->
                addExpOverall(X,100),
                NewAmount is Total + 1000,
                update_amount(NewAmount);
            Level = 2 ->
                addExpOverall(X,200),
                NewAmount is Total + 2000,
                update_amount(NewAmount);
            Level = 3 ->
                addExpOverall(X,300),
                NewAmount is Total + 3000,
                update_amount(NewAmount);              
            Level = 4 ->
                addExpOverall(X,400),
                NewAmount is Total + 4000,
                update_amount(NewAmount);
            Level = 5 ->
                addExpOverall(X,500),
                NewAmount is Total + 5000,
                update_amount(NewAmount)
            ).

isQuestDone :-todoQuest(fishing,FishtoCollect),
                todoQuest(harvesting,HarvesttoCollect),
                todoQuest(ranching,RanchtoCollect),
                FishtoCollect < 1 , HarvesttoCollect < 1, RanchtoCollect < 1.

exitQuest :- write('Go finish your task bruhh may god bless you'),nl.


updateQuestRanch(Jumlah):-
    todoQuest(ranching,ValueOfRanch),
    NewValue is ValueOfRanch - Jumlah,
    (
        NewValue > 0 ->
            write('Quest ranching tersisa '),write(NewValue),write(' Item'),nl,
            retract(todoQuest(ranching,_)),asserta(todoQuest(ranching,NewValue));
        NewValue =< 0 ->
            write('Selamat!, quest ranching telah selesai'),nl,
            retract(todoQuest(ranching,_)),asserta(todoQuest(ranching,0))

    ),
    updateWholeQuest.

updateQuestFish(Jumlah):-
    todoQuest(fishing,ValueOfFishing),
    NewValue is ValueOfFishing - Jumlah,
    (
        NewValue > 0 ->
            write('Quest Fishing tersisa '),write(NewValue),write(' Item'),nl,
            retract(todoQuest(fishing,_)),asserta(todoQuest(fishing,NewValue));
        NewValue =< 0 ->
            write('Selamat!, quest Fishing telah selesai'),nl,
            retract(todoQuest(fishing,_)),asserta(todoQuest(fishing,0))
    ),
    updateWholeQuest.

updateQuestHarvest(Jumlah):-
    todoQuest(harvesting,ValueOfRanch),
    NewValue is ValueOfRanch - Jumlah,
    (
        NewValue > 0 ->
            write('Quest harvesting tersisa '),write(NewValue),write(' Item'),nl,
            retract(todoQuest(harvesting,_)),asserta(todoQuest(harvesting,NewValue));
        NewValue =< 0 ->
            write('Selamat!, quest harvesting telah selesai'),nl,
            retract(todoQuest(harvesting,_)),asserta(todoQuest(harvesting,0))
    ),updateWholeQuest.


updateWholeQuest:-
    isQuestDone,
    write('Selamat Anda telah berhasil menyelesaikan semua quest dan mendapatkan reward'),
    getReward,
    retract(haveQuest(_)),asserta(haveQuest(no)).