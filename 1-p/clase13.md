### Funciones de Orden Superior en Haskell 🧠

Las **funciones de orden superior** son el núcleo de la programación funcional. Son funciones que toman otras funciones como argumentos o las devuelven como resultado. Nos permiten escribir código increíblemente declarativo y reutilizable. Esta guía explora las más comunes: `map`, `filter`, `fold` y `scan`.

---

## `map`: Transformación de Listas

La función `map` aplica una función a **cada elemento** de una lista, devolviendo una nueva lista de la misma longitud con los resultados de esa aplicación.

**Propósito**: Transformar una colección de datos.

**Ejemplos de tu apunte**:

- Aplicar una función predefinida a cada elemento:
    
    Haskell
    
    ```
    -- ejm1 = map (odd)[1,2,3,4,5]
    -- Resultado: [True, False, True, False, True]
    ```
    
- Aplicar una función anónima (lambda) para una operación específica:
    
    Haskell
    
    ```
    -- ejm2 = map (\x->x+1)[1..20]
    -- Resultado: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    ```
    
- `map` se puede componer para realizar transformaciones complejas en listas anidadas. Este ejemplo primero eleva al cuadrado cada número en las sublistas y luego suma los resultados de cada sublista:
    
    Haskell
    
    ```
    -- ejm5 = map sum (map (\x->map(\y->y*y)x)[[1,2,3],[1,2],[3,4,5,6]])
    -- Resultado: [14, 5, 86]
    ```
    

---

## `filter`: Selección de Elementos

La función `filter` toma una función **predicado** (que devuelve `True` o `False`) y una lista. Devuelve una nueva lista que contiene solo los elementos que cumplen con el predicado.

**Propósito**: Seleccionar un subconjunto de datos.

**Ejemplos de tu apunte**:

- Filtrar usando una función predefinida como `odd` (impar):
    
    Haskell
    
    ```
    -- ej1 = filter (odd)[1,2,3,4,5]
    -- Resultado: [1,3,5]
    ```
    
- Filtrar usando una lambda con una condición más compleja (impar Y mayor que 10):
    
    Haskell
    
    ```
    -- ej3 = filter (\x-> ((odd x)&&(x>10)))[1..20]
    -- Resultado: [11,13,15,17,19]
    ```
    

---

## `foldr` y `foldl`: Agregación de Listas

Las funciones `fold` (plegado) son usadas para "reducir" o "colapsar" una lista entera en un **único valor**. Requieren una función combinadora, un valor inicial (semilla) y la lista.

**Propósito**: Resumir o agregar datos.

La diferencia clave entre `foldr` y `foldl` es la **asociatividad**:

- **`foldr` (derecha)**: Empieza a combinar los elementos desde el final de la lista. La operación se asocia a la derecha: `1 * (2 * (3 * 1))`.
    
- **`foldl` (izquierda)**: Empieza a combinar los elementos desde el inicio de la lista. La operación se asocia a la izquierda: `(((1 * 1) * 2) * 3)`.
    

**Ejemplos de tu apunte**:

- Calcular el factorial de 10 (producto de una lista):
    
    Haskell
    
    ```
    -- ejf1 = foldr(*)1[1..10]
    -- Resultado: 3628800
    ```
    
- Aplanar una lista de listas (concatenar):
    
    Haskell
    
    ```
    -- ejf3 = foldr(++)[][[1,2],[3,4],[4,2,1]]
    -- Resultado: [1,2,3,4,4,2,1]
    ```
    

---

## `scanr` y `scanl`: Agregación Progresiva

Las funciones `scan` son muy similares a `fold`, pero en lugar de devolver solo el resultado final, devuelven una **lista de todos los resultados intermedios** del acumulador. Son útiles para ver la progresión de un cálculo.

**Propósito**: Monitorear el estado de una agregación paso a paso.

**Ejemplos de tu apunte**:

- `scanr` para ver los pasos del factorial (se calcula de derecha a izquierda):
    
    Haskell
    
    ```
    -- ejs1 = scanr (*) 1[1..5]
    -- Resultado: [120,120,60,20,5,1]
    ```
    
- `scanl` para ver los pasos de una suma acumulada (se calcula de izquierda a derecha):
    
    Haskell
    
    ```
    -- ejl2 = scanl (+) 0[1..5]
    -- Resultado: [0,1,3,6,10,15]
    ```