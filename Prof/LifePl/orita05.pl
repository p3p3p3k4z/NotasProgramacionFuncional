:-op(400,xfx,when).
:-op(700,xfx,>>).
:-op(650,xfy,>=>).
:-op(600,xfy,=>).
:-op(500,xfy,++).

red(A,B) :- A >> B.

A >> C :- A >=> B, B>>C.
A >> A.


A >=> B :- 
     A=..[G,L], 
     L >=> L1, 
     C=..[G,L1],
     C >=> B.    
A+B >=> A1+B :- A >=> A1.
A+B >=> A+B1 :- B >=> B1.    
A-B >=> A1-B :- A >=> A1.
A-B >=> A-B1 :- B >=> B1.    
A*B >=> A1*B :- A >=> A1.
A*B >=> A*B1 :- B >=> B1.
A/B >=> A1/B :- A >=> A1.
A/B >=> A/B1 :- B >=> B1.
[A|B] >=> [A1|B] :- A >=> A1.
[A|B] >=> [A|B1] :- B >=> B1.    
zip(As,Bs) >=> zip(As1,Bs) :- As >=> As1.
zip(As,Bs) >=> zip(As,Bs1) :- Bs >=> Bs1.    
zipW(A,Bs,Cs) >=> zipW(A,Bs1,Cs) :- Bs >=> Bs1.
zipW(A,Bs,Cs) >=> zipW(A,Bs,Cs1) :- Cs >=> Cs1.    
fib(A) >=> fib(A1) :- A >=> A1.
fact(A) >=> fact(A1) :- A >=> A1.    
map(F,Ls) >=> map(F,Ls1) :- Ls >=> Ls1.
foldr(A,S,Ls) >=> foldr(A,S,Ls1) :- Ls >=> Ls1.
filter(N,L) >=> filter(N,L1) :- L >=> L1.
if(T,X,_) >=> if(T,X1,_) :- T >> true, X >=> X1.
if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y >=> Y1.
take(N,Ls) >=> take(N1,Ls) :- N >=> N1.
take(N,Ls) >=> take(N,Ls1) :- Ls >=> Ls1.        
As ++ Bs >=> As ++ Bs1 :- Bs >=> Bs1.
As ++ Bs >=> As1 ++ Bs :- As >=> As1.    
A >=> B :- A => B.

    
%fact(N) >=> fact(N1) :- N => N1.    
%fib(N) >=> fib(N1) :- N => N1.    

A+B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1+B1.    
A-B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1-B1.    
A*B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1*B1.
A/B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1/B1.


%[] >=> [].
%[A|Ls] >=> [A1|Ls1] :- A >=> A1, Ls >=> Ls1.    

%if(T,X,_) >=> if(T,X1,_) :- T >> true, X => X1.
%if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y => Y1.

%A when B => if(B,A,false).
    
fib(0) => 1.
fib(1) => 1.
%fib(N) when (N>1) => fib(N-1)+fib(N-2).
fib(N) => fib(N-1)+fib(N-2) :- N>1. %, N1 is N-1, N2 is N-2.

fact(0) => 1.
fact(N) => N*fact(N-1) :- N>0.

map(_F,[]) => [].
map(F,[A|Ls]) => [C1|map(F,Ls)] :- C=..[F,A], C>=>C1.

%filter(A,[]) => [].
%filter(A,[B|Ls]) => [B|filter(A,Ls)] :-     

range(N,M) => [] :- N>M.
range(N,M) =>  [N|range(N1,M)] :- N1 is N+1.     

As++Bs => Cs :- append(As,Bs,Cs).    

reverse([]) => [].
reverse([A|Ls]) => reverse(Ls)++[A].    
    
take(0,_Ls) => [].
take(_N,[]) => [].
take(N,[A|Ls]) => [A|take(N1,Ls)] :- N1 is N-1.     

if(E,X,_) => X :- E >> true.
if(E,_,Y) => Y :- E >> false.

evenq(A) => true :- mod(A,2) => 0.
evenq(A) => false :- mod(A,2) => 1.

oddq(A) => true :- mod(A,2) => 1.
oddq(A) => false :- mod(A,2) => 0.

mod(X,Y) => Z :- Z is X mod Y.
    
filter(P,[]) => [].
filter(P,[A|X]) => if(Cond,[A|filter(P,X)],filter(P,X)) :- Cond=..[P,A].

cons(A,Ls) => [A|Ls].
    
flow(N) => [N|flow(N1)] :- %Opt: writeln(N), 
    N1 is N+1.    

zip([],Ls) => [].
zip(Ls,[]) => [].
zip([A|Ls],[B|Ms]) => [(A,B)|zip(Ls,Ms)].

zipW(_F,[],Ls) => [].
zipW(_F,Ls,[]) => [].
zipW(F,[A|Ls],[B|Ms]) => [G|zipW(F,Ls,Ms)] :- G=..[F,A,B].

foldr(Op,S,[])  => S.
foldr(Op,S,[A|Ls]) => C :- 
    B=..[Op,S,A], C=..[Op,B,foldr(Op,S,Ls)].

%-- foldr (*) 1 [a,b,c] = (a*(b*(c*1))

append([],As,As).
append([A|As],Bs,[A|Cs]) :- append(As,Bs,Cs).    
