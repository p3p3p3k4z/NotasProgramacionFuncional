:-set_prolog_flag(single_var_warnings, off).
:-op(400,xfx,when).    
:-op(700,xfx,>>).
:-op(650,xfy,>=>).
:-op(600,xfy,=>).
:-op(500,xfy,++).

red(A,B) :- A >> B.

A >> C :- A >=> B, B>>C.
A >> A.

fib(A) >=> fib(A1) :- A >=> A1.
fac(A) >=> fac(A1) :- A >=> A1.
A >=> B :- A => B.    
A >=> B :- 
    A=..[G,L], 
    %L1 is L,
    L => L1, %not composition, right now
    C=..[G,L1],
    C >=> B.    
[A|B] >=> [A1|B] :- A >=> A1.
[A|B] >=> [A|B1] :- B >=> B1.

%[A|B] >=> [A1|B1] :- A => A1, B >=> B1.

A+B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1),
	C is A1+B1.
A+B >=> A1+B :- A >=> A1.
A+B >=> A+B1 :- B >=> B1.

A-B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1),
	C is A1-B1.
A-B >=> A1-B :- A >=> A1.
A-B >=> A-B1 :- B >=> B1.    

A/B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1), \+(B1==0),
	C is A1/B1.
A/B >=> A1/B :- A >=> A1.
A/B >=> A/B1 :- B >=> B1.

A*B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1),
	C is A1*B1.

A*B >=> A1*B :- A >=> A1.
A*B >=> A*B1 :- B >=> B1.

    
%take(N,L) >=> take(N1,L) :- N=> N1.
%stream argument

take(N,L) >=> take(N1,L) :- N >=> N1.
take(N,L) >=> take(N,L1) :- L >=> L1.
filter(N,L) >=> filter(N,L1) :- L >=> L1.
map1(P,L) >=> map1(P,L1) :- L >=> L1.
if(T,X,_) >=> if(T,X1,_) :- T >> true, X >=> X1.
if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y >=> Y1.
%    when(A,T) :- T>> true, >=
A++B >=> C :- A >> A1, B >> B1,
	list(A1), list(B1),
	append(A1,B1,C).
A++B >=> A1++B :- A >=> A1.
A++B >=> A++B1 :- B >=> B1.

F >=> F2 :- F=..[G|H],
           \+G='.',
	   \+G='+',
	   \+G='*',
	   \+G='/',
	   \+G='-',
	   \+G='++',
%	   write(G),nl, %Importante..
           red_list(H,H1), \+(H=H1),
           F1=..[G|H1], F1 >=> F2.

red_list([],[]). 
red_list([A|L],[A1|L1]) :- A >> A1, red_list(L,L1).

diff([],[]). 
diff([A|L],[A1|L1]) :- \+ (A = A1), diff(L,L1).

list([]). 
list([A|X]) :- list(X).

append([],X,X).
append([A|X],Y,[A|Z]) :- append(X,Y,Z).

%Fibonacci en un sistema de reescritura:
%1. Supongamos que sólo tenemos de momento exclusivamente
%esto:


le(A, B) => true :- number(A), number(B), A<B.
le(A, B) => false :- number(A), number(B), A>=B.

leq(A, B) => true :- number(A), number(B), A=<B.
leq(A, B) => false :- number(A), number(B), A>B.

gt(A, B) => true :- number(A), number(B), A>B.
gt(A, B) => false :- number(A), number(B), A=<B.

gtq(A, B) => true :- number(A), number(B), A>=B.
gtq(A, B) => false :- number(A), number(B), A<B.


fib(0) => 1.
fib(1) => 1.
fib(N) => fib(N-1)+fib(N-2) :-
	N>1.

fac(0) => 1.
fac(N) => N*fac(N-1) :-
	N>0.

double([]) => [].
double([A|X]) => [A,A]++(double(X)).


% Goal: a double without ++.
% Unfolding ++

%ddouble([]) => [].
%ddouble([A|X]) => [A|(A++ddouble(X))].

% Unfolding ++ again:

ddouble([]) => [].
ddouble([A|X]) => [A,A|ddouble(X)].

[]++X => X.
[A|X]++Y => [A|(X++Y)].

rev([]) => [].
rev([A|X]) => rev(X)++[A]. 

/*
[1,0,1]
[a b c]
[c a b c a]
[1,1,0,1,1]

[[1,1,0],[1,0,1],[0,1,1]]
map(rule,[[1,1,0],[1,0,1],[0,1,1]]) => [1,0,0].
*/

%An infinite stream of integers.
sints(N) => [N|sints(N1)] :- N1 is N+1.


take(0,Ls) => [].
take(N,[]) => [] :- number(N).
take(N,[A|L]) => [A|take(N1,L)] :- number(N), N>0, N1 is N-1. 

automata_celular(L) => L1 :-
            first(L) >=> A,
	    last(L) >=> B,
	    M = ([B]++L++[A]),
	    particion(M) >=> P,
	    map1(rule1,P) >=> L1.

ac(L) => L1 :-
            first(L) >=> A,
	    last(L) >=> B,
	    M = ([B]++L++[A]),
	    particion(M) >=> P,
	    map1(rule1,P) >=> L1.

%A concise formulation of a cellular automaton.
ac1(L) => map1(rule1,particion([first(L)]++L++[last(L)])).

first([A|L]) => A.

%last(L) => B :- rev(L) >=> L1, first(L1) >=> B.

last(L) => first(rev(L)).
	
rule1([1,1,0]) => 1.
rule1([1,1,1]) => 0.
rule1([1,0,1]) => 1.
rule1([1,0,0]) => 0.
rule1([0,1,0]) => 1.
rule1([0,1,1]) => 0.
rule1([0,0,1]) => 1.
rule1([0,0,0]) => 0.

%life([[0,0,1],
%      [0,X,0],
%      [0,0,1]]) => ...

particion([]) => [].
particion([A,B,C]) => [[A,B,C]].
particion([A,B,C|L]) => [[A,B,C]|particion([B,C|L])].
	    

loopac(L) => loopac(L1) :- write(L), nl, ac1(L) >=> L1.

prefix([],S) => true.
prefix([A|X],[A|Y]) => and(prefix(X,Y),true).

%match(A,B) => T :- prefix(A,B) => T.

and(true,true) => true.
and(false,true) => false.
and(true,false) => false.
and(false,false) => false.

ones(0) => [].
ones(N) => [1|ones(N1)] :-
	number(N), N>0, N1 is N-1.

zeros(0) => [].
zeros(N) => [0|zeros(N1)] :-
	number(N), N>0, N1 is N-1.

repeat(0,X) => [].
repeat(N,X) => [X|repeat(N1,X)] :-
	number(N), N>0, N1 is N-1.


len([]) => 0.
len([A|X]) => 1+len(X).

subsets([]) => [[]].
subsets([A|Ls]) =>
      subsets(Ls)++(map(g(A),subsets(Ls))).

g(A,L) => [A]++L.

sum([]) => 0.
sum([A|X]) => A+sum(X) :- number(A).

average(X) => sum(X) / len(X). %0/0 is allowed.
evensum(X) => sum(even(X)).

even([]) =>[].
even([A|X]) => [A|even(X)] :- even(A).
even([A|X]) => even(X) :- odd(A).

qsort([]) => [].
qsort([A|L]) => qsort(lesser(A,L))++[A]++qsort(greater(A,L)).

lesser(A,[]) => [].
lesser(A,[B|L]) => if(le(B,A),[B|lesser(A,L)],lesser(A,L)).

greater(A,[]) => [].
greater(A,[B|L]) => if(leq(A,B),[B|greater(A,L)],greater(A,L)).

int(A,B) => [] :-
	number(A), number(B),
	B<A.
int(A,B) => [A] :-
	number(A), number(B),
	A==B.
int(A,B) => [A|int(A1,B)] :-
	number(A), number(B),
	A1 is A+1.

divides(N,M) => true :- M mod N =:=0.
divides(N,M) => false :- M mod N =\=0.

rint(A,B,Incr) => [] :- number(A), number(B), B<A.
rint(A,B,Incr) => [A] :- number(A), number(B), A==B.
rint(A,B,Incr) => [A|rint(A1,B,Incr)] :-
	number(A),
	number(B),
	A<B, A1 is A+Incr.

%For deriving a tail-recursive version, we use the embedding
%technique:

fact(N) => gfact(N,1).

				%gfact(N,M) => M*fac(N).



%0000000000000000000000000000000000000000000000000

gfact(1,M) => M.
%gfact(N,M) => M*N*fac(N1) :- N1 is N-1.
gfact(N,M) => gfact(N1,P) :- number(N), N>1,  P is M*N, N1 is N-1.




%0000000000000000000000000000000000000000000000000


% g(N) => (f(N),f(N1)) :- N1 is N-1.

% g(1) => (1,1).

% g(N) => (f(N),f(N1)) :- N>1, N1 is N-1.

% g(N) => (f(N1)+f(N2),f(N1)) :- N>1, N1 is N-1, N2 is N1-1.

% g(N) => (f(N1)+f(N2),f(N1)) :- B=f(N1), A=f(N2), N>1, N1 is
% 	N-1, N2 is N1-1.
% g(N) => (B+A,B) :- B=f(N1), A=f(N2), N>1, N1 is N-1, N2 is
% 	N1-1.

% g(N) => (B+A,B) :- g(N1)=(B,A), N>1, N1 is N-1, N2 is N1-1.

gg(1) => p(1,1).
gg(N) => p(C,B) :-  N>1, N1 is N-1, gg(N1)=>p(B,A), C is A+B.

fibb(N) => M :- number(N), g(N)=>p(M,S). %a kind of where...


%Conditionals.

if(E,X,_) => X :- E >> true.
if(E,_,Y) => Y :- E >> false.

evenq(A) => true :- mod(A,2) => 0.
evenq(A) => false :- mod(A,2) => 1.

oddq(A) => true :- mod(A,2) => 1.
oddq(A) => false :- mod(A,2) => 0.

mod(X,Y) => Z :- Z is X mod Y.
    
filter(P,[]) => [].
filter(P,[A|X]) => if(Cond,[A|filter(P,X)],filter(P,X)) :- Cond=..[P,A].

pegar(A,Ls) => [A|Ls].

map(F,[]) => [].
map(F,[A|L]) => [A1|map(F,L)] :- G=..[F,A], G => A1.
%map(F,[A|L]) => [A1|map(F,L)] :- G=..[F,A,L], G => A1.


ffact(N) => if(N==0,1,N*ffact(N-1)).     
%when (N>0) 
