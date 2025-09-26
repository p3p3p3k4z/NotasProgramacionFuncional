--- (def (fact n )
--- (if (eq? n 0) 1 (* n(fact (- n 1 )))))

-- 2+3*4, P (I 2) (M (I 3) (I 4))

-- Define un Tipo de Dato Algebraico para representar expresiones.
-- Una expresión puede ser un Entero (I), una Multiplicación (M) o una Suma (P).
data E = I Int | M E E | P E E deriving Show

-- Ejemplo de una expresión: 2 + (3 * 4), evaluacion semantica
ejemplo :: E
ejemplo = P (I 2) (M (I 3) (I 4))

-- Función 'eval' que interpreta una estructura E y la calcula, devolviendo un Int.
eval :: E -> Int
eval (I n) = n
eval (M n m) = (eval n) * (eval m)
eval (P n m) = (eval n) + (eval m)

-- Función 'aLista' que transforma una estructura E en una lista de los enteros que contiene.
aLista :: E -> [Int]
aLista (I n)   = [n]
aLista (M n m) = (aLista n) ++ (aLista m)
aLista (P n m) = (aLista n) ++ (aLista m)

-- Función 'factS' que construye una representación simbólica del factorial como una expresión E.
factS :: Int -> E
factS 0 = I 1
factS n | n > 0 = M (I n) (factS (n - 1))

-- Función factorial tradicional para comparación.
fact :: Int -> Int
fact 0 = 1
fact n | n > 0 = n * fact (n - 1)

-- Función para mostrar la estructura del árbol de una manera más visual (opcional).
mostrar :: E -> String
mostrar (I n) = show n
mostrar (M n m) = "( " ++ (mostrar n) ++ " * " ++ (mostrar m) ++ " )"
mostrar (P n m) = "( " ++ (mostrar n) ++ " + " ++ (mostrar m) ++ " )"
