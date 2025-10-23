:- op(750,xfy, >>).
:- op(700,xfy,=>).

    %    fact(1) => 1 :- true.

% A ----------------------> B ------------------------------->C
%    A------------------------------------>0A

   A>> C :- A=>B, B>>C.
   A>>A.

   
    (A+B) => C :- number(A), number(B),
                     C is A+B.
    (A*B) => C  :- number(A), number(B),
                     C is A*B.
    (A+B) => (A1+B) :- A => A1.
    (A+B) => (A+B1) :- B => B1.
    (A*B) => (A1*B) :-  A => A1.
    (A*B)  => (A*B1) :- B => B1.
    [A|Ls] => [A1|Ls] :- A => A1.
    [A|Ls] => [A |Ls1] :- Ls => Ls1.
    map(F,Hs) => map(F1,Hs) :- F => F1.
    map(F,Hs) => map(F,Hs1) :- Hs => Hs1.
    
fib(0) =>1 :- true.
fib(1) => 1 :- true.
fib(N) => (fib(N1)+fib(N2)) :-
   N1 is N-1,
   N2 is N-2.

fact(0) =>1 :- true.
fact(N) => (N*fact(N1)) :-
   N1 is N-1.

  len([]) => 0 :- true.
  len([_A|Ls])  => 1 + len(Ls).

 map(_F,[]) => [] :- true.
 map(F,[A|Ls]) => [G|map(F,Ls)] :- G=..[F,A].
    
 range(N,M) => [] :- N==M.
 range(N,M) => [N|range(N1,M)] :- N1 is N+1.
    
%    (a:ls)
    

    
    
