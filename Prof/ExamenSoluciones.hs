

---1) Pegar 3 cadenas:

pegar3 ls ms ns = ls ++ ms ++ ns

--- Opcional:
pegar3' ls ms ns = concat [ls,ms,ns]

pegar3'' ls ms ns = foldr (++) [] [ls, ms, ns]

-- 2) palindromo

palindromo ls = (ls == reverse ls)

--- 3) where, let

funcion  = let n=10 in m+2*n
       	    	where
		   m=20

funcion2 = x+y
	   where
	       x = 10
	       y = let z=5 in z+z

sumaDoble a b = let s=a+b;  d = doble 5 in (s,d)
	  where
	     doble x = 2*x

-- 4, el factorial y el siguiente
fact 0 = 1
fact n | n>0 =n*fact(n-1)

factoriales2 n = (fact n, fact(n-1))
factoriales2' n = [fact n, fact(n-1)]
-- show. ..

-- Se distinguen en Haskell o en p.f. valores de acciones

