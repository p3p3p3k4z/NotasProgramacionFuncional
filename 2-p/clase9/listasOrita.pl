% Predicado para simplificar expresiones aritméticas

r(A, A) :- number(A).

r(A+B, C) :- 
    number(A), number(B), C is A + B.
r(A+B, A1+B) :- r(A, A1).
r(A+B, A+B1) :- r(B, B1).

r(A*B, C) :-
    number(A), number(B), C is A * B.
r(A*B, A1*B) :- r(A, A1).
r(A*B, A*B1) :- r(B, B1).

map(F,Hs) =>

% Fibonacci: devuelve expresión simbólica para fib(N)
fib(0, 1).
fib(1, 1).
fib(N, fib(N1) + fib(N2)) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2.

% Longitud de una lista como expresión simbólica para len(Lista)
len([], 0).
len([_|Ls], N) :-
    len(Ls, N1),
    N is N1 + 1.

% Ejemplo: para evaluar len([a,b,c], L)
% ?- len([a,b,c], L).
% L = 3.

% También puedes usar r/2 para evaluar expresiones simbólicas
% Por ejemplo:
% ?- fib(4, Expr), r(Expr, Resultado).
% Expr = fib(3) + fib(2),
% Resultado = ...

% Para evaluar fib completo, deberías definir un predicado que evalúe esas expresiones simbólicas de fib recursivamente.

map(F.[]] => [].
map(F,[A|Ls]) => [F(A)map(F|Ls)]:-G=..[F,A].
map(F,Ls) => [] :- N=M.

range(N,M)
