Algoritmos de Ordenamiento
quickSort

Idea:
Elegimos un pivote (por ejemplo, el primer elemento). Separamos la lista en dos: números menores que el pivote y números mayores o iguales. Ordenamos recursivamente esas dos listas y juntamos todo.

Ejemplo:
Lista original: [3, 4, 2, 1, 3, 5]
Después de aplicar quickSort: [1, 2, 3, 3, 4, 5]

mergeSort

Idea:
Dividimos la lista en dos mitades, ordenamos cada mitad por separado y luego las combinamos en una lista ordenada.

Ejemplo:
Lista original: [8, 3, 5, 7, 1, 4, 6, 2]
Se divide en [8, 3, 5, 7] y [1, 4, 6, 2]
Después de ordenar y combinar: [1, 2, 3, 4, 5, 6, 7, 8]

insertionSort

Idea:
Tomamos un elemento y lo colocamos en la posición correcta dentro de la lista ordenada que vamos formando.

Ejemplo:
Lista original: [5, 2, 4, 6, 1, 3]
Después de aplicar insertionSort: [1, 2, 3, 4, 5, 6]
