(define (factorial n)
	(if
		(eq? n 0)) 
				1 ; primera rama
					 (* n (factorial (- n 1))) ; segunda rama
					)
			)


(define (abs1 n)
	(if (< n 0) (- n) n)
		)

(define (abs2 n)
	(if (or (> n 0) (eq? n 0)) n (- n)))
