:- use_module(library(pce)).
:-op(400,xfy,==>).
:-op(300,xfy,=>).

test(Iter,Ls) :- start1(Ms), go(Iter,Ms,Ls).
go(Iter,Ms,Ls) :-
	eq(first(Iter, infiCA(Ms)),Ls).

infiCA(Ls) => [Ls|infiCA(Ls1)] :- life(Ls,Ls1).

first(0,_) => [].
first(_,[]) => [].
first(N,[X|Xs]) => [X|first(N1,Xs)] :-
	N1 is N-1.

eq(X,Y) :- eq2(X,Y).

eq2(X,Z) :- eq1(X,Y), eq2(Y,Z).
eq2(X,X).

eq1(X,Y) :- X=>Y.
eq1([H|T1],[H|T2]) :- eq1(T1,T2).
eq1(if(X1,Y,Z),if(X2,Y,Z)) :- eq1(X1,X2).
eq1(first(X,Y1),first(X,Y2)) :- eq1(Y1,Y2).
eq1(sieve(X1),sieve(X2)) :- eq1(X1,X2).
eq1(filter(X1,Y),filter(X2,Y)) :- eq1(X1,X2).

firsts([],[]).
firsts([A|L],[A1|L1]) :- 
        first(A,A1), 
	firsts(L,L1).

lasts([],[]).
lasts([A|L],[A1|L1]) :- 
        last(A,A1), 
	lasts(L,L1).

first([A|L],A).

last(L,A) :- 
        rev(L,L1), 
	first(L1,A).

rev([],[]).
rev([A|L],Y) :-
	rev(L,L1),
	append(L1,[A],Y).

append([],Xs,Xs).
append([A|X],Y,[A|Z]) :- append(X,Y,Z).

vertical(M,M1) :-
	first(M,F),
	last(M,L),
	append([L],M,M0),
	append(M0,[F],M1).

horizontal(M,M1) :-
	firsts(M,Fs),
	lasts(M,Ls),
	append_lasts(Ls,M,M2),
	append_firsts(Fs,M2,M1).

append_lasts([],[],[]).
append_lasts([A|L],[B|Ls],[C|Lp]) :- C=[A|B],
	append_lasts(L,Ls,Lp).

append_firsts([],[],[]).
append_firsts([A|L],[B|Ls],[C|Lp]) :-
	append(B,[A],C),
	append_firsts(L,Ls,Lp).


new_matrix(M,M2) :- 
        vertical(M,M1), 
	horizontal(M1,M2).

life(X,Z) :- 
        new_matrix(X,X1), 
	parts(X1,Y), 
	loop1(Y,Z).

parts([As,Bs,Cs],[C]) :- sep(As,Bs,Cs,C).
parts([As,Bs,Cs|L],[U|Tl]) :-
	sep(As,Bs,Cs,U), 
     parts([Bs,Cs|L],Tl).

sep([A1,A2,A3],[A4,A5,A6],[A7,A8,A9],
    [sq([A1,A2,A3],[A4,A5,A6],[A7,A8,A9])]).
sep([A1,A2,A3|L1],[A4,A5,A6|L2],[A7,A8,A9|L3],
    [sq([A1,A2,A3],[A4,A5,A6],[A7,A8,A9])|L]) :-
	sep([A2,A3|L1],[A5,A6|L2],[A8,A9|L3],L).

loop1([],[]).
loop1([A|L],[A1|L1]) :- 
        loop2(A,A1), 
	loop1(L,L1).

loop2([],[]).
loop2([A|L],[A1|L1]) :- 
        rule(A,A1), 
	loop2(L,L1).


w([]).
w([A|Ls]) :- wl(A),  w(Ls).

wl([]) :- write('\n').
wl([A|Ls]) :- wll(A), wl(Ls).

wll([]) :- write('\n').
wll([A|L]) :- write(A), write('\n'), write(' '), wll(L).
	
map([],[]).
map([A|L],[B|L1]) :- 
         rule(A,B), 
	 map(L,L1).

count(X,[],0).
count(X,[X|Ls],N) :- count(X,Ls,N1),
           N is N1+1.
count(X,[Y|Ls],N) :- count(X,Ls,N).

%---------------------------------------------
rule(sq([A1,A2,A3],
         [A4,0,A6],
        [A7,A8,A9]),1) :-
 	count(1,[A1,A2,A3,A4,A6,A7,A8,A9],3). 
rule(sq([A1,A2,A3],
        [A4,1,A6],
        [A7,A8,A9]),1) :-
	sum([A1,A2,A3,A4,A6,A7,A8,A9],2).
rule(sq([A1,A2,A3],
        [A4,1,A6],
        [A7,A8,A9]),1) :-
	sum([A1,A2,A3,A4,A6,A7,A8,A9],3).
rule(sq([A1,A2,A3],
        [A4,0,A6],
        [A7,A8,A9]),0) :-
 	sum([A1,A2,A3,A4,A6,A7,A8,A9],X), X=\=3.
%        random(1,10,R),(member(R,[1,2,3,4,5,6,7,8]),A=0; 
%        random(1,10,R),member(R,[9,10]),A=1). 
rule(sq([A1,A2,A3],
        [A4,1,A6],
        [A7,A8,A9]),0) :-
 	sum([A1,A2,A3,A4,A6,A7,A8,A9],X), X=\=2, X=\=3. 


sum([],0).
sum([A|L],S) :- 
        sum(L,S1),
	S is A+S1.


l(X) :- life(X,Y), wl(X), read(C), continue(C,Y).

continue(C,Y) :- C='s', l(Y).
continue(C,_) :- C='e'.

start([[1,0,1,0,0,1,0,1],
       [1,0,1,0,0,1,0,1],
       [1,0,0,1,0,0,0,0],
       [0,1,1,1,0,1,0,0],
       [1,0,0,0,0,0,1,0],
       [0,0,0,0,0,0,0,0],
       [1,0,1,0,0,1,1,0]]).

start0([[1,2,1,0,0,1,0,1],
       [1,2,1,0,0,1,0,1],
       [1,3,1,1,4,5,6,6], %ply
       [0,1,1,1,4,1,0,6],
       [1,4,4,4,4,0,1,6],
       [0,0,6,6,6,6,6,6],
       [1,0,1,0,0,1,1,0]]).

start1([[0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0],
       [0,0,1,1,1,0,0,0],
       [0,0,1,1,1,0,0,0],
       [0,0,1,1,1,0,0,0],
       [0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0]]).


start11([
       [0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0],
       [0,0,0,1,1,1,0,0,0],
       [0,0,0,1,1,1,0,0,0],
       [0,0,0,1,1,1,0,0,0],
       [0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0]]).


% Execute with: start(X),l(X). and press 's.' to develop the game.


go :- start1(X), l(X).

%[1,2,2,2,1,1,3] -> [(1,3),(2,3),(3,1)]

occur([],[]).
occur([X|Ls],[(X,NXs)|Ls2]) :- 
      count(X,Ls,M),
      NXs is M+1,
      delet(X,Ls,Ls1),
      occur(Ls1,Ls2).

delet(X,[],[]).
delet(X,[X|Ls],Ls1) :- delet(X,Ls,Ls1).
delet(X,[Y|Ls],[Y|Ls1]) :- delet(X,Ls,Ls1).






