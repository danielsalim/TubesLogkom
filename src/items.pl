#sapu-sapu fish - rarity rendah, harga paling murah
#lele fish
#salmon fish

sapu_fish(_, Y)
lele_fish(_, Y)
salmon_fish(_, Y)

corn_bait :-

    #idenya itu ini stat dasar dari mendapatkan ikan yang raritynya kecil / gede

    sapu_fish(_, Y)
    newAmount is Y + 4,
    update_sapu,
    save_inventory(sapu_fish(_, newAmount)).

basic_bait :-

    #idenya itu ini stat dasar dari mendapatkan ikan yang raritynya kecil / gede

    lele_fish(_, Y)
    newAmount is Y + 2,
    update_lele,
    save_inventory(lele_fish(_, newAmount)).


anchovy_bait :-

    #idenya itu ini stat dasar dari mendapatkan ikan yang raritynya kecil / gede

    salmon_fish(_, Y)
    newAmount is Y + 1,
    update_salmon,
    save_inventory(salmon_fish(_, newAmount)).

update_sapu :-
    retract(sapu_fish(X, _)), asserta(sapu_fish(X, newAmount)).

update_lele :-
    retract(lele_fish(X, _)), asserta(lele_fish(X, newAmount)).

update_salmon :-
    retract(salmon_fish(X, _)), asserta(salmon_fish(X, newAmount)).
