
data S = I Int | M S S | P S S deriving Show

-- 2+3*4
ej = P (I 1) (M (I 3) (I 4))

eval (I n) = mod n 2
eval (M m n) = r where
                   x1 = eval m
                   y1 = eval n
                   r = x1*y1               
eval (P m n) = r where
                   x1 = eval m
                   y1 = eval n
                   r = x1+y1