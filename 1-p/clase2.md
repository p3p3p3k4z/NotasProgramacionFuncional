### Construcción `where` (Nombramiento diferido)

La cláusula `where` te permite definir variables o funciones locales que solo son visibles en la expresión a la que están unidas. Es una forma de organizar tu código y hacerlo más legible. Las definiciones en el `where` se evalúan después de la expresión principal, lo cual explica la idea de "nombramiento diferido" que anotaste.

```haskell
-- Define una variable local 'x' para ser usada en la expresion x + x
x + x where x = 10
-- Resultado: 20

-- Define dos variables locales, 'x' y 'y', para usarlas en la expresion x + y
x + y where x = 10; y = 10
-- Resultado: 20
```

-----

### Clases de Tipos en Haskell

Haskell está estructurado en **clases de tipos**. Piensa en una clase de tipos como una "interfaz" o un conjunto de comportamientos que un tipo de datos puede tener. Si un tipo pertenece a una clase de tipos, significa que se pueden usar ciertas funciones con él.

El ejemplo que anotaste, **`Show`**, es una clase de tipos muy importante. Cualquier tipo de dato que pertenezca a la clase `Show` se puede convertir en una cadena de texto. Esto es lo que permite que el intérprete de Haskell imprima los valores en la consola.

-----

### Ejemplo de código: `ropa.hs` y `colores.hs`

Para los ejemplos de archivos que anotaste, `ropa.hs` y `colores.hs`, aquí tienes un código que podría haber estado en esos archivos para que las operaciones que mencionaste funcionen.

#### `colores.hs`

Este archivo define un tipo de dato llamado `Color` con diferentes valores. La cláusula `deriving Show` indica que este tipo de dato pertenece a la clase `Show` y, por lo tanto, se puede imprimir.

```haskell
module Colores where

data Color = Rojo | Azul | Amarillo | Verde | Negro | Blanco
  deriving Show
```

- Aridad

La aridad de una función se refiere al número de argumentos que acepta. En este caso, la función cambiar tiene una aridad de 1, ya que solo toma un argumento de tipo Color. La flecha -> en la signatura Color -> Color separa los argumentos del resultado. En este caso, solo hay un argumento antes de la última flecha.

- Dominio y CodominioAridad

La aridad de una función se refiere al número de argumentos que acepta. En este caso, la función cambiar tiene una aridad de 1, ya que solo toma un argumento de tipo Color. La flecha -> en la signatura Color -> Color separa los argumentos del resultado. En este caso, solo hay un argumento antes de la última flecha.

- Dominio y Codominio

El dominio de una función es el conjunto de valores que la función puede recibir como entrada. Para la función cambiar, el dominio es el tipo de datos Color.

El codominio es el conjunto de valores que la función puede devolver como resultado. En este caso, el codominio también es el tipo de datos Color.

Esto se especifica claramente en la signatura de la función (cambiar :: Color -> Color), donde el primer Color es el dominio y el último Color es el codominio.

- Cláusulas (Definiciones de casos)

Las definiciones de tu función cambiar se construyen mediante cláusulas, donde cada línea maneja un caso específico (por ejemplo, cambiar Azul = Verde).

Exclusivas: Cada cláusula debe manejar un caso único. La línea cambiar Azul = Amarillo se comenta en el código para evitar que haya dos definiciones para el mismo argumento (Azul), lo que generaría un error.

Exhaustivas: Deben cubrir todos los posibles valores del dominio. Si no incluyes una cláusula para el color Verde, el código no compilará porque la definición no es completa. Para corregir esto, se ha añadido cambiar Verde = Amarillo al código.

No Redundantes: No debe haber definiciones repetidas o innecesarias.

El dominio de una función es el conjunto de valores que la función puede recibir como entrada. Para la función cambiar, el dominio es el tipo de datos Color.

El codominio es el conjunto de valores que la función puede devolver como resultado. En este caso, el codominio también es el tipo de datos Color.

Esto se especifica claramente en la signatura de la función (cambiar :: Color -> Color), donde el primer Color es el dominio y el último Color es el codominio.

#### `ropa.hs`

Este archivo utiliza el tipo de dato `Color` del archivo `colores.hs` para definir un tipo de dato `Prenda`. Luego, se crean funciones que operan sobre estos datos para obtener sus precios y estilos.

```haskell
module Ropa where
import Colores

data Prenda = Camisa | Playera | Short | Pantalon
  deriving Show

-- Asigna un precio a cada tipo de prenda
precio :: Prenda -> Int
precio Camisa  = 1200
precio Playera = 500
precio Short   = 505
precio Pantalon = 800

-- Define el estilo de cada prenda
estilo :: Prenda -> Color -> String
estilo Camisa c = "Camisa " ++ show c
estilo Playera c = "Playera " ++ show c
estilo Short c = "Short " ++ show c
estilo Pantalon c = "Pantalon " ++ show c

-- Aquí la implementación del código es para hacer las operaciones de tus notas
ejemplo_ropa :: Int
ejemplo_ropa = precio Camisa + precio Playera + precio Short
```

Conceptos clave en tu código

Firma de la función (::): La línea precio :: Num a => Ropa -> a es la firma de la función.

El dominio de esta función es Ropa, es decir, la función espera un argumento que sea una Camisa, Playera, Short o Pantalon.

El codominio es a, que es cualquier tipo de dato numérico (Int, Float, etc.). El prefijo Num a => es lo que le dice a Haskell que a debe ser un tipo numérico, por lo que puedes usar tanto números enteros como decimales.

Exhaustividad: Como anotaste, es fundamental que las funciones sean exhaustivas, lo que significa que deben tener una definición para cada posible valor del tipo de entrada. En tu código original, faltaba la definición para Camisa, lo que hubiera causado un error en tiempo de ejecución. He añadido la línea precio Camisa = 1200 para que la función sea completa.

Coherencia en los datos: Tu código definía un precio para Pantalon, pero Pantalon no existía en el tipo de datos Ropa. Un error muy común. He añadido Pantalon a la definición de data Ropa para que tu función sea coherente con tus datos.

Manejo de casos con _ y error: La línea estilo _ _ = error "No definido" es una excelente manera de manejar casos no definidos.

El guion bajo (_) se llama patrón comodín; le dice a Haskell que el argumento puede ser cualquier cosa.

La función error detiene la ejecución del programa y muestra el mensaje que has escrito. Esto te ayuda a encontrar rápidamente combinaciones que no habías considerado en tu lógica.

-----

### Comandos del intérprete `hugs`

Tus notas sobre cómo interactuar con `hugs` son muy útiles. A continuación, se explican los comandos que anotaste.

  * **`help`**: Si te encuentras perdido en el intérprete, puedes escribir `:help` o `:?` para ver una lista de todos los comandos disponibles y una breve descripción de lo que hacen.
  * **`:l` (load)**: Este comando se utiliza para cargar un archivo `.hs` en el intérprete. Es lo que permite que `hugs` conozca las funciones y tipos de datos que has definido.
    ```bash
    :l ropa.hs
    ```
  * **`:t` (type)**: Un comando fundamental para la programación en Haskell. `:t` te muestra el tipo de una expresión. Esto es muy útil para entender qué tipo de datos espera o devuelve una función.
    ```bash
    :t precio
    -- Resultado: precio :: Prenda -> Int
    ```
  * **`eval ej`**: El intérprete de `hugs` evalúa las expresiones que escribes directamente. Por lo tanto, si tuvieras una expresión llamada `ej` en tu archivo `datos.hs`, simplemente escribir su nombre la evaluaría.
