:-op(400,xfx,when).
:-op(700,xfx,>>).
:-op(650,xfy,>=>).
:-op(600,xfy,=>).
:-op(500,xfy,++).

red(A,B) :- A >> B.

A >> C :- A >=> B, B>>C.
A >> A.

A >=> B :- A => B.
A >=> B :- 
    A=..[G,L], 
    L1 is L, 
    C=..[G,L1],
    C => B.    

A+B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1),
	C is A1+B1.
A+B >=> A1+B :- A >=> A1.
A+B >=> A+B1 :- B >=> B1.

A*B >=> C :- A >> A1, B >> B1,
	number(A1), number(B1),
        C is A1*B1.
    
A*B >=> A1*B :- A >=> A1.
A*B >=> A*B1 :- B >=> B1.

%[] >=> [].
%[A|Ls] >=> [A1|Ls1] :- A >=> A1, Ls >=> Ls1.    

if(T,X,_) >=> if(T,X1,_) :- T >> true, X => X1.
if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y => Y1.

    
fib(0) => 1.
fib(1) => 1.
fib(N) when (N>1) => fib(N-1)+fib(N-2).
    
fact(0) => 1.
fact(N) when (N>0) => N*fact(N-1).

%map(F,[]) => [].
%map(F,[A|Ls]) => [C1|map(F,Ls)] :- C=..[F,A], C=>C1.

A when B => if(B,A,false).
    

    
