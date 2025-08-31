data S = I int | M S S | P S S deriving Show

-- 2+3+4
-- datos recursivos que se define por si mismo
ej = P (I 2) (M (I 3 (I 4))

eval (I n) = n
eval (M m n) = r where
			x1 = eval m
			y1 = eval n
			r = x1*y1

eval (P m n) = r where
			x1 = eval m
                        y1 = eval n
			r=x1+y2



