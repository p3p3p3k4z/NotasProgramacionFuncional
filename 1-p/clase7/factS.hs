--- (def (fact n )
--- (if (eq? n 0) 1 (* n(fact (- n 1 )))))

-- 2+3*4, P (I 2) (M (I 3) (I 4))

data E = I Int | M E E | P E E deriving Show
-- evaluacion semantica
ejem = P (I 2) (M (I 3) (I 4))
eval (I n) = n
eval (M n m) = n1*m1
	where
		n1 = eval n
		m1 = eval m

eval (P n m) = n1+m1
	where
		n1  = eval n
		m1  = eval m


aLista (I n) = [n]
aLista (M n m) = (aLista n) ++ (aLista m)
factS 0 = I 1
factS n | n> 0 = M (I n) (factS (n-1))

mostrar:: E -> String
mostrar (I n) = show (I n)
mostrar (M n m) = "M \n"++(mostrar m)++ "\t" ++ (mostrar n)
mostrar (P n m) = "P \n"++(mostrar m)++ "\t" ++ (mostrar n)
fact 0 = 1
fact n | n>0 = n * fact(n-1)
