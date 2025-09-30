import Data.list

quickSort[] = []
quickSort(a:bs) = quickSort [b | b <- bs, b<a] ++ [a]++quickSort[b | b <-bs,b>=a]



mergeSort[] = []
mergeSort [a] = [a]
mergeSort (a,b,ls) = res
	where
	(primerPar,segundoPar) = (take(div l 2)(a:b:ls), drop (div l 2) (a:b:ls))
	l = length (a:b:ls)
	res = (merge(mergeSort primerPar)(mergeSort segundoPar))

merge [] ls = ls
merge ls [] = ls
merge (a:bs)(b:cs) =
	if a<=b then a:merge bs (b:cs) else b:merge(a:bs)cs

selectionSort[]
m:selecctionSort(delete m (a:bs))
	where
		m= minimun(a:bs)
insertSort [] = []
insertSort(a,b,c) = take b(if a>=b then b<-a |

