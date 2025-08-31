### Entrada y Salida

ghci> :l entradaysalida.hs 
[1 of 2] Compiling Main             ( entradaysalida.hs, interpreted )
Ok, one module loaded.
ghci> main
Que onda? Hola como te llamas
pepe
Bienvenido al tequio de manaña a la orillade la carretera por si pasas por ahi (tambien el domingo), 
ghci> 

Porque debemos explicar o comentar lo mas que podamos nuestros
programas, Donald Knuyh (inventor de Tex, libro: The art of programing)

Existe el formato .lhd
que da una monada de acciones secuenciales
ahora lo escrito directamente son coemntarios


### Funciones listas

tail "hola"
head "hola"
reverse (tail (tail ("Robert de Niro"))

ghci> :l funcionesLista.hs 
[1 of 2] Compiling Main             ( funcionesLista.hs, interpreted )
Ok, one module loaded.
ghci> doble [1..5]
[1,1,2,2,3,3,4,4,5,5]

battle match? Desesctructura una lista



ghci> let (a:b:cs)=[1,2,3,4,5] in (a,b,cs)
(1,2,[3,4,5])
