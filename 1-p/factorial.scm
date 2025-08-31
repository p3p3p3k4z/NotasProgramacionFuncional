;; Definición de la función factorial
;; Usa recursión para calcular el factorial de n
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

;; Versión 1 de la función de valor absoluto
;; Usa la función 'if' para comprobar si el número es negativo
(define (abs1 n)
  (if (< n 0)
      (- n)
      n))

;; Versión 2 de la función de valor absoluto
;; Usa la función 'cond' para manejar múltiples casos
(define (abs2 n)
  (cond
    ((> n 0) n)
    ((= n 0) n)
    (else (- n))))