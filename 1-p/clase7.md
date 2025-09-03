### Cadenas y Listas

ghci> eval (factS 10)
3628800
ghci> factS 10
M (I 10) (M (I 9) (M (I 8) (M (I 7) (M (I 6) (M (I 5) (M (I 4) (M (I 3) (M (I 2) (M (I 1) (I 1))))))))))

ghci> aLista (factS 3)
[3,2,1,1]
ghci> aLista (factS 10)
[10,9,8,7,6,5,4,3,2,1,1]

ghci> product (aLista (factS 10))
3628800



- Pruebas con lista
ghci> show "Hola Mundo"
"\"Hola Mundo\""
ghci> show 23243
"23243"
ghci> reverse (show 23243)
"34232"
ghci> reverse (show (1,2,3))
")3,2,1("
ghci> reverse (show (1,2+3+4,3))
")3,9,1("
ghci> putStr "hola"
holaghci> 
ghci> "hu"++"mano"
"humano"
ghci> putStrLn "hola"
hola
ghci> putStr "hola \n\n \t prueba"
hola 

 	 pruebaghci> 
ghci> concat [[1,2,3],[2,3,4],[4,5,3]]
[1,2,3,2,3,4,4,5,3]
ghci> putStr $ concat ((take 5 (repeat "\t"))) ++ "hola\t\n"
					hola	


