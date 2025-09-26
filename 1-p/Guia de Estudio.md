
## Fundamentos del Paradigma Funcional

- **Funciones Puras**: Una función es "pura" si cumple dos condiciones: **no tiene efectos secundarios** (no modifica estados externos) y para la **misma entrada, siempre produce la misma salida**.
    
- **Inmutabilidad**: La principal característica de los datos en Haskell es que **son inmutables**. Una vez que un valor ha sido definido, no puede cambiar.
    
- **Computabilidad**: Un problema se considera "computable" si **existe un algoritmo que puede resolverlo en un número finito de pasos**.
    

---

## Sintaxis y Tipos en Haskell

- **Definición de Tipos (`data`)**: Para crear un nuevo tipo de dato, se usa la palabra clave `data`. Por ejemplo, para un tipo `Color` que puede ser `Rojo`, `Verde` o `Azul`, la sintaxis es:
    
    ```haskell
    data Color = Rojo | Verde | Azul
    ```
    
- **Firmas de Tipo (`::`)**: El operador `::` se lee como **"tiene el tipo"**. En una declaración como `miNumero :: Int`, se está especificando que la expresión `miNumero` es del tipo `Int`.
    
- **Clases de Tipos (Typeclasses)**: Una clase de tipos como `Show`, `Num` o `Eq` define una **interfaz que especifica un conjunto de funciones que un tipo debe soportar**. Por ejemplo, para que un tipo pueda ser impreso, debe pertenecer a la clase `Show`; para ser comparado con `==`, debe pertenecer a `Eq`.
    
- **Nombramiento (`let` vs. `where`)**:
    
    - **`let...in`**: Es una **expresión**. Las variables definidas en el `let` solo existen (están en ámbito) dentro del bloque `in`. Por ejemplo, `let x = 5 in x * 2 + 3` evalúa a `13`.
        
    - **`where`**: Es una **cláusula** ligada a una definición de función. Sus variables son visibles en toda la función, incluyendo sus guardas. Es perfectamente válido usar una variable antes de definirla en el `where`, como en `miFuncion x = y + 1 where y = x`.
        

---

## Funciones y Composición

- **Funciones Anónimas (Lambda)**: Son funciones sin nombre, definidas directamente en el lugar donde se usan. Son perfectas para operaciones rápidas dentro de otras funciones.
    
    - Ejemplo: `(\x -> x ++ "!") "hola"` evalúa a `"hola!"`.
        
- **Composición de Funciones (`.`)**: El operador `.` encadena dos funciones. `(f . g) x` es equivalente a `f(g(x))`.
    
    - **Firma de tipo**: `(b -> c) -> (a -> b) -> (a -> c)`.
        
    - **Ejemplo**: Dadas `f x = x + 5` y `g x = x * 2`, el resultado de `(f . g) 10` es `f(g(10)) = f(20) = 25`.
        
- **`map`**: Aplica una función a cada elemento de una lista, devolviendo una nueva lista con los resultados.
    
    - Ejemplo: `map (\x -> x * x) [1, 2, 3]` evalúa a `[1, 4, 9]`.
        
- **`filter` y Aplicación Parcial**: Se puede crear una nueva función aplicando `filter` a un predicado sin darle la lista.
    
    - Ejemplo: `misterio = filter (>5)` define una nueva función `misterio` que espera una lista y devolverá solo los elementos mayores a 5.
        

---

## Recursión y Complejidad

- **Factorial**: En la definición recursiva estándar de factorial, el **caso base es `factorial 0 = 1`**. Con base en esto, `factorial 4` es `4 * 3 * 2 * 1 = 24`.
    
- **Fibonacci**: La definición recursiva ingenua (`fib n = fib (n-1) + fib (n-2)`) es muy ineficiente porque recalcula valores constantemente. Su complejidad temporal es **exponencial (O(1.6^n))**.
    
    - Usando la definición `fib 0 = 0, fib 1 = 1`, el valor de `fibonacci 5` es **5** (la secuencia es 0, 1, 1, 2, 3, **5**).
        

---

## Entrada/Salida (I/O)

- **Imprimiendo Valores**: Para concatenar un `String` con un valor de otro tipo (como un `Int`), primero se debe convertir ese valor a `String` usando la función `show`.
    
    - Ejemplo: `putStrLn ("El resultado es: " ++ show (10 * 2))` imprimirá en la consola `El resultado es: 20`.