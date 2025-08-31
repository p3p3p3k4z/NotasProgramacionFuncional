### Construcciones de nombramiento en Haskell

En Haskell, hay dos construcciones principales para nombrar valores y funciones localmente dentro de una expresión, que son el `where` y el `let`. Ambas permiten hacer tu código más claro y organizado.

#### 1\. Construcción `where` (Nombramiento diferido)

La cláusula **`where`** te permite definir variables o funciones locales que solo son visibles en la expresión a la que están unidas.  Estas definiciones se evalúan después de la expresión principal, de ahí la idea de "nombramiento diferido" que mencionaste. Esto es ideal para simplificar una expresión compleja al final de una función.

```haskell
-- Define una variable local 'x' para ser usada en la expresion x + x
x + x where x = 10
-- Resultado: 20

-- Define dos variables locales, 'x' y 'y', para usarlas en la expresion x + y
x + y where x = 10; y = 10
-- Resultado: 20
```

#### 2\. Construcción `let in` (Nombramiento anticipado)

La expresión **`let in`** te permite nombrar valores antes de usarlos en una expresión.  Es útil cuando necesitas una variable en varias partes de un bloque de código y quieres definirla al inicio. Recuerda que, a diferencia del `where`, el `let` se usa como parte de una expresión.

```haskell
-- Define una variable 'x' en un bloque 'let'
let x = 10 in x + x
-- Resultado: 20

-- Puedes definir múltiples variables
let x = 10; y = 20 in x + y
-- Resultado: 30
```

-----

### Clases de Tipos en Haskell

Haskell está estructurado en **clases de tipos**. Puedes pensar en una clase de tipos como una "interfaz" o un conjunto de comportamientos que un tipo de dato debe tener. Si un tipo de dato pertenece a una clase de tipos, significa que se pueden usar ciertas funciones con él.

El ejemplo **`Show`** es una clase de tipos importante. Cualquier tipo de dato que pertenece a la clase `Show` puede ser convertido a una cadena de texto, lo que permite que el intérprete de Haskell lo imprima en la consola.

-----

### Ejemplo de código: `colores.hs` y `ropa.hs`

Aquí tienes un código que podría haber estado en tus archivos para que las operaciones que mencionaste funcionen.

#### `colores.hs`

Este archivo define un tipo de dato llamado `Color` y especifica su **aridad**, **dominio** y **codominio**, así como las **cláusulas** que lo definen.

```haskell
module Colores where

-- El tipo de dato 'Color' es parte de la clase 'Show' para poder ser impreso
data Color = Rojo | Azul | Amarillo | Verde | Negro | Blanco
  deriving Show

-- La funcion 'cambiar' tiene aridad 1
-- Su dominio y codominio es 'Color'
cambiar :: Color -> Color

-- Las clausulas para la funcion 'cambiar' deben ser:
-- Exclusivas: Cada una maneja un caso unico.
-- Exhaustivas: Cubren todos los casos posibles del dominio.
-- No Redundantes: No hay definiciones repetidas.
cambiar Azul = Verde
cambiar Verde = Amarillo
cambiar Amarillo = Azul
```

#### `ropa.hs`

Este archivo utiliza el tipo de dato `Color` para definir el tipo de dato `Prenda` y las funciones `precio` y `estilo`.

```haskell
module Ropa where
import Colores

data Prenda = Camisa | Playera | Short | Pantalon
  deriving Show

-- Asigna un precio a cada tipo de prenda
precio :: Prenda -> Int
precio Camisa   = 1200
precio Playera  = 500
precio Short    = 505
precio Pantalon = 800

-- Define el estilo de cada prenda
estilo :: Prenda -> Color -> String
estilo Camisa c = "Camisa " ++ show c
estilo Playera c = "Playera " ++ show c
estilo Short c = "Short " ++ show c
estilo Pantalon c = "Pantalon " ++ show c

-- La implementacion de tu nota:
ejemplo_ropa :: Int
ejemplo_ropa = precio Camisa + precio Playera + precio Short
```

-----

### Conceptos clave en tu código

  * **Firma de la función (`::`)**: La línea `precio :: Num a => Ropa -> a` define la firma de la función `precio`. El **dominio** de la función es `Ropa` (espera un argumento de tipo `Prenda`), y su **codominio** es `a` (devuelve un valor de tipo numérico). `Num a =>` es una restricción que asegura que el tipo `a` sea un número.
  * **Exhaustividad**: Es fundamental que las funciones sean exhaustivas, es decir, que cubran todos los posibles valores de su dominio.
  * **Manejo de casos con `_` y `error`**: El guion bajo `_` es un **patrón comodín** que coincide con cualquier valor. Es útil para manejar casos no definidos o que no necesitas especificar, a menudo combinado con la función `error`.

-----

### Comandos del intérprete `hugs`

  * **`help`**: Puedes usar `:help` o `:?` para ver una lista de todos los comandos disponibles en el intérprete.
  * **`:l` (load)**: Este comando carga un archivo `.hs` en el intérprete, permitiéndote usar las funciones que has definido.
    ```bash
    :l ropa.hs
    ```
  * **`:t` (type)**: Un comando fundamental. `:t` te muestra el tipo de una expresión, lo cual es muy útil para depurar y entender tu código.
    ```bash
    :t precio
    -- Resultado: precio :: Prenda -> Int
    ```
  * **`eval ej`**: El intérprete de `hugs` evalúa las expresiones directamente. Si tu archivo `datos.hs` tiene una expresión llamada `ej`, escribir su nombre la evaluará.