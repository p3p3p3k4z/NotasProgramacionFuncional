¡Absolutamente\! Este es un paso excelente para prepararte.

Aquí tienes la solución a cada pregunta de tu guía, incluyendo el **código**, una **explicación de la lógica** (el *por qué* funciona) y una **explicación de la sintaxis** (el *qué* significa el código).

-----

## [cite\_start]1. Generar todas las permutaciones [cite: 3]

### Código

(Usando la lógica de tu archivo `perms.hs`)

```haskell
import Data.List (delete)

permutations :: Eq a => [a] -> [[a]]
permutations [] = [[]]
permutations xs = [x : p | x <- xs, p <- permutations (delete x xs)]
```

### Lógica (El "Por qué")

El algoritmo es recursivo y se basa en "elegir y permutar el resto":

1.  **Caso Base**: La única permutación de una lista vacía `[]` es `[[]]` (una lista que contiene la lista vacía).
2.  **Caso Recursivo**: Para permutar `[1,2,3]`:
      * **Elige el `1`**: ¿Cuáles son las permutaciones del resto (`[2,3]`)? Son `[2,3]` y `[3,2]`. Añade el `1` al frente: `[1,2,3]` y `[1,3,2]`.
      * **Elige el `2`**: ¿Cuáles son las permutaciones del resto (`[1,3]`)? Son `[1,3]` y `[3,1]`. Añade el `2` al frente: `[2,1,3]` y `[2,3,1]`.
      * **Elige el `3`**: ¿Cuáles son las permutaciones del resto (`[1,2]`)? Son `[1,2]` y `[2,1]`. Añade el `3` al frente: `[3,1,2]` y `[3,2,1]`.
      * Junta todas estas listas.

### Sintaxis (El "Qué")

  * `permutations [] = [[]]`: Es el caso base.
  * `[x : p | ... ]`: Es una **lista por comprensión** (list comprehension). Significa: "Voy a construir una nueva lista...".
  * `x : p`: "...donde cada elemento se forma tomando `x` y poniéndolo al frente (`:`) de una lista `p`."
  * `x <- xs`: "...`x` se saca de la lista de entrada `xs` (ej. `1`, luego `2`, luego `3`)..."
  * `p <- permutations (delete x xs)`: "...y `p` se saca del resultado de llamar recursivamente a `permutations` sobre la lista *sin* el elemento `x` que ya elegimos."

### Ejecución de Ejemplo

```
ghci> permutations [1,2,3]
[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

-----

## [cite\_start]2 y 3. Combinaciones / Conjunto Potencia [cite: 4, 5]

Ambas preguntas se resuelven con la misma función `subsets` (subconjuntos), que genera el "conjunto potencia".

### Código

(Usando la lógica de tu archivo `perms.hs`)

```haskell
subsets :: [a] -> [[a]]
subsets [] = [[]]
subsets (x:xs) = ls ++ (map (x:) ls)
               where
                 ls = subsets xs
```

### Lógica (El "Por qué")

El algoritmo es recursivo y muy elegante:

1.  **Caso Base**: El único subconjunto de `[]` es `[[]]`.
2.  **Caso Recursivo**: Para encontrar los subconjuntos de `[1,2,3]`:
      * Primero, encuentra recursivamente los subconjuntos del "resto" (`[2,3]`). El resultado es `[[], [3], [2], [2,3]]`. Llamemos a esto `ls`.
      * Los subconjuntos finales son:
        1.  La lista `ls` tal cual (estos son todos los subconjuntos que *no* contienen al `1`).
        2.  La lista `ls` pero con el `1` añadido al frente de cada elemento (estos son todos los subconjuntos que *sí* contienen al `1`).
      * Junta esas dos listas.

### Sintaxis (El "Qué")

  * `subsets (x:xs)`: Separa la lista en su cabeza `x` (ej. `1`) y su cola `xs` (ej. `[2,3]`).
  * `where ls = subsets xs`: Llama recursivamente a `subsets` sobre la cola `xs` y guarda el resultado en la variable `ls`.
  * `(map (x:) ls)`: `map` aplica una función a cada elemento de una lista. La función es `(x:)`, que significa "añadir `x` al frente de la lista". Esto crea la segunda mitad de nuestros resultados.
  * `ls ++ ...`: `++` es el operador para concatenar (pegar) las dos listas.

### Ejecución de Ejemplo

```
ghci> subsets [1,2,3]
[[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
```

-----

## [cite\_start]4. Algoritmo de Fusión (Mergesort) de 3 Vías [cite: 6, 7]

El Mergesort normal divide en 2. Esta pregunta pide dividir en 3.

### Código

(Inspirado en tu `mergeSort` de `sorting.hs`)

```haskell
-- La función 'merge' de tu archivo. La necesitamos para combinar.
merge :: Ord a => [a] -> [a] -> [a]
merge [] ls = ls
merge ls [] = ls
merge (a:bs) (b:cs) =
      if a <= b then a : merge bs (b:cs) else b : merge (a:bs) cs

-- La nueva función de 3 vías
mergeSort3 :: Ord a => [a] -> [a]
-- Casos base: 0 o 1 elemento ya están ordenados
mergeSort3 [] = []
mergeSort3 [a] = [a]
-- Caso recursivo
mergeSort3 ls = res
    where
        -- 1. Dividir
        l = length ls
        k = (l + 2) `div` 3  -- Tamaño del primer tercio (redondeo hacia arriba)
        
        parte1 = take k ls
        resto1 = drop k ls
        
        l_resto = length resto1
        k_resto = l_resto `div` 2 -- Dividir el resto en 2
        
        parte2 = take k_resto resto1
        parte3 = drop k_resto resto1

        -- 2. Vencer (ordenar cada parte)
        ordenada1 = mergeSort3 parte1
        ordenada2 = mergeSort3 parte2
        ordenada3 = mergeSort3 parte3

        -- 3. Combinar (fusionamos 2, y luego fusionamos el resultado con la 3ra)
        res = merge ordenada1 (merge ordenada2 ordenada3)
```

### Lógica (El "Por qué")

Sigue el principio de "Dividir y Vencer":

1.  **Dividir**: Partimos la lista en tres partes `parte1`, `parte2` y `parte3` de tamaño lo más similar posible.
2.  **Vencer**: Llamamos a `mergeSort3` recursivamente sobre cada una de esas tres partes.
3.  **Combinar**: Ahora tenemos 3 listas ordenadas. Usamos `merge` para fusionar `ordenada2` y `ordenada3`, y luego `merge` de nuevo para fusionar `ordenada1` con el resultado anterior.

### Sintaxis (El "Qué")

  * `where`: Un bloque para definir variables locales y hacer el código más limpio.
  * `l = length ls`: Calcula la longitud total.
  * ` k = (l + 2)  `div`  3 `: Un truco para calcular el tamaño de un tercio, asegurando que funcione para longitudes como 4 (da 2), 5 (da 2) y 3 (da 1).
  * `take k ls`: Toma los primeros `k` elementos.
  * `drop k ls`: Devuelve la lista sin los primeros `k` elementos.
  * `res = merge ... (merge ...)`: Anidamos las llamadas a `merge` para combinar las 3 listas.

### Ejecución de Ejemplo

```
ghci> mergeSort3 [9, 2, 7, 5, 1, 10, 3, 8, 6, 4]
[1,2,3,4,5,6,7,8,9,10]
```

-----

## [cite\_start]5. Optimizar $3^n$ (Tiempo Logarítmico) [cite: 8]

Usamos "exponenciación por cuadratura" para evitar un cálculo lineal.

### Código

```haskell
fastPower :: Integer -> Integer -> Integer
fastPower _ 0 = 1 -- Caso base: x^0 = 1
fastPower x n =
    if (n `mod` 2) == 0 -- n es par
    then let p = fastPower x (n `div` 2) in p * p
    else x * fastPower x (n - 1) -- n es impar
```

### Lógica (El "Por qué")

1.  **Caso Base**: $x^0$ siempre es 1.
2.  **Caso Par**: Si `n` es par (ej. $3^{10}$), en lugar de hacer 10 multiplicaciones, nos damos cuenta que $3^{10} = 3^5 \times 3^5$. Solo necesitamos calcular $3^5$ una vez y multiplicarlo por sí mismo.
3.  **Caso Impar**: Si `n` es impar (ej. $3^9$), simplemente lo convertimos en un caso par: $3^9 = 3 \times 3^8$.

Este enfoque reduce el número de pasos de `n` (lineal) a `log(n)` (logarítmico), lo cual es muchísimo más rápido.

### Sintaxis (El "Qué")

  * `_ 0 = 1`: El `_` (guion bajo) es un comodín. Significa "no me importa cuál es la base, si el exponente es 0, el resultado es 1".
  * ` if (n  `mod`  2) == 0 `: `mod` es la función de módulo (residuo de la división). Si el residuo de `n / 2` es 0, `n` es par.
  * `let p = ... in p * p`: Usamos `let` para almacenar el resultado de la llamada recursiva ` fastPower x (n  `div`  2) ` en la variable `p`. Esto es **crucial** para la optimización, asegura que solo se calcula *una vez*.

### Ejecución de Ejemplo

```
ghci> fastPower 3 10
59049
```

-----

## [cite\_start]7. Producto Cartesiano (Listas Compactas) [cite: 10]

### Código

```haskell
producto :: [(Integer, Char)]
producto = [(x, y) | x <- [1, 2, 3, 4], y <- "abcd"]
```

### Lógica (El "Por qué")

Queremos una lista de todos los pares `(x, y)` posibles donde `x` es de la primera lista y `y` es de la segunda. Las listas por comprensión están diseñadas exactamente para esto. Es como dos bucles `for` anidados.

### Sintaxis (El "Qué")

  * `[(x, y) | ... ]`: "Construye una lista de tuplas `(x, y)`..."
  * `x <- [1, 2, 3, 4]`: "...donde `x` tomará cada valor de la primera lista..."
  * `y <- "abcd"`: "...y para CADA valor de `x`, `y` tomará cada valor de la segunda lista (`"abcd"` es lo mismo que `['a','b','c','d']`)."

### Ejecución de Ejemplo

```
ghci> producto
[(1,'a'),(1,'b'),(1,'c'),(1,'d'),(2,'a'),(2,'b'),(2,'c'),(2,'d'),
 (3,'a'),(3,'b'),(3,'c'),(3,'d'),(4,'a'),(4,'b'),(4,'c'),(4,'d')]
```

-----

## [cite\_start]8. Leer Números de un Archivo [cite: 11]

(Esta es la versión **corregida** que SÍ incluye un `main` para poder ejecutarse).

### Código

```haskell
import System.IO

-- Función que hace el trabajo de leer
leerDatos :: IO [Integer]
leerDatos = do
    contenido <- readFile "dato.txt"
    let lineas = lines contenido
    -- Convertimos cada linea (String) a Integer
    let numeros = map read lineas :: [Integer]
    return numeros

-- Función 'main' para ejecutar el programa
main :: IO ()
main = do
    putStrLn "Leyendo el archivo 'dato.txt'..."
    numerosLeidos <- leerDatos
    putStrLn "Los números leídos son:"
    print numerosLeidos
```

### Lógica (El "Por qué")

Haskell separa el código "puro" (como sumar números) del código "impuro" (como leer archivos, que es impredecible).

1.  `main` es el punto de entrada "impuro". Usamos un bloque `do` para listar las acciones a ejecutar.
2.  Llamamos a nuestra función `leerDatos` para que haga el trabajo sucio.
3.  `leerDatos` lee el archivo, obtiene un `String` gigante, lo parte en una lista de `String`s (uno por línea) con `lines`, y luego usa `map read` para convertir cada `String` en un `Integer`.
4.  `main` recibe esta lista de números y la imprime en pantalla.

### Sintaxis (El "Qué")

  * `main :: IO ()`: `main` es una **acción de I/O** (`IO`) que no devuelve ningún valor (`()`, llamado "unit").
  * `do`: Inicia un bloque de acciones de I/O secuenciales.
  * `contenido <- readFile "dato.txt"`: `readFile` es una acción de I/O. El operador `<-` **extrae** el valor de la acción (el contenido del archivo) y lo guarda en la variable `contenido`.
  * `let lineas = lines contenido`: `let` se usa *dentro* de un bloque `do` para código puro. `lines` es una función pura que parte un `String`.
  * `let numeros = map read lineas :: [Integer]`: `map` aplica `read` a cada línea. `:: [Integer]` es una anotación de tipo **obligatoria** para que `read` sepa a qué tipo convertir el `String`.
  * `return numeros`: `return` envuelve un valor puro (`numeros`) de nuevo en el contexto `IO` para que la función `leerDatos` pueda devolverlo.
  * `print numerosLeidos`: `print` es una acción de I/O que imprime un valor de cualquier tipo que se pueda "mostrar" (que sea de la clase `Show`).

### Ejecución de Ejemplo

*Primero, crea un archivo `dato.txt` con este contenido:*

```
150
25
-10
```

*Luego, ejecuta `main` en GHCi:*

```
ghci> main
Leyendo el archivo 'dato.txt'...
Los números leídos son:
[150,25,-10]
```

-----

## [cite\_start]9. Suma 15 (Listas Compactas) [cite: 12, 13]

### Código

```haskell
suman15 :: [(Integer, Integer, Integer)]
suman15 = [(x, y, z) | x <- [1..10], y <- [1..10], z <- [1..10], x + y + z == 15]
```

### Lógica (El "Por qué")

Queremos encontrar todas las tripletas `(x, y, z)` donde cada número está entre 1 y 10, y su suma es 15. La forma más simple es:

1.  Generar *todas* las tripletas posibles (10 \* 10 \* 10 = 1000 combinaciones).
2.  Filtrar esa lista gigante y quedarnos solo con las que suman 15.
    Las listas por comprensión hacen estos dos pasos en uno solo.

### Sintaxis (El "Qué")

  * `[(x, y, z) | ... ]`: "Construye una lista de tuplas `(x, y, z)`..."
  * `x <- [1..10], y <- [1..10], z <- [1..10]`: Los tres generadores (como 3 bucles `for` anidados).
  * `, x + y + z == 15`: Esta última parte es un **guardián** (o filtro). Solo las tuplas que hagan que esta condición sea `True` se incluirán en la lista final.

### Ejecución de Ejemplo

```
ghci> take 5 suman15  -- (Mostramos solo los primeros 5)
[(1,4,10),(1,5,9),(1,6,8),(1,7,7),(1,8,6)]
```

-----

## [cite\_start]10. `foldr` con Función Específica [cite: 14]

(Esta es la versión **corregida** con el cálculo correcto).

### Código

```haskell
-- La función f(x, y) = x*y + y
f :: Integer -> Integer -> Integer
f x y = x * y + y

-- Aplicamos foldr a la lista [1..10] con la semilla 1
resultadoFold :: Integer
resultadoFold = foldr f 1 [1..10]
```

### Lógica (El "Por qué")

`foldr` ("plegado por la derecha") aplica una función desde el final de la lista hacia el principio.
`foldr f semilla [x1, x2, x3]` es lo mismo que `f(x1, f(x2, f(x3, semilla)))`.

  * **Función:** $f(x, y) = x*y + y = y*(x+1)$
  * **Lista:** $[1, 2, ..., 10]$
  * **Semilla:** $1$

El cálculo se ve así: `f(1, f(2, ... f(10, 1) ... ))`

1.  `f 10 1` = $1 * (10 + 1) = 11$
2.  `f 9 11` (el resultado anterior es la nueva `y`) = $11 * (9 + 1) = 110$
3.  `f 8 110` = $110 * (8 + 1) = 990$
    ...y así sucesivamente.

### Sintaxis (El "Qué")

  * `f x y = x * y + y`: Definición de la función.
  * `foldr f 1 [1..10]`: Llama a `foldr` con 3 argumentos:
    1.  La función a aplicar: `f`
    2.  El valor inicial (semilla): `1`
    3.  La lista sobre la que se operará: `[1..10]`

### Ejecución de Ejemplo

```
ghci> resultadoFold
39916800
```

-----

## [cite\_start]11. Algoritmos de Ordenamiento [cite: 15]

Usaremos `quickSort` de tu archivo `sorting.hs`, ya que es un gran ejemplo de "dividir y vencer" usando listas compactas.

### Código

```haskell
quickSort :: Ord a => [a] -> [a]
quickSort [] = [] -- Caso base
quickSort (a:bs) = (quickSort menores) ++ [a] ++ (quickSort mayores)
    where
        menores = [b | b <- bs, b < a]
        mayores = [b | b <- bs, b >= a]
```

### Lógica (El "Por qué")

1.  **Caso Base**: Una lista vacía `[]` ya está ordenada.
2.  **Dividir**: Toma el primer elemento `a` (el "pivote").
3.  **Vencer**:
      * Crea una lista `menores` con todos los elementos de `bs` (el resto) que son menores que `a`.
      * Crea una lista `mayores` con todos los elementos de `bs` que son mayores o iguales que `a`.
      * Llama recursivamente a `quickSort` sobre estas dos nuevas listas.
4.  **Combinar**: Pega la lista de menores ordenada, luego el pivote `a`, y luego la lista de mayores ordenada.

### Sintaxis (El "Qué")

  * `quickSort (a:bs)`: Separa la lista en su cabeza `a` (pivote) y su cola `bs`.
  * `where`: Define las variables locales `menores` y `mayores`.
  * `[b | b <- bs, b < a]`: Lista por comprensión. "Crea una lista de `b`... donde `b` viene de `bs`... y `b < a`."
  * `++`: Operador de concatenación de listas.

### Ejecución de Ejemplo

```
ghci> quickSort [6, 1, 5, 2, 9, 4, 3]
[1,2,3,4,5,6,9]
```
