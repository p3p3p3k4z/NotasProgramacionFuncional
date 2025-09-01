-- Define la función recursiva simple y poco eficiente.
-- La definición estándar de Fibonacci.
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n
  | n > 1 = fib (n - 1) + fib (n - 2)
  | otherwise = error "Entrada no válida: la función fib solo acepta números no negativos."

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
-- fib 6           -- también dará 8, pero de forma mucho más lenta.

-- dos cosas malas
genFIb 0 0 (1,1)
genFib n = (a, a+b) where
	(a,b) = genFib (n-1)

		a = fib n
