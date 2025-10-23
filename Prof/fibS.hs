
data E = I Integer | M E E | P E E deriving Show

---Signatura de una función f: Dar su dominio y codominio
fibS::Integer -> (Integer, E)  ---Tupla

fibS 0 = (1, I 0)
fibS 1 = (1, I 1)
fibS n | n>1 = suma (fibS (n-1)) (fibS (n-2)) where
         suma (x,y) (w,z) = (x+w, P y z)

imprimir (I 0) = " 1 "
imprimir (I 1) = " 0 "
imprimir (P x y) = " P \n"++ (imprimir x) ++ (imprimir y)

cantidad n = concat (take n ( repeat " "))

contarPlus (I n) = 0
contarPlus (P x y) = 1 + contarPlus x + contarPlus y

contarHojas (I n) = 1
contarHojas (P x y) = contarHojas x + contarHojas y

contarNodos x = contarHojas x + contarPlus x

fibs = 1:1:zipWith (+) fibs (tail fibs)