# Haskel
((ML, Cam),Gofer, ...)
Caracteristicas o puntos destacados del lenguaje

- Funciones
- Datos: Dominio y codominio
- No hay asignacion destructiva (inmutabilidad)
- Evaluacion perezosa
- Es ecleptico

### Ejemplo de Operacion
Notacion Prefija
Expresion S
**Scheme**
(+ 1 1)
(* 2 3 5)

**haskel**
> 1+1
> 2*4*2
> putStr "Hola Mundo"
> putStr ("hola" ++ "mundo")
**Construccion de nombramiento anticipado : let in** Pregunta de exa
Hago que algo sea, este ej suma var
> let x=2 in x+x
> let x=4;y=10 in x+y

> factorial n = foldr (*) 1 [1..n]
> fact n = if n==0 then 1 else n*fact(n-1)

### Compilar
> hugs
> :l miprimerprograma.hs
> x

### Biografia/Consultar
- Learn You a Haskell for Great Good
- Scheme (racket scheme)
- Elixir

### Instalacion
Se puede usar instalar con:

```bash
sudo apt install elixir hugs ghc erlang-base swi-prolog chezscheme mit-scheme emacs --install-suggests 
```


