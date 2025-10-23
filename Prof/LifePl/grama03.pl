% M -> aMNLa 
% M -> b
% N -> cNc
% N -> a
% L  -> d


parser(t(a,M,N,L,a)) :- 
	parserT(a),
	parser(M),
	parser(N),
	parser(L),
	parserT(a).
parser(t(c,N,c)) :-
	parserT(c),
	parser(N),
	parserT(c).
parser(N) :- N=a, parserT(a).
parser(M) :- M=b, parserT(b).
parser(L) :- M=d, parserT(d).

parserT(a).
parserT(b).
parserT(c).
parserT(d).

A -> A+A
A -> A*A
A -> números.
