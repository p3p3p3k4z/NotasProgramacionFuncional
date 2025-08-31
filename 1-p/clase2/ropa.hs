-- Define el tipo de datos 'Colores' para los colores de las prendas
-- Las convenciones de Haskell sugieren que los nombres de los tipos de datos
-- deben comenzar con una letra mayúscula.
data Colores = Azul | Verde | Amarillo deriving Show

-- Define el tipo de datos 'Ropa' con los tipos de prendas.
-- Se ha agregado 'Pantalon' para que la funcion 'precio' sea valida.
data Ropa = Camisa | Playera | Short | Pantalon deriving Show

-- Define el tipo de datos 'Estilo' para el resultado de la funcion 'estilo'
data Estilo = Bueno | Malo deriving Show

-- Firma de la funcion 'precio'
-- Dominio: Ropa. Codominio: cualquier tipo numerico 'a' (Int, Float, etc.).
-- 'Num a =>' es un 'contexto' de tipo que indica que 'a' debe ser un numero.
precio :: Num a => Ropa -> a

-- Definiciones de la funcion 'precio'.
-- Es 'exhaustiva' porque define un valor para cada caso del tipo 'Ropa'.
precio Camisa   = 1200
precio Pantalon = 200
precio Playera  = 2000
precio Short    = 5

-- Firma de la funcion 'estilo'
-- Dominio: Ropa y Colores. Codominio: Estilo.
estilo :: Ropa -> Colores -> Estilo

-- Definiciones de la funcion 'estilo' para el caso de 'Camisa'.
-- Estas clausulas son 'exclusivas' porque no se sobreponen.
estilo Camisa Verde    = Bueno
estilo Camisa Azul     = Bueno
estilo Camisa Amarillo = Malo

-- La linea a continuacion es una 'clausula de captura'.
-- El guion bajo '_' es un patron que coincide con cualquier cosa.
-- Esto asegura que la funcion maneje cualquier combinacion no definida.
estilo _ _ = error "No definido"