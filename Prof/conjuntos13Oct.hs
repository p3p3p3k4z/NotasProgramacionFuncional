import Data.Set
-- import Data.Char
-- import Data.List
-- import System.Random
-- Hallo(f) ween (ween, fiestas; hall=hell)

--- xy = [(x,y) | x<- ls, y<- ls]
---   where
---	ls = powerSet (fromList [1,2,3])

subsets [] = [[]]
--- subsets (a:ls) = (subsets ls) ++ (map (a:) (subsets ls))
subsets (a:ls) = ms ++ (map (a:) ms)
	where
		ms = subsets ls

xy = [(x,y) | x <- subsets [1,2,3,4], y <- subsets [1,2,3,4]]

