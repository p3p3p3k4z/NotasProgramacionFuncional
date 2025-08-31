data Color = Azul | Verde | Amarillo deriving Show

--- cambiar el nombre de la funcion
--- cambiar tiene aridad 1 (numero de argumentos)
--- cambiar tiene como dominio/codominio Color
--- Las definiciones constan de varias casos tratados por medio de clausulas y deben de ser exclusivs, exhaustivas y no redundantes

cambiar :: Color -> Color
--- Signatura o flecha
cambiar Azul = Verde
--- cambiar Azul = Amarillo
cambiar Amarillo = Azul

