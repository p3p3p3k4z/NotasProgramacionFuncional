data Color = Azul | Verde | Amarillo deriving Show
data Ropa = Camisa | Playera | Short deriving Show
data Estilo = Bueno | Malo deriving Show

--- cambiar es el nombre de la función
--- cambiar tiene aridad 1 (número de argumentos)
--- cambiar tiene como dominio Color
--- cambiar tiene como codominio Color
--- Las definiciones constan de varios casos
--- tratados por medio de cláusulas
--- y deben ser exclusivas, exhaustivas y no
--- redundantes.

cambiar :: Color -> Color
---Signatura o modo flecha
cambiar Azul = Verde
--- cambiar Azul = Amarillo
cambiar Amarillo = Azul
cambiar Verde = Amarillo

--- precio :: Num a => Ropa -> a
precio :: Ropa -> Int

precio Camisa = 200
precio Playera = 2000
precio Short = 5

estilo Camisa Verde = Bueno
estilo Camisa Azul = Bueno
estilo Camisa Amarillo = Malo
estilo _ _ = error "No definido"