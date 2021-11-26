/* Belom bisa cek tempat pas gerak */


:- dynamic(object/3).
:- dynamic(dug/2).


% Fakta
object(1 , 1 ,'P').
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
		
waterTile :- object(_,_,'o').
questTile :- object(7,3,'Q').
alchemistTile :- object(3,14,'A').
marketplaceTile :- object(10,12, 'M').
ranchTile :- object(10,5, 'R').
houseTile :- object(7,6, 'H').
isGround :- \+object(_,_,_).


digGround(X,Y) :- isGround,
				asserta(dug(X,Y)).
				


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
					(\+ object(X, Y, _)),
					write('- '),
					NewX is X+1,
					point_map(NewX, Y).

% init sementara (move to main)
drawmap :- point_map(0, 0).

w :- object(X,Y,'P') , NewY is Y - 1,
	retract(object(X,Y,'P')),
	asserta(object(X,NewY,'P')), drawmap.

a :- object(X,Y,'P') , NewX is X - 1,
	retract(object(X,Y,'P')),
	asserta(object(NewX,Y,'P')), drawmap.

s :- object(X,Y,'P') , NewY is Y + 1,
	retract(object(X,Y,'P')),
	asserta(object(X,NewY,'P')), drawmap.

d :- object(X,Y,'P') , NewX is X + 1,
	retract(object(X,Y,'P')),
	asserta(object(NewX,Y,'P')), drawmap.
