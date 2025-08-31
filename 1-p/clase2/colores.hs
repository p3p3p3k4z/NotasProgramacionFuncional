-- Define un nuevo tipo de dato llamado 'Color' con tres posibles valores: Azul, Verde y Amarillo.
-- 'deriving Show' permite que los valores de tipo 'Color' se puedan convertir a una cadena de texto para ser impresos.
data Color = Azul | Verde | Amarillo deriving Show

-- La 'signatura' de la función 'cambiar' declara su tipo.
-- Indica que la función toma un argumento de tipo 'Color' y devuelve un valor de tipo 'Color'.
cambiar :: Color -> Color

-- Las 'cláusulas' definen el comportamiento de la función para cada caso específico.
-- La aridad de la función es 1, ya que toma un solo argumento.
-- Las definiciones deben ser 'exhaustivas' (cubrir todos los casos posibles) y 'exclusivas' (no haber superposiciones).
-- En este caso, se ha comentado una línea para evitar la redundancia y conflictos.
cambiar Azul = Verde
-- cambiar Azul = Amarillo -- Esta línea está comentada porque choca con la anterior.
cambiar Verde = Amarillo
cambiar Amarillo = Azul