% M -> aMNa 
% M -> b
% N -> cNc
% N -> a


parser((a,M,N,a)) :- 
	parserT(a),
	parser(M),
	parser(N),
	parserT(a).
parser((c,N,c)) :-
	parserT(c),
	parser(N),
	parserT(c).
parser(N) :- N=a, parserT(a).
parser(M) :- M=b, parserT(b).

parserT(a).
parserT(b).
parserT(c).