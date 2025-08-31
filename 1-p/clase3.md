### Listas en Haskell

Una **lista** es una estructura de datos que contiene una secuencia de elementos del mismo tipo. Es uno de los tipos de datos más comunes y útiles en la programación funcional. En Haskell, las listas se definen con corchetes `[]` y sus elementos se separan con comas.

```haskell
-- Una lista de números enteros
[1, 2, 3, 4]

-- Una lista de caracteres (que es lo mismo que una cadena de texto)
['h', 'o', 'l', 'a']

-- Una lista de listas de números enteros
[[1, 2], [3, 4]]
```

Una de las características más poderosas de las listas en Haskell es que se pueden manipular usando **composición de funciones**, lo que te permite combinar funciones de una manera fluida para transformar los datos.

-----

### Funciones de orden superior: `map`

`map` es un ejemplo clave de una **función de orden superior**. Una función de orden superior es aquella que toma una o más funciones como argumentos, o que devuelve una función como resultado. `map` toma una función y una lista, y aplica esa función a cada elemento de la lista, devolviendo una nueva lista con los resultados.

Tus notas sobre `map reverse` muestran un ejemplo perfecto de esto.

```haskell
-- `reverse` invierte una lista.
-- `map reverse` aplica `reverse` a cada cadena de la lista.
-- Cada cadena se trata como una lista de caracteres.
map reverse ["hola", "quiero", "salir", "de", "clase"]

-- Resultado: ["aloh", "oreiuq", "rilas", "ed", "esalc"]
```

#### Inspeccionando el tipo de `map`

El comando `:i` en el intérprete de Haskell (`ghci`) te da información sobre una función, incluyendo su tipo. La información que anotaste, `map :: (a -> b) -> [a] -> [b]`, es la **firma de tipo** de la función `map`.

Vamos a desglosar esta firma:

  * `(a -> b)`: El primer argumento de `map` es una **función** que toma un valor de tipo `a` y devuelve un valor de tipo `b`. Los tipos `a` y `b` son variables de tipo, lo que significa que pueden ser cualquier tipo (por ejemplo, `Int`, `Char`, `String`, etc.).
  * `[a]`: El segundo argumento es una **lista** de valores de tipo `a`.
  * `-> [b]`: El resultado es una **nueva lista** de valores de tipo `b`.

-----

### Funciones anónimas (lambdas)

Las **funciones anónimas** son funciones que no tienen nombre. Se definen y se usan "al vuelo" cuando las necesitas, a menudo como argumentos para funciones de orden superior como `map` o `filter`. Como bien anotaste, se usan y se desechan. La sintaxis para una función anónima es una barra invertida `\` seguida de los argumentos, una flecha `->` y luego la expresión.

```haskell
-- Funcion normal: duplica un numero
duplicar x = x * 2

-- Funcion anonima equivalente:
\x -> x * 2

-- Usando la funcion anonima con 'map' para duplicar cada numero en una lista.
map (\x -> x * 2) [1, 2, 3, 4]

-- Resultado: [2, 4, 6, 8]
```
