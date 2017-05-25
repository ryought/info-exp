(define compose (lambda (F G)  (lambda (n) (G (F n)))  ))

;; ((compose (lambda (x) (+ x 1)) (lambda (x) (* x x))) 2)  -> 9
