import Data.Set
import Data.Chr
import Data.List
--import System.Random

--xy = [(x,y) | x<-powerSet (fromList[1,2,3,4]), y<-(powerSet(fromList[1,2,3,4]))]

-- xy = [(x,y) | x<-ls,y<-ls]
-- where
--ls=powerSet(fromList[1,2,3])

subsets[] = [[]]
-- subsets(a:ls)=(subsets ls) ++ (map(a:)(subsets ls))
subsets(a:ls)=ms ++ (map(a:) ms)
 where 
    ms=subsets ls

xy=[(x,y) | x<-map fromList(subsets[1,2,3,4]), y<-map fromList(subsets[1,2,3,4]])

