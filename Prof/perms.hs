import Data.List
perms [] = [[]]
perms (a:bs) = [x:ts| x<-(a:bs), ts<-perms (delete x (a:bs))]
subsets [] = [[]]
subsets (a:bs) = (map (a:) ls) ++ ls
	       	 where
			ls = subsets bs
ordenar ls = head (filter ordenado (perms ls)) --worst ever algorithm in your life!!!!)
-- O(n!)
ordenado [] = True
ordenado [a] = True
ordenado (a:b:bs) = if a>b then False else True && ordenado (b:bs)

-- subsets (a:bs) = (map (a:) (subsets bs)) ++ (subsets bs)
-- [[]]
-- [1]
--   u = [[1],[]]
--[[1,2],[2],[1],[]] 