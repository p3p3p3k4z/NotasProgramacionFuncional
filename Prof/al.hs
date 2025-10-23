import Data.List

dot [] [] = 0
dot (a:bs) (b:cs) = a*b+dot bs cs

norm v = sqrt (dot v v)

perpendicular v w = dot v w==0

determinante [[a,b],[c,d]] = a*d - b*c

multMat [[a,b],[c,d]] = [[dot [a,b] [a,c],dot [a,b] [b,d]],[dot [c,d] ...