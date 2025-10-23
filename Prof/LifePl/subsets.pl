subsets([],[[]]).
subsets([A|L],G) :-
	subsets(L,Ts),
	repartir(A,Ts,Ts1),
	append(Ts,Ts1,G).

repartir(A,[],[]).
repartir(A,[B|Ls],[H|Ms]) :-
	append([A],B,H),
	repartir(A,Ls,Ms).

lasts([],[[]]).
lasts([A|Ls],G) :-
	lasts(Ls,Ls1),
	append([[A|Ls]],Ls1,G).

inits([],[[]]).
inits([A|Ls],G) :-
	inits(Ls,Ls1),
	append(Ls1,[[A|Ls]],G).

reverse([],[]).
reverse([A|Ls],Ts) :-
	reverse(Ls,Ls1),
	append(Ls1,[A],Ts).

revertir([],[]).
revertir([A|Ls],[H|Ts]) :-
	reverse(A,H),
	revertir(Ls,Ts).