-- Define la función recursiva simple y poco eficiente.
-- La definición estándar de Fibonacci.
fib :: Int -> Int
fib 0 = 0 -- primera clausula
fib 1 = 1 -- segunda clausula
fib n
  | n > 1 = fib (n - 1) + fib (n - 2)
  | otherwise = error "Entrada no válida: la función fib solo acepta números no negativos."

-- analisis de eficiencia :set +s
-- analisis de tipo   :set +t


-- Define la lista infinita de Fibonacci de forma eficiente.
-- Utiliza "memoización" al almacenar los resultados en la lista.
fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- Función para obtener el n-ésimo número de Fibonacci de la lista eficiente.
-- La función '!!' es el operador de indexación de listas en Haskell.
fibEficiente :: Int -> Int
fibEficiente n = fibs !! n

-- Ejemplos de uso:
-- fibEficiente 6  -- dará 8
-- fib 6           -- también dará 8, pero de forma mucho más 
--

--Deduccion de una version eficiente (lineal) de Fibonacci
-- Junto dos cosas feas:
genfib n = (fib n, fib(n+1))

-- veo que fib (n+1) = fib n + fib (n-1)
-- tambien veo que genFib 0 = (fib 0, fib 1) =(1,1)
--
-- Esto es equivalente a:
-- genFib n = (a,a+b) where 
--                    a= fib n
--                    b= fib (n-1))

genFib 0 = (1,1)
genFib n | n>0 = (a,a+b) where
  (b,a) = genFib (n-1) --- comprobar que genFib (n-1)=(fib(n-1),fib n)

fibRedefinido n = fst (genFib n)
