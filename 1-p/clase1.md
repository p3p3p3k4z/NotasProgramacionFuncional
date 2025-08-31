### ¿Qué es la Programación Funcional?

La **programación funcional** es un paradigma de programación, es decir, un estilo de construir la estructura y los elementos de los programas de computadora. Este paradigma se enfoca en el uso de **funciones puras** y **expresiones** en lugar de comandos o declaraciones que cambian el estado del programa.

Imagina las funciones como en las matemáticas: tomas una entrada y obtienes un resultado, sin que nada más cambie. De la misma manera, las funciones en la programación funcional no tienen "efectos secundarios" (side effects), lo que significa que no modifican variables externas ni el estado global del programa. Esto hace que el código sea más predecible, fácil de depurar y de probar, ya que el resultado de una función depende únicamente de sus argumentos de entrada.

-----

### Haskell: Conceptos clave de programación funcional

Haskell es un lenguaje de programación funcional puro. Esto significa que está diseñado para trabajar con funciones y expresiones, evitando los efectos secundarios (cambios de estado que no dependen del resultado de la función). 

  * **Funciones**: En Haskell, las funciones son el componente principal. Toman una o más entradas y devuelven un resultado.
  * **Dominio y codominio**: Esto se refiere al tipo de datos que una función recibe (**dominio**) y el tipo de datos que devuelve (**codominio**). Es una característica clave de los lenguajes de programación con **tipado fuerte y estático**, como Haskell.
  * **Inmutabilidad**: Esta es una de las características más importantes. Una vez que se crea un valor, no se puede cambiar "no hay asignación destructiva". Esto significa que no puedes reasignar una variable a un nuevo valor. Si necesitas un valor diferente, creas una nueva variable. Esta propiedad ayuda a prevenir errores y hace que el código sea más predecible.
  * **Evaluación perezosa (Lazy evaluation)**: Haskell no evalúa una expresión hasta que su valor es realmente necesario. Esto permite trabajar con estructuras de datos infinitas y optimizar el rendimiento.
  * **Ecléctico**: Esto se refiere a que el lenguaje toma ideas de diferentes paradigmas, aunque su enfoque principal es el funcional.

"Se tiene que dejar las botas de C"

-----

### Sintaxis y ejemplos de operaciones en Haskell y Scheme

#### Scheme

Scheme usa la **notación prefija**, donde el operador (`+`, `*`) se coloca antes de los operandos. Es una característica común en los lenguajes de la familia Lisp.

```scheme
;; Suma 1 + 1
(+ 1 1)

;; Multiplica 2 * 3 * 5
(* 2 3 5)
```

#### Haskell

Haskell usa una sintaxis similar a las matemáticas que estamos acostumbrados a usar.

```haskell
-- Suma 1 + 1
1 + 1

-- Multiplica 2 * 4 * 2
2 * 4 * 2

-- Imprime una cadena de texto en la consola
putStr "Hola Mundo"

-- putStr acepta solo una cadena, así que se usa '++' para concatenar las dos cadenas
putStr ("hola" ++ "mundo")
```

-----

### `let in`

El `let in` es una construcción que permite **crear una variable temporal** para usarla dentro de una expresión. Es una pregunta común de examen porque es fundamental para entender la inmutabilidad de Haskell. Construccion de nombramiento anticipado

```haskell
-- Define 'x' con el valor 2 y luego usa 'x' en la expresion 'x + x'
let x = 2 in x + x
-- Resultado: 4

-- Define 'x' como 4 y 'y' como 10 y luego usa ambas en la expresion 'x + y'
let x = 4; y = 10 in x + y
-- Resultado: 14
```

-----

### Definición de funciones

Estas notas son muy importantes, ya que muestran dos formas de definir la función factorial en Haskell.

1.  **Definición con `foldr`**: `foldr` es una función de orden superior. La función `foldr (*) 1 [1..n]` significa "aplica el operador de multiplicación `(*)` a la lista de números `[1..n]`, empezando por la derecha, y usa `1` como valor inicial". Es una forma muy concisa y **funcional** de resolver el problema.

    ```haskell
    -- Calcula el factorial de un número 'n' usando foldr
    factorial n = foldr (*) 1 [1..n]
    ```

2.  **Definición con `if`**: Esta es una definición **recursiva**. La función se llama a sí misma hasta que `n` sea igual a `0`. Es una forma más imperativa de resolver el problema, pero sigue siendo una técnica válida en programación funcional.

    ```haskell
    -- Calcula el factorial de un número 'n' usando recursión
    fact n = if n == 0 then 1 else n * fact (n-1)
    ```

-----

### Compilación y ejecución

Tus notas sobre la compilación son correctas. `hugs` es un intérprete para Haskell que te permite cargar y probar programas de manera interactiva.

1.  Inicia el intérprete:
    `hugs`
2.  Carga tu archivo (`.hs`):
    `:l miprimerprograma.hs`
3.  Ejecuta una función, por ejemplo `x`, si tu archivo la tiene definida:
    `x`

-----

### Referencias para estudiar

  * **Learn You a Haskell for Great Good**: Un libro muy popular que te enseña Haskell de forma amigable.
  * **Scheme (racket scheme)**: Una implementación de Scheme que es muy completa y se usa para el aprendizaje.
  * **Elixir**: Otro lenguaje funcional, pero con un enfoque diferente (construido sobre la máquina virtual de Erlang, BEAM).

-----

### Comandos de instalación

```bash
sudo apt install elixir hugs ghc erlang-base swi-prolog chezscheme mit-scheme emacs --install-suggests
```

  * **elixir**: Lenguaje de programación funcional.
  * **hugs**: Intérprete de Haskell.
  * **ghc**: El compilador principal de Haskell.
  * **erlang-base**: Requisito para Elixir.
  * **swi-prolog**: Lenguaje de programación lógica.
  * **chezscheme** y **mit-scheme**: Implementaciones de Scheme.
  * **emacs**: Un editor de texto muy potente, popular entre los programadores.
