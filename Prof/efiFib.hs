alumnos@sc101:~/Prof$ ghci
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
ghci> :set +s
ghci> :set +t
ghci> let suma x y = x+y in suma 2 3
5
it :: Num a => a
(0.03 secs, 61,848 bytes)
ghci> let suma x y = x+y in (suma 2) 3 --sección de una función
5
it :: Num a => a
(0.00 secs, 60,096 bytes)
ghci> let suma x y = x+y in (\x -> suma x 45) 8
53
it :: Num a => a
(0.01 secs, 60,872 bytes)
ghci> :l anonimas.hs
[1 of 2] Compiling Main             ( anonimas.hs, interpreted )
Ok, one module loaded.
(0.03 secs,)
ghci> suma (1+2) (3+4)
10
it :: Num a => a
(0.00 secs, 61,088 bytes)
ghci> sectionSuma3 10
13
it :: Num a => a
(0.00 secs, 60,920 bytes)
ghci> sectionPura 10
13
it :: Integer
(0.00 secs, 60,776 bytes)
ghci> anonimaSuma3 10 

<interactive>:10:1: error:
    • No instance for (Show (Integer -> Integer))
        arising from a use of ‘print’
        (maybe you haven't applied a function to enough arguments?)
    • In a stmt of an interactive GHCi command: print it
(0.01 secs,)
ghci> :l anonimas.hs
[1 of 2] Compiling Main             ( anonimas.hs, interpreted )
Ok, one module loaded.
(0.01 secs,)
ghci> anonimaSuma3 10 
13
it :: Integer
(0.00 secs, 60,824 bytes)
ghci> (\x -> 2*x+3) 5
13
it :: Num a => a
(0.01 secs, 60,976 bytes)
ghci> map (\x -> x**2) [1..10]
[1.0,4.0,9.0,16.0,25.0,36.0,49.0,64.0,81.0,100.0]
it :: (Floating b, Enum b) => [b]
(0.03 secs, 118,480 bytes)
ghci> map (\x -> x*x) [1..10]
[1,4,9,16,25,36,49,64,81,100]
it :: (Num b, Enum b) => [b]
(0.00 secs, 83,840 bytes)
ghci> map sectionPura [1..20]
[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
it :: [Integer]
(0.01 secs, 105,824 bytes)
ghci> map sectionPura (map sectionPura [1..20])
[7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
it :: [Integer]
(0.00 secs, 110,160 bytes)
ghci> map (\x -> suma x 10) [1..10]
[11,12,13,14,15,16,17,18,19,20]
it :: (Num b, Enum b) => [b]
(0.01 secs, 85,936 bytes)
ghci> map (\x -> suma x 100) [1..10]
[101,102,103,104,105,106,107,108,109,110]
it :: (Num b, Enum b) => [b]
(0.01 secs, 93,536 bytes)
ghci> take 3 (map (\x -> suma x 100) [1..10])
[101,102,103]
it :: (Num a, Enum a) => [a]
(0.02 secs, 70,432 bytes)
ghci> drop 3 (map (\x -> suma x 100) [1..10])
[104,105,106,107,108,109,110]
it :: (Num a, Enum a) => [a]
(0.01 secs, 84,096 bytes)
ghci> :l anonimas.hs
[1 of 2] Compiling Main             ( anonimas.hs, interpreted )
Ok, one module loaded.
(0.02 secs,)
ghci> fib 10
89
it :: Num a => a
(0.01 secs, 131,624 bytes)
ghci> map fib [0..10]
[1,1,2,3,5,8,13,21,34,55,89]
it :: Num b => [b]
(0.01 secs, 263,208 bytes)
ghci> map fib [0..20]
[1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946]
it :: Num b => [b]
(0.06 secs, 23,108,192 bytes)
ghci> map fib [0..30]
[1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040,1346269]
it :: Num b => [b]
(5.70 secs, 2,829,016,560 bytes)
ghci> zipWith (*) [1,2,3] [4,5,6]
[4,10,18]
it :: Num c => [c]
(0.00 secs, 67,200 bytes)
ghci> zipWith (+) [1,2,3] [4,5,6]
[5,7,9]
it :: Num c => [c]
(0.01 secs, 65,696 bytes)
ghci> :i zipWith 
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
  	-- Defined in ‘GHC.List’
ghci> :l fibonacci.hs
[1 of 2] Compiling Main             ( fibonacci.hs, interpreted )
Ok, one module loaded.
(0.01 secs,)
ghci> 