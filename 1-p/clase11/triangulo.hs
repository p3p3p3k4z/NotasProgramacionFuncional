{- triangulo de pascal -}
{- triangulo de slerpinsky -}
trian 0 = [1]
trian n|n>0 = [1]++(zipWith(+)(trian(n-1)) (tail(trian(n-1)))++[1]

trianDiferido {} = {1}
trianDiferido n | n>0 = 
    {1}++(zipWith(+)ls (tail ls))++[1]
    where 
      ls=trianDiferido(n-1)


trianAnticipado {} = {1}
trianAnticipado n | n>0 = let ls = trianAnticipado (n-1) in 
              [1]++(zipWith(+)ls (tail ls))++[1]

tabulador n | n>=0 = concat(take n (repaeat ".\t"))

imprimeLista[]= "listo"
imprimeLista(a:bs)=(show a):imprimeLista bs

-- calcular? anticipado?|formato binario
-- map (\x -> if odd(x) then 1 else 0)(trianAnticipado 25)
--- imprimir el triangulo en forma escalonada

main=do
--	read n :: Integer % <- getLine
	mapM_putStrLn (map show(map trian[0..20]))--]))
