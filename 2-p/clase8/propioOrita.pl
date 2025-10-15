% A -- > B --> C 
% A --> A 

rw(A,C):-t(A,B),rw(B,C).
% rw(A,C):-A=>B,rw(B,C)
rw(A,A)

% cambiar pero no puedo

% posibilidad de cambiar 

r(A+B,C):-number(A),number(C)
  C is A+B
r(A+B,A1+B):-r(A,A1)
% (A+B) => C :- number(A), number(B)
%     C is A+B
r(A+B,A+B1):-r(B,B1)
r(A*B,A1*B):-r(A,A1)
r(A*B,A*B1):-r(B,B1)

fib(0)=>1:-true.
fib(1)=>1:-true.
% r(fib(0),1)-
r(fib(N),fib(N1)+fib(N2)):-
N1 is N-1,
N2 is N-2.

len([])=>0:-true.
len[A[ls]]=>1+len(ls).
