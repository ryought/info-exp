(define (my-car x) (car x))
(my-car (list 1 2))


(define (exp1 a n)
  (cond ((< n 0) 0)
        ((= n 0) 1)
        ((even? n) (* (exp1 a (/ n 2)) (exp1 a (/ n 2))))
        (else (* a (exp1 a (- n 1))))))

(define (exp2 a n)
  (let ((square (lambda (x) (* x x))))
    (cond ((< n 0) 0)
          ((= n 0) 1)
          ((even? n) (square (exp2 a (/ n 2))))
          (else (* a (exp2 a (- n 1)))))))

