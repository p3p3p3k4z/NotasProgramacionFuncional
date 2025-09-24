import Data.List

dot [][] = 0
dot(a:bs)(b:cs)=a*b+dot bs cs

norma v = sqrt(dot v v)

perpendicular v w = dot v w== 0
