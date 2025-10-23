x=10

factorial n = foldr (*) 1 [1..n]

fact n = if n==0 then 1 else n*fact(n-1)
