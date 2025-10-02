permutaciones :: [a] -> [[a]]
permutaciones [] = [[]]
permutaciones xs = [ y:zs | (y, ys) <- seleccionar xs, zs <- permutaciones ys ]

seleccionar :: [a] -> [(a, [a])]
seleccionar [] = []
seleccionar (x:xs) = (x, xs) : [ (y, x:ys) | (y, ys) <- seleccionar xs ]


