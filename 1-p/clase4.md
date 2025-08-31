### Entrada y Salida (I/O)

Las acciones que interactúan con el "mundo exterior", como leer del teclado o imprimir en la pantalla, se gestionan en Haskell a través de la **monada de acciones `IO`**. Esto significa que las funciones no son puras y sus efectos se encadenan en una secuencia. La siguiente sesión en `ghci` ilustra perfectamente esta idea.

```haskell
-- Contenido probable del archivo entradaysalida.hs
main :: IO ()
main = do
    putStrLn "Que onda?"
    putStrLn "Hola como te llamas"
    nombre <- getLine
    putStrLn ("Bienvenido al tequio de manana a la orilla de la carretera por si pasas por ahi (tambien el domingo), " ++ nombre)
```

En este código:

  * **`do`**: Agrupa una secuencia de acciones de `IO`.
  * **`putStrLn`**: Imprime una línea en la consola.
  * **`getLine`**: Lee una línea de la entrada del usuario. El operador `<-` se usa para extraer el valor (el texto ingresado) de la acción de `IO` y asignarlo a una variable.

-----

### Literate Haskell y Documentación

Porque debemos explicar o comentar lo mas que podamos nuestros programas, Donald Knuyh (inventor de Tex, libro: The art of programing).

La importancia de documentar el código resalta la necesidad de escribir programas que sean fáciles de entender. El formato **Literate Haskell (.lhd)** nos permite combinar código y comentarios en un solo archivo de manera legible. Las líneas que comienzan con `>` son código, y el resto es texto explicativo.

-----

### Funciones comunes de listas

Las siguientes son funciones básicas para manipular listas, como se observa en una sesión de `ghci`:

  * **`head`**: Devuelve el primer elemento de una lista.
    ```haskell
    head "hola"
    -- Resultado: 'h'
    ```
  * **`tail`**: Devuelve el resto de la lista (todo excepto el primer elemento).
    ```haskell
    tail "hola"
    -- Resultado: "ola"
    ```
  * **`reverse`**: Invierte el orden de los elementos en una lista.
    ```haskell
    reverse (tail (tail ("Robert de Niro")))
    -- Resultado: "orineD treboR"
    ```

-----

### Pattern Matching y Desestructuración de Listas

El **pattern matching** nos permite "desestructurar" una lista para extraer sus elementos en variables. Esta técnica hace que el código sea más claro y conciso.

```haskell
-- La expresion:
let (a:b:cs) = [1,2,3,4,5] in (a,b,cs)

-- Descompone la lista de esta manera:
-- 'a' toma el valor 1
-- 'b' toma el valor 2
-- 'cs' toma el valor [3,4,5]
```

El resultado de esta expresión es la tupla `(1, 2, [3, 4, 5])`.