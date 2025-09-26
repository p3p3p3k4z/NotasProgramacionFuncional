En esta clase exploramos técnicas más avanzadas para definir funciones y crear listas de manera concisa y expresiva, pilares de la programación funcional en Haskell.

### 1. Pattern Matching y Guardas en Funciones

Una de las características más potentes de Haskell es el **Pattern Matching** (coincidencia de patrones), que nos permite definir diferentes cuerpos de una función dependiendo de la forma de sus argumentos.

En tu código, definiste la función factorial usando esta técnica, complementada con **guardas**.

**Código de la clase (`fact.hs`)**

```haskell
-- Versión 1: Usando un patrón para el caso base (0)
fact 0 = 1
-- Usando una 'guarda' para la condición recursiva (n > 0)
fact n | n > 0 = n * fact (n - 1)
```

**Análisis del código:**

- **`fact 0 = 1`**: Este es el **caso base**. Haskell comprueba si el argumento es `0` y, si coincide, devuelve `1` inmediatamente. Esto es pattern matching en su forma más simple.
    
- **`fact n | n > 0 = ...`**: Esta línea utiliza una **guarda** (el pipe `|`). Si el patrón anterior no coincide, Haskell evalúa la condición `n > 0`.
    
    - Si es verdadera, ejecuta la expresión recursiva `n * fact (n - 1)`.
        
    - Las guardas son ideales para añadir condiciones lógicas a tus patrones.
        

---

### 2. Tuplas y Asignación Simultánea

Una **tupla** es una estructura de datos que agrupa un número fijo de elementos de diferentes tipos. Son muy útiles para devolver múltiples valores desde una función.

El pattern matching también funciona con tuplas, lo que permite una "asignación simultánea" de una manera muy limpia.


```haskell
-- Se crea una tupla (2,3) y se desestructura "simultáneamente"
-- 'a' toma el valor 2 y 'b' toma el valor 3
let (a, b) = (2, 3) in a + b

-- Resultado: 5
```

Esta construcción `let (a, b) = ...` es mucho más declarativa que asignar cada variable por separado en otros lenguajes.

---

### 3. Listas por Comprensión: Creando Listas de Forma Declarativa

Las **listas por comprensión** (list comprehensions) son una sintaxis inspirada en la notación matemática de conjuntos que permite construir listas de forma muy descriptiva. Indicas _qué_ quieres en la lista, no _cómo_ construirla paso a paso.

La estructura general es `[expresión | generador1, generador2, ..., filtro1, ...]`.

**Ejemplo de la clase:**

```haskell
-- Crea una lista de tuplas (pares ordenados)
ghci> let ls = [(x, y) | x <- [1, 2, 3], y <- [2, 3]]

-- Resultado:
-- ls = [(1,2), (1,3), (2,2), (2,3), (3,2), (3,3)]
```

**Análisis del ejemplo:**

1. **`[(x, y) | ... ]`**: La expresión a la izquierda del `|` indica que cada elemento de la nueva lista será una tupla `(x, y)`.
    
2. **`x <- [1, 2, 3]`**: Este es el primer **generador**. La variable `x` tomará cada uno de los valores de la lista `[1, 2, 3]`.
    
3. **`y <- [2, 3]`**: Este es el segundo **generador**. Por _cada_ valor de `x`, la variable `y` tomará cada uno de los valores de la lista `[2, 3]`.
    

El resultado es el producto cartesiano de las dos listas, formando todas las combinaciones posibles de `(x, y)`.