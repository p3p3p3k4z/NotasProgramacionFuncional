import Data.Char

main1 = do
     putStrLn "--------------Dame el dato....."
     x <- getLine
     let y  = read x::Int
     putStrLn ".-----El doble de tu dato es: ...."
     putStrLn (show (y+y))

main = do
     putStrLn "--------------Dame el mensaje....."
     x <- getLine
     putStrLn (map chr (map (1+) (map ord x)))





--- Ejercicio: tomen un numero. Como salida, pongan el doble, el triple
--- y el numero a la tercera potencia.

--- Otro ejercicio: Toman una cadena o mensaje.
--- map chr (map (+1) (map ord M))          (*)

--- Ejercicio: Escriba un programa que tome una cadena como mensaje
--- y la encripte segun (*)