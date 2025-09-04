tablaOr = [(p,q,p||q) | p <-[True,False],q<-[True,False]]
tablaAnd = [(p,q,p&&q) | p <-[True,False],q<-[True,False]]
tablaNot = [(p,not p) | p <-[True,False]]

implica p q = not p || q
tabla = [(p,q,r, implica ((implica p q) && (implica q r)) (implica p r))
    | p <- [True,False], q <-[True,False], r <-[True,False]]
