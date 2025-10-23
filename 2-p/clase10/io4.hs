import System.IO
-- ejemplo de generacion de daros desde haskell
ls = concat["test"++show(x,y)++". " | x<-[1..10],y<-[1..10],x<y]

main::IO()
main = do

	writwFile "output.txt" ls
	putStrLn "Content writtem to output.txt"

-- Apend output to an existing file
appendFile "output2.txt" "\Appendingmore text"

