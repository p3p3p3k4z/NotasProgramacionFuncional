-- La funcion 'tomar' recibe un numero 'n' y una lista 'xs',
-- y devuelve una nueva lista con los primeros 'n' elementos de 'xs'.
tomar :: Int -> [a] -> [a]

-- Caso base: si 'n' es 0, la funcion devuelve una lista vacia, sin importar la lista de entrada.
tomar 0 _ = []

-- Caso recursivo: si 'n' es mayor que 0, tomamos el primer elemento (a)
-- y lo agregamos a una llamada recursiva para tomar 'n-1' elementos del resto de la lista (bs).
tomar n (a:bs) = a : tomar (n - 1) bs

-- La funcion 'duplicar' recibe una lista 'xs' y
-- devuelve una nueva lista con cada elemento duplicado.
doble :: [a] -> [a]

-- Caso base: si la lista de entrada es vacia, la funcion devuelve una lista vacia.
doble [] = []

-- Caso recursivo: si la lista tiene un elemento (a) y el resto (bs),
-- se duplica el elemento 'a' y se llama recursivamente a 'doble' para el resto de la lista.
doble (a:bs) = a : a : doble bs