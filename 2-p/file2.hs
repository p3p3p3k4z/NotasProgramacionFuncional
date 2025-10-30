import System.IO
import Data.Char (toUpper) -- Importado de tu archivo io3files.hs, aunque no se usa aquí

-- Función que lee el archivo y devuelve la lista de números
leerDatos :: IO [Integer]
leerDatos = do
    contenido <- readFile "dato.txt"
    let lineas = lines contenido
    -- Convertimos cada linea (String) a Integer
    let numeros = map read lineas :: [Integer]
    return numeros

-- Función 'main' para ejecutar el programa
main :: IO ()
main = do
    putStrLn "Leyendo números del archivo 'dato.txt'..."
    numerosLeidos <- leerDatos
    putStrLn "Lectura completa. Los números son:"
    print numerosLeidos
