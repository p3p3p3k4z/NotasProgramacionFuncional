
--- Resulta que Haskell se apoya en algo teórico llamado cálculo lambda.
--- El cálculo lambda, por las notas en Classroom, es equivalente en poder
--- computacional a las máquinas de Turing. Lo que podamos hacer con
--- Máquinas de Turing lo podemos hacer con cálculo lambda; de otra forma,
--- ingenieril, lo que podamos hacer con Java lo podemos hacer con Haskell.
--- Y en la parte de complejidad, si algo es inherentemente malo con las
--- máquinas de Turing, lo es con el cálculo lambda; si algo cuesta mucho
--- en Python, probablemente me costará también mucho en Haskell.

-- take n ls toma los primeros n elementos de ls
-- drop n ls omite los primeros n elementos de ls
fib 0 = 1
fib 1 = 1
fib n | n>1 = fib(n-1)+fib(n-2)

fibs = 0:1:zipWith (+) fibs (tail fibs)

suma x y = x+y

sectionSuma3 y = suma 3 y

sectionPura = suma 3

anonimaSuma3 = (\x -> suma x 3) 




