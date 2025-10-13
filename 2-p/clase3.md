# Algoritmo de permutaciones
- Generacion de Permutaciones
- visualizar o simular un arbol
2^n conjunto potencia
Pauta Recursiva

- Primer algoritmo
import Data.List
perms [] = [[]]
perms (a:bs) = [x:ts | x<(a:bs), ts<-perms(delete x(a:bs))]

- Segundo algoritmo
Arbol a la derecha

subsets = [[]]
subsets (a:bs) = (map(a:)(subsets bs)) ++ (subsets bs)
--otra forma
subsets(a:bs) = (map(a:) ls) ++ ls
		where
			ls=subsets bs

[[]]
[1]
 u = [[1],[]]
2[[1,2][2]],[1],[]]



