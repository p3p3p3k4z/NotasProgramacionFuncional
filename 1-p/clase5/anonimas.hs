-- Define una función de suma curried. Correcto.
suma x y = x + y

-- Versión original de 'sectionSuma3'. Funciona, pero hay una mejor manera.
-- sectionSuma3 y = suma 3 y

-- Versión mejorada usando una sección de operador. Es la forma idiomática.
-- Se crea una función que suma 3 a cualquier argumento.
sectionSuma3 = (+3)

-- Esta línea es correcta y demuestra el concepto de currying.
-- Equivale a la línea anterior.
sectionPura = suma 3

-- Versión correcta y más idiomática de la función anónima.
-- Es una función anónima que toma un 'x' y le suma 3.
anonimaSuma3 = (\x -> x + 3)

-- Un ejemplo de cómo usar una función anónima para sumar 3 a cada elemento de una lista.
ejemploMap = map (\x -> x + 3) [1, 2, 3, 4]
-- El resultado sería [4, 5, 6, 7]
