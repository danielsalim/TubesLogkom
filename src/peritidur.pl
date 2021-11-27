peri :-
    write('Semriwing semriwing anda bertemu dengan peri tidur, anda bisa pergi ke mana saja silahkan pilih tempat anda'), nl,nl,
	write('Bantuan pilihan ni boss :'),nl,
	write('House       : (7, 6)'),nl,
	write('Quest       : (7, 3)'),nl,
	write('Marketplace : (10, 12)'),nl,
	write('Ranch       : (10, 5)'),nl,
	write('Alchemist   : (3, 14)'),nl,nl,
	write('Masukkan posisi x: '), read(X),
	write('masukkan posisi y: '), read(Y),
    (
        X > 14,
        write('maap bang situ mau ke mana jauh amat,'),nl,nl,peri;
        Y > 17,
        write('maap bang situ mau ke mana jauh amat'),nl,nl,peri;
        waterTile(X,Y),
        write('ga bisa bang nanti kelelep'),nl,nl,peri;
        retract(playerPosition(_,_,'P')),
        asserta(playerPosition(X,Y,'P')),
        write('selamat anda telah tiba di tempat tujuan')

    ), !.