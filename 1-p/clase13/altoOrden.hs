--- ejemplos de filter
ej1 = filter (odd)[1,2,3,4,5]
ej2 = filter (even)[1..20]
ej3 = filter (\x-> ((odd x)&&(x>10)))[1..20]
ej4 = filter (\x-> ((odd x) || (x>10)))[1..20]

--- ejemplos de map
ejm1 = map (odd)[1,2,3,4,5]
ejm2 = map (\x->x+1)[1..20]
ejm3 = map (\x->sum x)[[1,2,3],[1,2],[3,4,5,6]]
ejm4 = map (\x->map(\y->y*y)x)[[1,2,3],[1,2],[3,4,5,6]]
ejm5 = map sum (map (\x->map(\y->y*y)x)[[1,2,3],[1,2],[3,4,5,6]])

--- Teorema: map sum g (map h ls) = map (g.h) ls  

--- ejemplo de foldr
--- ambos tiene un operador op y una semilla. Donde aosicia a la derecha o a la izquierda
--- foldl/foldr op s [a,b,c] -> ((s op a) op b) op c) para este caso se asocia a la izquierda 
ejf1 = foldr(*)1[1..10]
ejf2 = foldr(+)0[1..10]
ejf3 = foldr(++)[][[1,2],[3,4],[4,2,1]]
ejf4 = foldr(:)[][[1,2],[3,4],[4,2,1]]

--- ejemplos de scanr
ejs1 = scanr (*) 1[1..10]
ejs2 = scanr (+) 0[1..10]
ejs3 = scanr (++) [] [[1,2],[3,4],[4,3,1]]
ejs4 = scanr (:) [] [[1,2],[3,4],[4,3,1]]


--- ejemplos de scanl
ejl1 = scanl (*) 1[1..10]
ejl2 = scanl (+) 0[1..10]
ejl3 = scanl (++) [] [[1,2],[3,4],[4,3,1]]
--- ejl4 = scanl (:) [] [1,2],[3,4],[4,3,1]]


--- import Data.Char
--- con :u foldr o otra funcion se puede ver manual
