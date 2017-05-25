(define fact2 (lambda (n) (_fact n n)))

(define _fact (lambda (n p)
                    (if (= n 1)
                        p
                        (_fact (- n 1) (* p (- n 1))))))


;; fib   f(n) = 1(n=1, 2), f(n-1)+f(n-2) (n>2)




(define _fib (lambda (n a b)
               (if (= n 1)
                   b
                   (_fib (- n 1) (+ a b) a)
               )
))

(define fib2 (lambda (n))  (_fib n 1 1))
