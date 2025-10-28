alumnos@sc101:~/Documentos/NotasProgramacionFuncional/2-p$ python3
Python 3.12.3 (main, Aug 14 2025, 17:47:21) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> ls = [3,4,'3','4','c',"hola mundo",(1,2)]
>>> la
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'la' is not defined. Did you mean: 'ls'?
>>> ls
[3, 4, '3', '4', 'c', 'hola mundo', (1, 2)]
>>> ls+ls
[3, 4, '3', '4', 'c', 'hola mundo', (1, 2), 3, 4, '3', '4', 'c', 'hola mundo', (1, 2)]
>>> ls.reverse()
>>> ls
[(1, 2), 'hola mundo', 'c', '4', '3', 4, 3]
>>> ls.reverse()
>>> ls
[3, 4, '3', '4', 'c', 'hola mundo', (1, 2)]
>>> 
alumnos@sc101:~/Documentos/NotasProgramacionFuncional/2-p$ ghci
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
ghci> let ls = [1,2,3] in ls++ls
[1,2,3,1,2,3]
ghci> let ls = [1,2,3] in reverse ls
[3,2,1]
ghci> let ls = [1,2,3] in reverse ls
[3,2,1]
ghci> 

