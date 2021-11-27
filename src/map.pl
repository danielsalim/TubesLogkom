
:- dynamic(object/3).
:- dynamic(dug/2).
:- dynamic(isWall/2).
:- dynamic(playerPosition/3).
:- dynamic(plantingMango/2).
:- dynamic(plantingTomato/2).
:- dynamic(plantingCoconut/2).
:- dynamic(plantingStrawberry/2).
:- dynamic(harvestingMango/2).
:- dynamic(harvestingTomato/2).
:- dynamic(harvestingCoconut/2).
:- dynamic(harvestingStrawberry/2).




% Fakta
playerPosition(1 , 1 ,'P').
object(3,14, 'A').
object(10,5, 'R').
object(7,6, 'H').
object(10,12, 'M').
object(7,3, 'Q').
object(5, 8, 'o').
object(6, 8, 'o').
object(7, 8, 'o').
object(4, 9, 'o').
object(5, 9, 'o').
object(6, 9, 'o').
object(7, 9, 'o').
object(8, 9, 'o').
object(5, 10, 'o').
object(6, 10, 'o').
object(7, 10, 'o').

map_size(14, 17).


isWall(X,Y) :- map_size(A,B), 
			(
				X =:= A + 1; 
				Y =:= B + 1; 
				X =:= 0;
				Y =:= 0
			).
waterTile(X,Y) :- object(X,Y,'o').
questTile(X,Y) :- object(X,Y,'Q').
alchemistTile(X,Y) :- object(X,Y,'A').
marketplaceTile(X,Y) :- object(X,Y, 'M').
ranchTile(X,Y) :- object(X,Y, 'R').
houseTile(X,Y) :- object(X,Y, 'H').
isGround(X,Y) :- \+object(X,Y,_).
isTempatfishing(X,Y) :- AtasY is Y - 1, 
						BawahY is Y + 1, 
						RightX is X + 1, 
						LeftX is X -1, 
						(
							waterTile(RightX,Y);
							waterTile(LeftX,Y);
							waterTile(X,AtasY);
							waterTile(X,BawahY)
						).
isdugGround(X,Y) :- dug(X,Y).


plantCoconut(X,Y) :- 
					isdugGround(X,Y),
					asserta(plantingCoconut(X,Y)),
					retract(dug(X,Y)),
					NewY is Y - 1, 
					RightX is X + 1, 
					LeftX is X - 1,
					(
						\+isWall(X,NewY),\+waterTile(X,NewY),! ->
							w;
						\+isWall(RightX,Y),\+waterTile(RightX,Y),! ->
							d;
						\+isWall(LeftX,Y),\+waterTile(LeftX,Y),! ->
							a
					).

plantTomato(X,Y) :- 
					isdugGround(X,Y),
					asserta(plantingTomato(X,Y)),
					retract(dug(X,Y)),
					NewY is Y - 1, 
					RightX is X + 1, 
					LeftX is X - 1,
					(
						\+isWall(X,NewY),\+waterTile(X,NewY),! ->
							w;
						\+isWall(RightX,Y),\+waterTile(RightX,Y),! ->
							d;
						\+isWall(LeftX,Y),\+waterTile(LeftX,Y),! ->
							a
					).

plantMango(X,Y) :- 
					isdugGround(X,Y),
					asserta(plantingMango(X,Y)),
					retract(dug(X,Y)),
					NewY is Y - 1, 
					RightX is X + 1, 
					LeftX is X - 1,
					(
						\+isWall(X,NewY),\+waterTile(X,NewY),! ->
							w;
						\+isWall(RightX,Y),\+waterTile(RightX,Y),! ->
							d;
						\+isWall(LeftX,Y),\+waterTile(LeftX,Y),! ->
							a
					).

plantStrawberry(X,Y) :- 
						isdugGround(X,Y),
						asserta(plantingStrawberry(X,Y)),
						retract(dug(X,Y)),
						NewY is Y - 1, 
						RightX is X + 1, 
						LeftX is X - 1,
						(
							\+isWall(X,NewY),\+waterTile(X,NewY),! ->
								w;
							\+isWall(RightX,Y),\+waterTile(RightX,Y),! ->
								d;
							\+isWall(LeftX,Y),\+waterTile(LeftX,Y),! ->
								a
						).

harvestTimeCoconut(X,Y) :- retract(plantingCoconut(X,Y)),
						asserta(harvestingCoconut(X,Y)).

harvestTimeTomato(X,Y) :- retract(plantingTomato(X,Y)),
							asserta(harvestingTomato(X,Y)).

harvestTimeMango(X,Y) :- retract(plantingMango(X,Y)),
						asserta(harvestingMango(X,Y)).

harvestTimeStrawberry(X,Y) :- retract(plantingStrawberry(X,Y)),
							asserta(harvestingStrawberry(X,Y)).

harvestedCoconut(X,Y) :- retract(harvestingCoconut(X,Y)).
harvestedTomato(X,Y) :- retract(harvestingTomato(X,Y)).
harvestedMango(X,Y) :- retract(harvestingMango(X,Y)).
harvestedStrawberry(X,Y) :- retract(harvestingStrawberry(X,Y)).


digGround :-	
			playerPosition(X,Y,'P'),
			isGround(X,Y),!,
			asserta(dug(X,Y)),
			NewY is Y - 1, 
			RightX is X + 1, 
			LeftX is X - 1,
			(
				\+isWall(X,NewY),\+waterTile(X,NewY),! ->
					w;
				\+isWall(RightX,Y),\+waterTile(RightX,Y),! ->
					d;
				\+isWall(LeftX,Y),\+waterTile(LeftX,Y),! ->
					a
			); write('Ga bisa gali di sini bosss').					

% DRAW MAP BORDERS
% batas kanan
point_map(X, Y) :- map_size(W, H),
					X =:= W + 1,
					Y =< H + 1,
					write('# '), nl,
					NewY is Y+1,
					point_map(0, NewY).
		
% batas kiri		
point_map(X, Y) :- map_size(_, H),
					X =:= 0,
					Y =< H+1,
					write('# '),
					NewX is X+1,
					point_map(NewX, Y).
				
% batas atas				
point_map(X, Y) :- map_size(W, _),
					X < W + 1,
					X > 0,
					Y =:= 0,
					write('# '),
					NewX is X+1,
					point_map(NewX, Y).
					
% batas bawah				
point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y =:= H + 1,
					write('# '),
					NewX is X+1,
					point_map(NewX, Y).										

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					object(X, Y, Obj), !,
					write(Obj),
					write(' '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					playerPosition(X, Y, Obj), !,
					write(Obj),
					write(' '),
					NewX is X+1,
					point_map(NewX, Y).
				
point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					isdugGround(X,Y),!,
					write('= '),
					NewX is X+1,
					point_map(NewX, Y).
					
point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					plantingCoconut(X,Y),!,
					write('c '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					plantingMango(X,Y),!,
					write('m '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					plantingTomato(X,Y),!,
					write('t '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					plantingStrawberry(X,Y),!,
					write('s '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					harvestingCoconut(X,Y),!,
					write('|c| '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					harvestingMango(X,Y),!,
					write('|m| '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					harvestingTomato(X,Y),!,
					write('|t| '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					harvestingStrawberry(X,Y),!,
					write('|s| '),
					NewX is X+1,
					point_map(NewX, Y).

point_map(X, Y) :- map_size(W, H),
					X < W + 1,
					X > 0,
					Y < H + 1,
					Y > 0,
					\+isWall(X,Y),
					write('- '),
					NewX is X+1,
					point_map(NewX, Y).



% init sementara (move to main)
drawmap :- point_map(0, 0).



w :- playerPosition(X,Y,'P') , NewY is Y - 1,
	(	
		\+isWall(X,NewY), \+waterTile(X,NewY), \+questTile(X,NewY), \+alchemistTile(X,NewY), \+marketplaceTile(X,NewY), \+ranchTile(X,NewY), \+houseTile(X,NewY), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		isWall(X,NewY),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(X,NewY),! ->
			write('Hati-hati oiiii ada danau'),nl,drawmap;
		questTile(X,NewY),! ->
			write('Anda berada di tempat lowongan pekerjaan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		alchemistTile(X,NewY),! ->
			write('Anda berada di cheating market'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		marketplaceTile(X,NewY),! ->
			write('Selamat datang di Indomaret'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		ranchTile(X,NewY),! ->
			write('Selamat datang di peternakan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		houseTile(X,NewY),! ->
			write('Selamat datang kembali di rumah'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap,!
	).

a :- playerPosition(X,Y,'P') , NewX is X - 1,
	(	
		\+isWall(NewX,Y), \+waterTile(NewX,Y), \+questTile(NewX,Y) ,\+alchemistTile(NewX,Y),\+isGround(NewX,Y),\+marketplaceTile(NewX,Y), \+ranchTile(NewX,Y), \+houseTile(NewX,Y), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		isWall(NewX,Y),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(NewX,Y),! ->
			write('Hati-hati oiiii ada danau'),nl,drawmap;
		questTile(NewX,Y),! ->
			write('Anda berada di tempat lowongan pekerjaan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		alchemistTile(NewX,Y),! ->
			write('Anda berada di cheating market'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		isGround(NewX,Y) ->
			write('Anda berada di tanah gemburr'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		marketplaceTile(NewX,Y),! ->
			write('Selamat datang di Indomaret'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		ranchTile(NewX,Y),! ->
			write('Selamat datang di peternakan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		houseTile(NewX,Y),! ->
			write('Selamat datang kembali di rumah'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap	
	).

s :- playerPosition(X,Y,'P') , NewY is Y + 1,
	(	
		\+isWall(X,NewY), \+waterTile(X,NewY),\+questTile(X,NewY) , \+alchemistTile(X,NewY), \+marketplaceTile(X,NewY), \+ranchTile(X,NewY), \+houseTile(X,NewY), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		isWall(X,NewY),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(X,NewY),! ->
			write('Hati-hati oiiii ada danau'),nl,drawmap;
		questTile(X,NewY),! ->
			write('Anda berada di tempat lowongan pekerjaan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		alchemistTile(X,NewY),! ->
			write('Anda berada di cheating market'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		marketplaceTile(X,NewY),! ->
			write('Selamat datang di Indomaret'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		ranchTile(X,NewY),! ->
			write('Selamat datang di peternakan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap;
		houseTile(X,NewY),! ->
			write('Selamat datang kembali di rumah'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(X,NewY,'P')), drawmap		
	).

d :- playerPosition(X,Y,'P') , NewX is X + 1,
	(	
		\+isWall(NewX,Y), \+waterTile(NewX,Y), \+questTile(NewX,Y), \+alchemistTile(NewX,Y),\+marketplaceTile(NewX,Y), \+ranchTile(NewX,Y), \+houseTile(NewX,Y), !->
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		isWall(NewX,Y),! ->
			write('Maaf bang ada tembok'),nl, drawmap;
		waterTile(NewX,Y),! ->
			write('Hati-hati oiiii ada danau'),nl,drawmap,!;
		questTile(NewX,Y),! ->
			write('Anda berada di tempat lowongan pekerjaan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		alchemistTile(NewX,Y),! ->
			write('Anda berada di cheating market'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		marketplaceTile(NewX,Y),! ->
			write('Selamat datang di Indomaret'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		ranchTile(NewX,Y),! ->
			write('Selamat datang di peternakan'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap;
		houseTile(NewX,Y),! ->
			write('Selamat datang kembali di rumah'),nl,
			retract(playerPosition(X,Y,'P')),
			asserta(playerPosition(NewX,Y,'P')), drawmap	
	).

