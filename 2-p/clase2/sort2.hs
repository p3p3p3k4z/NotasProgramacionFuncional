import Data.List

quickSort [] = []
quickSort (a:bs) = quickSort [b | b <- bs, b < a] ++ [a] ++ quickSort [b | b <- bs, b >= a]

mergeSort [] = []
mergeSort [a] = [a]
mergeSort xs = res
  where
    l = length xs
    (primerPar, segundoPar) = (take (div l 2) xs, drop (div l 2) xs)
    res = merge (mergeSort primerPar) (mergeSort segundoPar)

merge [] ls = ls
merge ls [] = ls
merge (a:bs) (b:cs) =
  if a <= b then a : merge bs (b:cs)
  else b : merge (a:bs) cs

selectionSort [] = []
selectionSort xs = m : selectionSort (delete m xs)
  where
    m = minimum xs

insertionSort [] = []
insertionSort (a:bs) = colocarBien a (insertionSort bs)

colocarBien n [] = [n]
colocarBien n (a:bs) =
  if n <= a then n : a : bs
  else a : colocarBien n bs
