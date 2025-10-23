
fib 0 = 1 --primera cláusula 
fib 1 = 1 --segundra cláusula
fib n | n>1 = fib (n-1) + fib (n-2)

-- análisis de eficiencia:   :set +s 
-- análisis de tipo:         :set +t 

fibs = (1:1:zipWith (+) fibs (tail fibs))



-- Método de generalización en tuplas

-- Deducción de una versión eficiente (lineal) de Fibonacci.

-- Junto dos cosas feas:
-- genFib n = (fib n, fib (n+1))

-- veo que fib (n+1) = fib n + fib (n-1)
-- tambien veo que genFib 0 = (fib 0, fib 1) = (1,1)

-- Esto es "desdoblar" fib (n+1):
-- genFib n = (fib n,  fib n + fib (n-1))

-- y esto es equivalente a:

-- genFib n =  (a,a+b) where
--     	 a= fib n
-- 	 b= fib (n-1))

genFib 0 = (1,1)
genFib n | n>0 = (a,a+b) where
       (b,a) = genFib (n-1) --- Comprobar que genFib (n-1)=(fib(n-1),fib n)

fibRedefinido n = fst (genFib n)

fact 0 = 1
fact n | n>0 = n * fact(n-1)

factAcum 0 = 1
factAcum n | n>0 = n * factAcum (n-1) 