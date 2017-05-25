(define _fib (lambda (n a b)
               (if (= n 1)
                   b
                   (_fib (- n 1) (+ a b) a)
               )))

(define fib2 (lambda (n)  (_fib n 1 1)))
