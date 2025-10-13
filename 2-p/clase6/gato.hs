data Casilla = E | X | O deriving (Show,Eq)
data Jugador = JX | JO deriving Show

estadoInicial = [E,E,E,E,E,E,E,E,E]

tiradas x = [i | (i,z)<-zip[1..]estadoInicial, z==E]
--hacerTirada JX i tablero =

--tirar X en 5 [E,E,E,E,X,E,E,E,E]

--insertar n e ls
insertar 1 x(a:ls) = (x:ls)
insertar n x(a:ls) | n>1 = (a: (insertar (n-1) x ls))


--[x | x<-estadoInicial, x==E]
--generarProxMov jugadorX tablero = [tirar X tablero |]
--tirar x i tablero = []


--actualizarTablero
--valorarTablero
--minimax
