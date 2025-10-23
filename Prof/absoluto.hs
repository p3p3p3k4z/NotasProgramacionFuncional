-- |2| = 2
-- |-3| = 3
-- |0| = 0

abs1 x = if x>=0 then x else (-x)
---- if <booleana> then <1a rama> then <2a rama, si booleana es falsa>

--- guardas, guardias (guards) 

abs2 x | x==0 = 0
       | x>0  = x
       | x<0  = (-x)

