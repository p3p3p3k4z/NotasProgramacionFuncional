data colores = Azul | Verde | Amarillo deriving Show
data Ropa = Camisa | Playera | Short deriving Show
data Estilo = Bueno | Malo deriving Show


--- dom: Ropa codomino: a
precio :: Num a = Ropa -> a

--- Exhaustiva para todos lo casos
precio Pantalon = 200
precio Playera = 2000
precio Short = 5

estilo Camisa Verde = Bueno
estilo Camisa Azul = Bueno
estilo Camisa Amarillo = Malo

estilo _ _ = error "No definido"
