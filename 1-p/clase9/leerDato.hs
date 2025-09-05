-- esta libreria es para el mensaje
-- import Data.Char

main = do
    putStrLn "... Dame el Dato ..."
	--- en este momento x es un string
    x <- getLine
    let y = read x::Int
    putStrLn "... El doble de tu dato es: ..."
    putStr (show (y+y))


--- Otro ejercico tomar cadena o mensaje
--- map chr (map (+1) (map ord M)

