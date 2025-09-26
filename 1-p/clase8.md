### Lógica Proposicional y Computación Simbólica

En esta clase, exploramos dos aplicaciones elegantes de la programación funcional: cómo usar listas por comprensión para demostrar leyes de la lógica y cómo construir funciones que no solo calculan un resultado, sino que también generan una representación simbólica de su propia computación.

---

### 1. Lógica Proposicional con Listas por Comprensión 🧠

Las listas por comprensión son una herramienta increíblemente poderosa y declarativa en Haskell. Su sintaxis, similar a la notación de conjuntos en matemáticas, las hace perfectas para generar y probar sistemáticamente todas las combinaciones posibles en una tabla de verdad.

En el código `tablasVF.hs`, definimos funciones para generar las tablas de verdad de los operadores lógicos básicos y para demostrar una tautología fundamental.

**Código Mejorado: `tablasVF.hs`**

```haskell
-- Agregamos firmas de tipo para mayor claridad y seguridad.

-- Tabla de verdad para el operador OR (||)
tablaOr :: [(Bool, Bool, Bool)]
tablaOr = [(p, q, p || q) | p <- [True, False], q <- [True, False]]

-- Tabla de verdad para el operador AND (&&)
tablaAnd :: [(Bool, Bool, Bool)]
tablaAnd = [(p, q, p && q) | p <- [True, False], q <- [True, False]]

-- Tabla de verdad para el operador NOT
tablaNot :: [(Bool, Bool)]
tablaNot = [(p, not p) | p <- [True, False]]

-- Definición del operador de implicación (p -> q)
implica :: Bool -> Bool -> Bool
implica p q = not p || q

-- Demostración de la Ley del Silogismo Hipotético: ((p->q) && (q->r)) -> (p->r)
-- Esta es una tautología, lo que significa que siempre es verdadera.
tabla :: [(Bool, Bool, Bool, Bool)]
tabla = [(p, q, r, implica ((implica p q) && (implica q r)) (implica p r))
        | p <- [True, False], q <- [True, False], r <- [True, False]]
```

- **Análisis**: Cada generador (`p <- [True, False]`) crea un "bucle". Al anidar generadores, creamos el producto cartesiano de todas las entradas posibles. La expresión antes del `|` (`(p, q, p || q)`) define la forma de cada fila en nuestra tabla de verdad.
    
- **Silogismo Hipotético**: La función `tabla` es especialmente interesante porque prueba que si "p implica q" y "q implica r", entonces "p implica r". Al ejecutarla, verás que la última columna de la tupla es siempre `True`, demostrando que es una ley universal de la lógica.
    

---

### 2. Resolución Simbólica: Fibonacci 📈

Continuando con la idea de la clase anterior, podemos diseñar funciones que devuelvan más que un simple valor. La función `fibS` es un ejemplo avanzado: calcula un número de Fibonacci y, al mismo tiempo, construye un **árbol de expresión** que representa cómo se realizó ese cálculo.

Para lograr esto, la función devuelve una tupla: `(resultado, árbol_simbólico)`.

**Código Mejorado: `fibS.hs`**

```haskell
-- Un tipo de dato para representar la suma de enteros.
-- I representa un número (una hoja del árbol).
-- P representa una suma (un nodo del árbol).
data E = I Integer | P E E deriving Show

-- fibS: Devuelve el n-ésimo número de Fibonacci y una representación simbólica de su cálculo.
-- Nota: Esta secuencia empieza con F(0)=1, F(1)=1. La estándar es F(0)=0, F(1)=1.
fibS :: Integer -> (Integer, E)
fibS 0 = (1, I 0) -- Caso base 1
fibS 1 = (1, I 1) -- Caso base 2
fibS n
  | n > 1 = (resultado_f1 + resultado_f2, P arbol_e1 arbol_e2)
  | otherwise = error "Entrada inválida: n debe ser un entero no negativo"
  where
    -- Llamadas recursivas para obtener los resultados y los árboles de los sub-problemas.
    (resultado_f1, arbol_e1) = fibS (n - 1)
    (resultado_f2, arbol_e2) = fibS (n - 2)

-- Convierte la representación E a una cadena de texto con indentación para mostrar el árbol.
imprimir :: E -> String
imprimir arbol = imprimirAux 0 arbol
  where
    imprimirAux indent (I n) = indentacion indent ++ show n ++ "\n"
    imprimirAux indent (P x y) = indentacion indent ++ "P\n" ++ imprimirAux (indent + 2) x ++ imprimirAux (indent + 2) y
    indentacion n = take n (repeat ' ')

-- --- Funciones para Analizar el Árbol de Expresión ---

-- contarPlus: Cuenta el número de sumas (nodos 'P') en el árbol.
-- Representa el número de pasos recursivos.
contarPlus :: E -> Integer
contarPlus (I n) = 0
contarPlus (P x y) = 1 + contarPlus x + contarPlus y

-- contarHojas: Cuenta el número de enteros (nodos 'I') en el árbol.
-- Representa el número de veces que se llegó a un caso base.
contarHojas :: E -> Integer
contarHojas (I n) = 1
contarHojas (P x y) = contarHojas x + contarHojas y

-- contarNodos: Devuelve el tamaño total del árbol (hojas + nodos).
contarNodos :: E -> Integer
contarNodos arbol = contarHojas arbol + contarPlus arbol
```

- **Análisis de `fibS`**: En el paso recursivo, la función `fibS` desestructura las tuplas devueltas por las llamadas a `fibS (n-1)` y `fibS (n-2)`. Luego, combina los resultados numéricos con una suma (`+`) y los árboles simbólicos con el constructor `P`, formando un nuevo nodo en el árbol de cálculo.
    
- **Visualización e Inspección**: La nueva función `imprimir` usa un auxiliar con un contador de indentación para "dibujar" el árbol en texto, haciendo visible la estructura de las llamadas recursivas. Las funciones como `contarPlus` y `contarHojas` nos permiten analizar la complejidad y estructura de la computación que generamos simbólicamente.