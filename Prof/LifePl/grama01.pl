% M -> aMa 
% M -> aMd                                                 (a,M,a)
% M -> b

parser((a,M,a)) :- 
	parserT(a),
	parser(M),
	parserT(a).
parser((a,M,d)) :- 
	parserT(a),
	parser(M),
	parserT(d).
parser(M) :- M=b, parserT(b).
parser(M) :- M=d, parserT(d).

parserT(a).
parserT(b).
parserT(d).