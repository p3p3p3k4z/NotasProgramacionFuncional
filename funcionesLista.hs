--- Ploblema: Tomar n elementos de una lista
--- Ploblema: Dublicar elementos de una lista
--- Saber que es una lista (definida como dato por el usuario)

--- Listas infinitas

tomar 0 bs = [] 
tomar 1 bs | not (bs==[]) = [head bs]
tomar n (a:bs) | n>1 = a: (tomar (n-1) bs)

doble [] = []
doble (a:bs) = a:a:(doble bs)
