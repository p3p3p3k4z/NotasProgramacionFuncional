import Data.Char

data Ropa = Pantalon | Camisa | Calzado deriving (Show.Eq)
data Lista = Nil | L Ropa Lista deriving Show

ej1= L Camisa(L Pantalon (L Calzado (L Pantalon Nil)))
ej2= L Calzado(L Camisa (L Pantalon (L Calzado (L Pantalon Nil))))
ej3= L Camisa(L Calzado (L Camisa (L Pantalon (L Calzado (L Pantalon Nil)))))+

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

borrar1 elemento Nil = Nil
borrar1 elemento (L a is) = if elemento == a then is
			else (L a(borrar1 elemento is))

--- battle matching

borrarTodos elemento Nil = Nil
borrarTodo elemento (L a is) = if elemento==a then(borrarTodo a is)
				else (L a (borrarTodo elemento is))
agregar elemento Nil = L elemento Nil
agregar elemento (L a ls) = L elemento (L a ls)

duplicar elemento Nil = Nil
duplicar (L a ls) = (L a(L a(duplicar ls)))
