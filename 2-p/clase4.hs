import Data.List
perms [] = [[]]
perms (a:bs) = [X:ts| x<-(a:bs), ts<-perms(delete x(a:bs))]

subsets [] = [[]]
subsets (a:bs) = (map (a:) ls) ++ ls
		where
			ls = subsets bs

ordenar ls = filter ordenado(perms ls) -- el mejor algoritmo
-- O(n!)

ordenado [] = True
ordenado [a] = True
ordenado (a:b:bs) = if a>b then False else True && ordenado (b:bs)

-- subsets(a:bs) = (map (a:)(subsets bs)) ++ (subsets bs)
-- [x | x<-subsets "hola", length x==2, ordenado x]
--
-- 
-- length [(x,y) | x<-[1..6, y<-[1--6]]]
-- length [(x,y) | x<-[1..6],y<-[1..6],x+y<=5]
