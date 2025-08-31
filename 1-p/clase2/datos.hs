-- Define un tipo de dato 'S' para expresiones.
-- 'I' representa un numero entero (integer).
-- 'M' representa una multiplicacion de dos expresiones.
-- 'P' representa una suma de dos expresiones.
data S = I Int | M S S | P S S deriving Show

-- Ejemplo de una expresion que representa (2 + (3 * 4))
ej :: S
ej = P (I 2) (M (I 3) (I 4))

-- La funcion 'eval' evalua la expresion definida por el tipo de dato 'S'.
eval :: S -> Int

-- Caso base: Si es un numero entero 'I n', la evaluacion es el mismo numero 'n'.
eval (I n) = n

-- Caso recursivo: Si es una multiplicacion 'M m n',
-- se evaluan las subexpresiones 'm' y 'n' y se multiplican los resultados.
eval (M m n) = (eval m) * (eval n)

-- Caso recursivo: Si es una suma 'P m n',
-- se evaluan las subexpresiones 'm' y 'n' y se suman los resultados.
eval (P m n) = (eval m) + (eval n)