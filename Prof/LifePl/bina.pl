frase(X) :- G=m,
	pronombre(A,G),
	sustantivo(B,G),
	verbo(C,Atr),
	adjetivo(D,G,Atr),
	X=[A,B,C,D].
	

pronombre(el,m).
pronombre(la,f).
sustantivo(casa,f).
sustantivo(arbol,m).
sustantivo(rana,f).
sustantivo(sapo,m).
verbo(es,na).
verbo(esta,na).
verbo(tiene,a).
adjetivo(grande,m,na).
adjetivo(grande,f,na).
adjetivo(alto,m,na).
adjetivo(gordo,m,na).
adjetivo(flaco,m,na).
adjetivo(alta,f,na).
adjetivo(gorda,f,na).
adjetivo(flaca,f,na).
adjetivo(hojas,a).





sumaBin(hoja(I),I).
sumaBin(binario(X,Y),M) :-
	sumaBin(X,M1),
	sumaBin(Y,M2),
	M is M1+M2.

dato(binario(binario(hoja(1),hoja(2)),binario(hoja(1),hoja(3)))).