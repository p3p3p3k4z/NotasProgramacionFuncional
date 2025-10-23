import Data.List

--- Algoritmos de ordenamiento....

-- El primero, quicksort (ordenamiento rápido).
-- (Hoare, 60s, siglo pasado). Idea: dividir y vencer.
-- Toma una lista (O en su caso, un arreglo). Toma un elemento
-- arbitrario de la lista, a. Toma los elementos de la lista menores
-- que a, lsaMenores; toma los elementos mayores que a, lsaMayores.
-- Aplica recursivamente ésta idea a lsaMenores y lsaMayores...
-- Pega todo. Tu lista debería estar ordenada.

quickSort [] = []
quickSort (a:bs) = quickSort [b | b<-bs, b<a] ++ [a] ++quickSort [b | b<-bs,b>=a]


mergeSort [] = []
mergeSort [a] = [a]
mergeSort (a:b:ls) =  res
	  where
	  	l = length (a:b:ls)
		(primerPar,segundoPar) = (take (div l 2) (a:b:ls), drop (div l 2) (a:b:ls))
                res = merge (mergeSort primerPar) (mergeSort segundoPar)

merge [] ls = ls
merge ls [] = ls
merge (a:bs) (b:cs) =
      if  a<=b then a:merge bs (b:cs) else b:merge (a:bs) cs

selectionSort [] = []
selectionSort (a:bs) = m:selectionSort (delete m (a:bs))
	      	     where
			    m=minimum (a:bs)
