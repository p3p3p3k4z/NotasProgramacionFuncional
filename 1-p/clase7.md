### Tipos de Datos Algebraicos y Semántica

En esta sesión, profundizamos en una de las características más poderosas de Haskell: la capacidad de definir nuestros propios **tipos de datos algebraicos**. Esto nos permite modelar problemas complejos de una forma increíblemente expresiva, básicamente creando un "mini-lenguaje" específico para nuestro problema.

### 1. Creando un Lenguaje para Expresiones Aritméticas

Imagina que quieres representar una expresión como `2 + (3 * 4)`. En lugar de calcularla directamente, podemos definir una estructura de datos que represente la _forma_ de la expresión.

Para esto, creamos un tipo de dato recursivo llamado `E` (de Expresión):


```haskell
-- Un valor de tipo E puede ser:
-- 1. Un entero, envuelto en el constructor 'I' (Integer)
-- 2. Una Multiplicación de dos sub-expresiones E, usando el constructor 'M'
-- 3. Una Suma (Plus) de dos sub-expresiones E, usando el constructor 'P'
data E = I Int | M E E | P E E deriving Show
```

Con este "lenguaje", la expresión `2 + (3 * 4)` se representa como un árbol de datos:

Haskell

```
ejemplo :: E
ejemplo = P (I 2) (M (I 3) (I 4))
```

---

### 2. Dando Significado: La Función `eval`

Una vez que tenemos la estructura, podemos darle **semántica** (significado). Escribimos una función `eval` que "interpreta" nuestro lenguaje, recorriendo el árbol y calculando el resultado numérico.

```haskell
-- eval toma una Expresión 'E' y devuelve un 'Int'
eval :: E -> Int
eval (I n) = n
eval (M n m) = (eval n) * (eval m)
eval (P n m) = (eval n) + (eval m)
```

La función `eval` usa pattern matching para cada posible constructor de `E`. Si encuentra un `I`, devuelve el número. Si encuentra una `M` o `P`, se llama a sí misma **recursivamente** sobre las sub-expresiones y luego combina los resultados.

---

### 3. Factorial como una Estructura de Datos

Aquí es donde la idea se vuelve muy interesante. En lugar de una función factorial que _calcula_ un número, podemos crear una función que _construye la expresión_ que representa el cálculo del factorial.

La función `factS` (factorial simbólico) toma un número y devuelve una estructura `E` anidada de multiplicaciones:

```haskell
factS :: Int -> E
factS 0 = I 1
factS n | n > 0 = M (I n) (factS (n - 1))
```

Al ejecutarlo, no vemos un número, sino la propia estructura:

```
ghci> factS 4
M (I 4) (M (I 3) (M (I 2) (M (I 1) (I 1)))))
```

Para obtener el resultado final, simplemente le pasamos esta estructura a nuestra función `eval`:

```
ghci> eval (factS 10)
3628800
```

Este es un concepto fundamental: **la separación de la representación de un problema de su evaluación**.

---

### 4. Transformando la Estructura: La Función `aLista`

Además de evaluar, podemos **transformar** nuestra estructura `E` en otros tipos de datos, como una lista de números. La función `aLista` recorre el árbol y recolecta todos los enteros que encuentra.

```haskell
-- aLista toma una Expresión 'E' y devuelve una lista de 'Int'
aLista :: E -> [Int]
aLista (I n)     = [n]
aLista (M n m)   = (aLista n) ++ (aLista m)
aLista (P n m)   = (aLista n) ++ (aLista m) -- Caso para la suma
```

Podemos usar esta transformación para calcular el factorial de una manera alternativa:

```haskell
-- 1. Creamos la expresión
ghci> let expr = factS 10

-- 2. La transformamos en una lista de números
ghci> let listaNums = aLista expr
-- Resultado: [10,9,8,7,6,5,4,3,2,1,1]

-- 3. Usamos una función de listas estándar ('product') para calcular el resultado
ghci> product listaNums
3628800
```
