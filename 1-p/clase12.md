## Cómo Compilar un Programa en Haskell (Pregunta de Examen) 📝

Para crear un programa ejecutable a partir de tu código fuente (`.hs`), se utiliza el **Compilador de Haskell de Glasgow (GHC)**. El proceso es muy sencillo.

**Pasos para compilar:**

1. **Escribe tu código**: Crea un archivo, por ejemplo, `HolaMundo.hs`, que contenga una función `main`.
    
    Haskell
    
    ```
    -- HolaMundo.hs
    main :: IO ()
    main = putStrLn "¡Hola, Mundo!"
    ```
    
2. **Abre la terminal**: Navega hasta la carpeta donde guardaste tu archivo.
    
3. **Ejecuta GHC**: Escribe el siguiente comando y presiona Enter.
    
    Bash
    
    ```
    ghc HolaMundo.hs
    ```
    
4. **Ejecuta tu programa**: GHC generará un archivo ejecutable (llamado `HolaMundo` en Linux/macOS o `HolaMundo.exe` en Windows). Para correrlo, escribe:
    
    Bash
    
    ```
    ./HolaMundo
    ```
    
    Y verás en la pantalla: `¡Hola, Mundo!`
    

---

## Funciones de Orden Superior

Estas son funciones que toman otras funciones como argumentos. Son esenciales en el estilo de programación de Haskell.

### `filter`: Filtrando Elementos de una Lista

La función **`filter`** toma una **función de predicado** (una que devuelve `True` o `False`) y una lista. Devuelve una nueva lista que contiene únicamente los elementos que hicieron que el predicado devolviera `True`.

**Ejemplos de uso:**

- **Con un operador**:
    
    Haskell
    
    ```
    ghci> filter (<10) [23, 4, 5, 3, 2]
    [4, 5, 3, 2]
    ```
    
- **Con funciones predefinidas** (como `odd` para impares y `even` para pares):
    
    Haskell
    
    ```
    ghci> filter odd [1, 2, 3, 4, 5, 6]
    [1, 3, 5]
    ```
    
- **Con una función anónima (lambda)** para lógica más compleja, como filtrar una lista de tuplas:
    
    Haskell
    
    ```
    -- Filtra la lista para quedarse con los autos cuyo precio es menor a 12
    ghci> filter (\(_, precio) -> precio < 12) [("PORCHE", 23), ("BMW", 4), ("VOCHO", 11)]
    [("BMW", 4), ("VOCHO", 11)]
    ```
    

---

### `foldr`: Reduciendo una Lista a un Solo Valor

La función **`foldr`** ("plegado por la derecha") es una de las más poderosas de Haskell. Sirve para "reducir" o "colapsar" una lista entera en un único valor. Toma tres argumentos: una función, un valor inicial (acumulador) y la lista.

**Ejemplos de uso:**

- **Para sumar todos los elementos de una lista**: La función es `(+)`, y el valor inicial para una suma es `0`.
    
    Haskell
    
    ```
    ghci> foldr (+) 0 [1..100]
    5050
    ```
    
- **Para concatenar una lista de cadenas**: La función es `(++)` para unir cadenas, y el valor inicial es una cadena vacía `""`.
    
    Haskell
    
    ```
    ghci> foldr (++) "" ["hola", " ", "mundo", " ", ":D"]
    "hola mundo :D"
    ```
