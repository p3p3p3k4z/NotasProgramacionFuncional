###Funciones Lambda y Anónimas

Las funciones lambda son funciones pequeñas y anónimas que se definen sin un nombre formal. Su principal propósito es crear funciones simples para usarlas de forma inmediata, sin la necesidad de una declaración completa.

La sintaxis en Python es lambda argumentos: expresión. Por ejemplo:
Python

- Esta lambda espera dos argumentos, x e y, y suma el primero con 3.

(lambda x, y: x + 3)(4, 5) # Devuelve 7

En Haskell, la sintaxis es \argumentos -> expresión. Por ejemplo:
Haskell

-- Esta función anónima toma x y lo eleva al cuadrado.
map (\x -> x**2) [1..10] -- Devuelve [1.0, 4.0, 9.0, ..., 100.0]

Estas funciones son ideales para usarlas con funciones de orden superior como map, filter y zipWith.

Complejidad y Estilo Point-Free

La complejidad de un problema es inherente a su naturaleza. Si un problema es difícil para una máquina, lo será en cualquier lenguaje. Sin embargo, la forma en que un lenguaje maneja la evaluación puede tener un gran impacto en la eficiencia y la forma de resolver el problema.

El estilo point-free es una técnica en programación funcional donde se definen funciones sin nombrar sus argumentos. Es una de las razones por las que el código en Haskell puede ser tan conciso. En lugar de escribir una función que diga sumaTres x = 3 + x, se puede escribir sumaTres = (+3).

Listas Infinitas y Evaluación Perezosa

Una de las diferencias más importantes entre lenguajes como Haskell y Python es la forma en que manejan las listas.

    Haskell es un lenguaje de evaluación perezosa (lazy). Esto significa que solo calcula lo que necesita, cuando lo necesita. Esto permite trabajar con listas infinitas, como la lista de todos los números enteros [1..]. Por ejemplo:

Haskell

-- 'take' solo evalúa los primeros 10 elementos de la lista infinita.
take 10 [1..] -- Devuelve [1,2,3,4,5,6,7,8,9,10]

    Python por defecto utiliza la evaluación ansiosa (eager). Un intento de crear una lista infinita colapsaría el programa, ya que Python intentaría generar todos los elementos a la vez. Para lograr un comportamiento similar, se deben usar generadores.

Ejemplo de Código: Secuencia de Fibonacci

Una excelente forma de demostrar la diferencia entre ambos enfoques es con la secuencia de Fibonacci. La versión recursiva (fib n) es ineficiente porque recalcula los mismos valores una y otra vez.
Haskell

-- Versión recursiva (ineficiente)
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

La versión más eficiente en Haskell utiliza una lista infinita. Almacena los valores ya calculados, evitando la redundancia.
Haskell

-- Versión eficiente usando una lista infinita y memoización
fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fibEficiente :: Int -> Int
fibEficiente n = fibs !! n
