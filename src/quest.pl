:-dynamic(isHaveQuest/1).
:-dynamic(TodoQuest/2).
:-dynamic(QuestReward/3).

:-dynamic(getQuest/0).

isHaveQuest(no).

TodoQuest(fishing,0).
TodoQuest(ranching,0).
TodoQuest(harvesting,0).


QuestReward(X,X,0).

getQuest :- write('Welcome, may you help us?'),nl,
            0 < player(level) <=10 ->(
                retract(fishing,_),
                retract(ranching,_),
                retract(harvesting,_),
                random(1,11,X),
                random(1,11,Y),
                random(1,11,Z),
                asserta(fishing,X),
                asserta(ranching,Y),
                asserta(harvesting,Z),
                retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
            );
            10 < player(level) <=20 ->(
                retract(fishing,_),
                retract(ranching,_),
                retract(harvesting,_),
                random(11,16,X),
                random(11,16,Y),
                random(11,16,Z),
                asserta(fishing,X),
                asserta(ranching,Y),
                asserta(harvesting,Z),
                retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
            );
            20 < player(level) <=30 ->(
                retract(fishing,_),
                retract(ranching,_),
                retract(harvesting,_),
                random(16,21,X),
                random(16,21,Y),
                random(16,21,Z),
                asserta(fishing,X),
                asserta(ranching,Y),
                asserta(harvesting,Z),
                retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
            );
            30 < player(level) <=40 ->(
                retract(fishing,_),
                retract(ranching,_),
                retract(harvesting,_),
                random(21,26,X),
                random(21,26,Y),
                random(21,26,Z),
                asserta(fishing,X),
                asserta(ranching,Y),
                asserta(harvesting,Z),
                retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
            );
            40 < player(level) <=50 ->(
                retract(fishing,_),
                retract(ranching,_),
                retract(harvesting,_),
                random(26,31,X),
                random(26,31,Y),
                random(26,31,Z),
                asserta(fishing,X),
                asserta(ranching,Y),
                asserta(harvesting,Z),
                retract(isHaveQuest(no)), asserta(isHaveQuest(yes)),
            ).

fishingQuest :- TodoQuest(fishing,FishtoCollect),
                FishtoCollect > 0 ->(
                    write(FishtoCollect),
                    write('fish'),
                );
                FishtoCollect < 1 ->(
                    write('0 fish'),
                ).
ranchingQuest :- TodoQuest(ranching,RanchtoCollect),
                RanchtoCollect > 0 ->(
                    write(RanchtoCollect),
                    write('ranch item'),
                );
                RanchtoCollect < 1 ->(
                    write('0 ranch item'),
                ).

harvestingQuest :- TodoQuest(fishing,HarvesttoCollect),
                    HarvesttoCollect > 0 ->(
                        write(HarvesttoCollect),
                        write('harvest item'),
                    );
                    HarvesttoCollect < 1 ->(
                        write('0 harvest item'),
                    ).

quest :- isHaveQuest(Check),
        (
            Check = yes ->
                write('Sorry, you need to finish your quest first to get another quest'),nl,
                harvestingQuest,
                fishingQuest,
                ranchingQuest,
                exitQuest;
            Check = no ->(
                getQuest,
            )
        ).

