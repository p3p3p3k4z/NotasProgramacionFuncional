## Funciones de Orden Superior: `zipWith`

Una **función de orden superior** es una función que puede tomar otras funciones como argumentos o devolverlas como resultado. `zipWith` es un ejemplo perfecto.

`zipWith` toma tres argumentos:

1. Una **función** (como un operador) que acepta dos entradas.
    
2. Una **primera lista**.
    
3. Una **segunda lista**.
    

Aplica la función a los elementos de ambas listas que se encuentran en la misma posición ("elemento a elemento") y devuelve una nueva lista con los resultados. La lista resultante tendrá la longitud de la lista más corta.

**Ejemplo:**

Haskell

```
-- Aplica el operador de suma (+) al par de elementos de cada lista
ghci> zipWith (+) [1, 2, 3] [10, 20, 30]
[11, 22, 33]

-- Aplica el operador de multiplicación (*)
ghci> zipWith (*) [1, 2, 3, 4] [10, 20, 30]
[10, 40, 90]
```

---

## Operaciones Básicas con Listas

Para manipular listas, es fundamental conocer las funciones para acceder a sus partes.

- **`head` (cabeza)**: Devuelve el **primer elemento** de una lista.
    
    ```haskell
    ghci> head [1, 2, 3]
    1
    ```
    
- **`tail` (cola)**: Devuelve **todos los elementos excepto el primero**.
    
    ```haskell
    ghci> tail [1, 2, 3]
    [2, 3]
    ```
    

**¡Cuidado!** Usar `head` o `tail` en una lista vacía (`[]`) provocará un error en tiempo de ejecución.

---

## Construcciones de Nombramiento: `where` vs. `let`

Haskell ofrece dos formas principales para crear variables locales, cada una con un propósito distinto.

#### `where` (Nombramiento Diferido)

La cláusula **`where`** se coloca _después_ de una definición de función. Permite definir variables o funciones auxiliares que se usan en la expresión principal. Se le llama "diferido" porque las definiciones aparecen al final, ayudando a que la lógica principal sea más limpia y legible.

**Ejemplo:**


```haskell
-- 'a' y 'b' se definen después de ser mencionadas en la ecuación.
areaRectangulo l w = area
  where
    area = l * w
```

#### `let...in` (Nombramiento Anticipado)

La construcción **`let...in`** es una _expresión_, lo que significa que puede ser usada en cualquier lugar donde se espere un valor. Permite definir variables _antes_ de usarlas en la expresión que sigue al `in`. Se le llama "anticipado" porque las definiciones se declaran al inicio del bloque de la expresión.

**Ejemplo:**

```haskell
-- 'a' y 'b' se definen antes de ser usadas en la expresión 'a + b'.
ghci> let a = 5; b = 10 in a + b
15
```

---

## Perfilador de GHCi

Para analizar el rendimiento de tu código (cuánto tiempo tarda y cuánta memoria consume), GHCi (el intérprete de Haskell) tiene un comando útil.

- **`:set +s`**: Al ejecutar este comando, GHCi mostrará estadísticas de rendimiento después de cada evaluación que realices. Es una herramienta sencilla pero muy útil para empezar a "perfilar" y optimizar tu código.
    

**Ejemplo de uso:**

```haskell
ghci> :set +s
ghci> sum [1..1000000]
500000500000
(0.14 secs, 133,360,408 bytes)
```