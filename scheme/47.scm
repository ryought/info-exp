(define fact2 (lambda (n) (_fact n n)))

(define _fact (lambda (n p)
                    (if (= n 1)
                        p
                        (_fact (- n 1) (* p (- n 1))))))
