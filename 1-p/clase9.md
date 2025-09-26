
En esta lección, damos un paso fundamental al crear programas que interactúan con el usuario. Exploramos cómo Haskell maneja la entrada y salida (I/O), la conversión entre diferentes tipos de datos y cómo aplicar transformaciones de datos de una manera elegante y funcional.

---

### 1. Programas Interactivos: La Mónada `IO`

Para que un programa en Haskell pueda realizar acciones como imprimir en pantalla o leer del teclado, utiliza el contexto `IO`. La función `main` y el bloque `do` nos permiten encadenar una secuencia de estas acciones.

- **`main = do`**: Es el punto de entrada de todo programa ejecutable. El `do` indica que a continuación viene una secuencia de acciones I/O.
    
- **`putStrLn "..."`**: Imprime una cadena de texto en la consola y añade un salto de línea al final.
    
- **`getLine`**: Pausa el programa y espera a que el usuario escriba una línea de texto y presione Enter. El texto introducido se captura como un `String`.
    
- **`x <- getLine`**: El operador `<-` se usa para extraer el valor de una acción `IO` (en este caso, el `String` de `getLine`) y asignarlo a una variable (`x`).
    

---

### 2. Conversión de Tipos: El Puente entre Mundos

Un reto común en la I/O es que `getLine` siempre devuelve un `String`, pero a menudo necesitamos trabajar con números o otros tipos. Haskell, al ser un lenguaje de tipado fuerte, requiere que convirtamos explícitamente estos datos.

#### De `String` a Número y viceversa

- **`read`**: Convierte un `String` a otro tipo. Es necesario indicarle a Haskell el tipo de destino. En el ejemplo `let y = read x::Int`, le decimos que interprete el string `x` como un entero (`Int`).
    
- **`show`**: Hace lo contrario; convierte un valor (como un número) a su representación como `String` para que pueda ser impreso con `putStr` o `putStrLn`.
    

#### De Carácter a Número y viceversa

Para realizar operaciones aritméticas con caracteres, como en el programa de encriptación, usamos funciones de la librería **`Data.Char`**.

- **`ord`**: Devuelve el código numérico (ASCII/Unicode) de un carácter. Ej: `ord 'a'` es `97`.
    
- **`chr`**: Devuelve el carácter correspondiente a un código numérico. Ej: `chr 98` es `'b'`.
    

---

### 3. El Estilo Funcional: Composición con `map`

El código de encriptación en `mensaje.hs` es un ejemplo perfecto de cómo se resuelven problemas en programación funcional mediante la **composición de funciones**. En lugar de un bucle, se crea una "cadena de montaje" de transformaciones que se aplican a una lista de datos (el `String`).

La línea `let secreto = map chr (map (1+)(map ord cadena))` se puede leer de adentro hacia afuera:

1. **`map ord cadena`**: Primero, convierte cada carácter del `String` en su valor numérico, resultando en una lista de `Int`.
    
2. **`map (1+) (...)`**: Después, a cada número de esa nueva lista, le suma `1`.
    
3. **`map chr (...)`**: Finalmente, convierte cada número de la lista resultante de vuelta a un carácter.
    

## Este enfoque es declarativo, conciso y evita la gestión manual de estados o contadores.
