import Data.List

inicios ls = scanl (+) 0 ls
inicioss ls = scanl (++) [] ls
segmentos ls = scanr (:) [] ls
todos ls = (inits ls) ++ (reverse (segmentos ls))


[[1,2,3],
 [4,5,6]]

[[1,4],
[2,5],
[3,6]]