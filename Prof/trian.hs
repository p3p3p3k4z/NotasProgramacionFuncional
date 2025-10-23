-- Triangulo de Pascal
--                                                          1
-- 						       1  1 
--                                                       1  2  1
-- 						     1 3  3  1
-- 						    1 4 6 4  1
-- 						  1 5 10 10 5 1
-- 						     1 3  3  1
-- 						         1 3  3  1
--------------------------------------------------------------
----------------------------------------1 4 6  4   1 
-- Triangulo de Sierpinsky
--                                                          1
-- 						       1  1 
--                                                       1  0 1
-- 						     1 1  1  1
-- 						    1 0 0 0  1
-- 					 	   1 1 0 0 1 1

--  (a+b)**n, n==3,  a**3+3a**2b+3ab**2+b**3

trian 0 = [1]
trian n | n>0 = [1]++ (zipWith (+) (trian (n-1))  (tail (trian (n-1) )))++[1]

trianDiferido 0 = [1]
trianDiferido n | n>0 =
	      [1]++ (zipWith (+) ls  (tail ls ))++[1]
	      	    where --Nombramiento diferido ,  optimización al evitar recálculos
		    		    ls = trianDiferido(n-1)

trianAnticipado 0 = [1]
trianAnticipado  n | n>0 = let ls = trianAnticipado (n-1) in 
	                                                             [1]++ (zipWith (+) ls  (tail ls ))++[1]
tabulador n | n >= 0= concat (take n (repeat "\t"))

-- imprimeLista [] = "listo"
--imprimeLista (a:bs) = [(show a)]:imprimeLista bs

--"putStrLn ( zipWith (++) (tabulador [0..20]) (concat (take 10 (repeat ".\t"))))

main = do
--         read n :: Integer % <- getLine          
         mapM_ putStrLn (map show (map trian [0..20])) --]))
-- "\t" ++ "[1]"
-- "\t \t" ++ "[1,1]"
-- "\t \t \t" ++ "[1,2,1]"