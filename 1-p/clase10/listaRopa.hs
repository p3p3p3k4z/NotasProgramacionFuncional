import Data.Char

data Ropa = Pantalon | Camisa | Calzado deriving (Show, Eq)
data Lista = Nil | L Ropa Lista deriving Show

ej1 = L Camisa (L Pantalon (L Calzado (L Pantalon Nil)))
ej2 = L Calzado (L Camisa (L Pantalon (L Calzado (L Pantalon Nil))))
-- ej3 tenía un error de sintaxis al final, se ha comentado.
-- ej3 = L Camisa (L Calzado (L Camisa (L Pantalon (L Calzado (L Pantalon Nil)))))

--- borrar un elemento de una lista
--- Agregar un elemento al frentte de la lista
--- Duplicar cada elemento de una lista
--- Contar los elementos de una lista
--- Invertir una lista
--- Pegar dos lista
--- Pegar tres listas

--- Para borrar la primera o borrar toda ocurrencia
--- Hagamos las dos funciones. Pensemos en division de casos
--- Caso vacio y no vacio
--- Asi sere mas inteligente de lo que era ayer ( eso que XDDD)

borrar1 :: Ropa -> Lista -> Lista
borrar1 elemento Nil = Nil
borrar1 elemento (L a is) = if elemento == a then is
			else (L a (borrar1 elemento is))

--- battle matching

borrarTodos :: Ropa -> Lista -> Lista
borrarTodos elemento Nil = Nil
borrarTodos elemento (L a is) = if elemento == a then (borrarTodos elemento is)
				else (L a (borrarTodos elemento is))

agregar :: Ropa -> Lista -> Lista
agregar elemento lista = L elemento lista

duplicar :: Lista -> Lista
duplicar Nil = Nil
duplicar (L a ls) = (L a (L a (duplicar ls)))

----------------------------------------------------
-- NUEVAS FUNCIONES IMPLEMENTADAS
----------------------------------------------------

-- --- Contar los elementos de una lista
contar :: Lista -> Int
contar Nil = 0
contar (L _ ls) = 1 + contar ls

-- --- Invertir una lista
invertir :: Lista -> Lista
invertir lista = invertirAux lista Nil
  where
    invertirAux :: Lista -> Lista -> Lista
    invertirAux Nil acumulador = acumulador
    invertirAux (L a ls) acumulador = invertirAux ls (L a acumulador)

-- --- Pegar dos lista
pegar :: Lista -> Lista -> Lista
pegar Nil l2 = l2
pegar (L a ls) l2 = L a (pegar ls l2)

-- --- Pegar tres listas
pegarTres :: Lista -> Lista -> Lista -> Lista
pegarTres l1 l2 l3 = pegar (pegar l1 l2) l3
