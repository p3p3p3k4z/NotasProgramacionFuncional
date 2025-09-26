import System.IO

{- Triángulo de Pascal y Triángulo de Sierpinski -}

-- Versión optimizada del Triángulo de Pascal usando 'let' (nombramiento anticipado).
-- Es la base para todo lo demás.
pascal :: Int -> [Integer]
pascal 0 = [1]
pascal n | n > 0 = let ls = pascal (n - 1)
                   in [1] ++ zipWith (+) ls (tail ls) ++ [1]

-- Genera una fila del Triángulo de Sierpinski a partir de una fila del de Pascal.
-- Convierte los números impares a 1 y los pares a 0.
sierpinski :: Int -> [Integer]
sierpinski n = map (\x -> if odd x then 1 else 0) (pascal n)

-- --- Funciones para imprimir los triángulos de forma bonita ---

-- Prepara una sola fila para ser impresa, convirtiendo números a strings.
formatoFila :: [Integer] -> String
formatoFila fila = unwords (map show fila)

-- Imprime una serie de filas, calculando el padding para centrarlas.
imprimirTriangulo :: (Int -> [Integer]) -> Int -> IO ()
imprimirTriangulo generador numFilas = do
    let filas = map generador [0..numFilas-1]
    let ultimaFila = formatoFila (last filas)
    let anchoMax = length ultimaFila
    
    mapM_ (imprimirFilaCentrada anchoMax) filas

-- Imprime una fila individual con el padding necesario para centrarla.
imprimirFilaCentrada :: Int -> [Integer] -> IO ()
imprimirFilaCentrada anchoMax fila = do
    let filaStr = formatoFila fila
    let padding = replicate ((anchoMax - length filaStr) `div` 2) ' '
    putStrLn (padding ++ filaStr)

-- --- Punto de entrada del programa ---
main :: IO ()
main = do
    putStrLn "--- Triángulo de Pascal ---"
    imprimirTriangulo pascal 16

    putStrLn "\n--- Triángulo de Sierpinski (mostrado con 1s y 0s) ---"
    imprimirTriangulo sierpinski 16
