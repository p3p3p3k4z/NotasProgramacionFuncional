:-op(400,xfx,when).
:-op(700,xfx,>>).
:-op(650,xfy,>=>).
:-op(600,xfy,=>).
:-op(500,xfy,++).
:-op(400,xfy,opo). %suma de vectores
:-op(399,xfy,omo). %multiplicacion por escalares
:-op(398,xfy,odo). %Producto interno
:-op(401,xfy,oxo). %Producto externo               
    

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
c(A,B) >=> c(A1,B) :- A>=>A1.
c(A,B) >=> c(A,B1) :- B>=>B1.    
fib(A) >=> fib(A1) :- A >=> A1.
fact(A) >=> fact(A1) :- A >=> A1.
ext(A,B) >=> ext(A1,B) :- A >=> A1.
ext(A,B) >=> ext(A,B1) :- B >=> B1.    
multmat(A,B) >=> multmat(A1,B) :- A >=> A1.
multmat(A,B) >=> multmat(A,B1) :- B >=> B1.    
map(F,Ls) >=> map(F,Ls1) :- Ls >=> Ls1.
foldr(A,S,Ls) >=> foldr(A,S,Ls1) :- Ls >=> Ls1.
filter(N,L) >=> filter(N,L1) :- L >=> L1.
if(T,X,_) >=> if(T,X1,_) :- T >> true, X >=> X1.
if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y >=> Y1.
take(N,Ls) >=> take(N1,Ls) :- N >=> N1.
take(N,Ls) >=> take(N,Ls1) :- Ls >=> Ls1.        
mat(A,B) >=> mat(A1,B) :- A >=> A1.
mat(A,B) >=> mat(A,B1) :- B >=> B1.
As ++ Bs >=> As ++ Bs1 :- Bs >=> Bs1.
As ++ Bs >=> As1 ++ Bs :- As >=> As1.    
A >=> B :- A => B.

    
%fact(N) >=> fact(N1) :- N => N1.    
%fib(N) >=> fib(N1) :- N => N1.    
A+0 => A.
0+A => A.    
A+B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1+B1.    
A-B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1-B1.    
A*1 => A.
1*A => A.    
A*B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1*B1.
A/B => C :- A >> A1, B >> B1,
    number(A1), number(B1),
    C is A1/B1.

c(A,B)+c(C,D) => c(E,F) :- 
    A >> A1, B >> B1,
    C >> C1, D >> D1, 
    number(A1), number(B1),
    number(C1), number(C1),    
    E is A1+C1,
    F is B1+D1.    
c(A,B)*c(C,D) => c(E,F) :- 
    A >> A1, B >> B1,
    C >> C1, D >> D1, 
    number(A1), number(B1),
    number(C1), number(C1),    
    E is A1*C1-B1*D1,
    F is C1*B1+A1*D1.    
c(A,B)*C => c(E,F) :- 
    A >> A1, B >> B1,
    C >> C1, 
    number(A1), number(B1),
    number(C1), 
    E is A1*C1,
    F is C1*B1.
C*c(A,B) => c(E,F) :- 
    A >> A1, B >> B1,
    C >> C1, 
    number(A1), number(B1),
    number(C1), 
    E is A1*C1,
    F is C1*B1.    
C+c(A,B) => c(A1+C,B1+C) :- 
    A >> A1, B >> B1,
    C >> C1, 
    number(A1), number(B1),
    number(C1).
c(A,B)+C => c(A1+C,B1+C) :- 
    A >> A1, B >> B1,
    C >> C1, 
    number(A1), number(B1),
    number(C1).
c(0,0) => 0. %Si parte imaginaria es 0, representar en reales.
c(A,B)+C => c(A1+C,B1+C) :- 
    A >> A1, B >> B1,
    number(A1), number(B1),
    number(C1).

v => [[0],[1]].
f => [[1],[0]].
sqr(X) => X*X.
sqrt(N) => R :- number(N),
            R is sqrt(N).

had => [omo((1/sqrt(2)),[1,1]),omo((1/sqrt(2)),[1,-1])].
xp => [[0,1],[1,0]].
yp => [[0,c(0,-1)],[c(0,1),0]]. 
zp => [[1,0],[0,-1]].     
mat(M,[[X],[Y]]) => [[C1],[C2]] :-
    M>>[[A1,A2],[B1,B2]],
    A1*X+A2*Y >> C1,
    B1*X+B2*Y >> C2.
ext([[A11,A12],[A21,A22]],[[B11,B12],[B21,B22]]) =>
[[A11*B11,A11*B12,A12*B11,A12*B12],    
[A11*B21,A11*B22,A12*B21,A12*B22],
[A21*B11,A21*B12,A22*B11,A22*B12],
[A21*B21,A21*B22,A22*B21,A22*B22]].

length([]) => 0.
length([A|Ls]) => 1+length(Ls).

null(A) => (A==[]).

%multmatg(A,B) => if(null(A) or null(head(A)),[],
%		    if(not(length(head(A))==length(B),"nada",
%			   map(generateRow,A)
multmat([[A11,A12],[A21,A22]],[[B11,B12],[B21,B22]]) =>
    [[odo([A11,A12],[B11,B21]),odo([A11,A12],[B12,B22])],
    [odo([A21,A22],[B11,B21]),odo([A21,A22],[B12,B22])]].
   
%[] >=> [].
%[A|Ls] >=> [A1|Ls1] :- A >=> A1, Ls >=> Ls1.    

%if(T,X,_) >=> if(T,X1,_) :- T >> true, X => X1.
%if(F,_,Y) >=> if(F,_,Y1) :- F >> false, Y => Y1.

%A when B => if(B,A,false).
    
fib(0) => 1.
fib(1) => 1.
%fib(N) when (N>1) => fib(N-1)+fib(N-2).
fib(N) => fib(N-1)+fib(N-2) :- N>1. %, N1 is N-1, N2 is N-2.

odo([],[]) => 0.
odo([A|Ls],[B|Ms]) => A*B+odo(Ls,Ms).
%normalize([c(a,b),c(d,e)]) => 
omo(A,[]) => [].
omo(A,[B|Ms]) => [(A*B)|omo(A,Ms)].

opo([],[]) => [].
opo([A|Ls],[B|Ms]) => [A+B|opo(Ls,Ms)].    
%map(lambda(X,T),[]) => [].
%map(lambda(X,T),[A|Bs]) => [U2|map(lambda(X,T),Bs)] :-
%lambda(X,T) =.. [U1|U2].
f(X,Y) => X*Y.
				
fact(0) => 1.
fact(N) => N*fact(N-1) :- N>0.

adjoin(A,Ls) => [A|Ls].
map(_F,[]) => [].
map(F,[A|Ls]) => [C1|map(F,Ls)] :- C=..[F,A], C>=>C1.
map(F,[A|Ls]) => [C1|map(F,Ls)] :- C=..[F|A], C>=>C1.

%filter(A,[]) => [].
%filter(A,[B|Ls]) => [B|filter(A,Ls)] :-     

transpose([[]|_]) => [].
transpose(M) => [map(head,M)|transpose(map(tail,M))].

head([A|Ls]) => A.
tail([A|Ls]) => Ls.
apply(lambda(X,[F,X])) => T :- T =.. [F,X].
lambda(X,[F,X]) => T :- T =.. [F,X].		       
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

show([]).
show([A|Ls]) :- 
    write(A),nl,
    show(Ls).
