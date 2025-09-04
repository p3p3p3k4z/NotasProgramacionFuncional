data E = I Integer | M E E | P E E deriving Show

-- fibS: Devuelve el n-ésimo número de Fibonacci y una representación de su cálculo
fibS :: Integer -> (Integer, E)

fibS 0 = (1, I 0)
fibS 1 = (1, I 1)
fibS n
  | n > 1 = (f1 + f2, P e1 e2)
  | otherwise = error "Entrada inválida: n debe ser un entero no negativo"
  where
    (f1, e1) = fibS (n - 1)
    (f2, e2) = fibS (n - 2)

-- imprimir: Convierte la representación E a una cadena de texto
imprimir :: E -> String

imprimir (I n) = show n
imprimir (P x y) = "P\n" ++ imprimir x  ++ imprimir y
-- imprimir (M x y) = "M(" ++ imprimir x ++ ", " ++ imprimir y ++ ")"

cantidad n = concat ( take n ( repeat " "))

contarPlus (I n) = 0
contarPlus (P x y) = 1 + contarPlus x + contarPlus y

contarHojas (I n) = 1
contarHojas (P x y) = contarHojas x + contarHojas y

contarNodos x = contarHojas x + contarPlus x

