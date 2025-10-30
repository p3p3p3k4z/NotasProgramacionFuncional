import System.IO

leerDatos :: IO [Integer]
leerDatos = do
    contenido <- readFile "dato.txt"
    let lineas = lines contenido
    -- Convertimos cada linea (String) a Integer
    let numeros = map read lineas :: [Integer]
    return numeros
