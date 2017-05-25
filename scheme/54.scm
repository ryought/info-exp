(define my-gcd (lambda (x y)
		 (if (> x y) (if (= (modulo x y) 0) y (my-gcd y (modulo x y)))
		             (if (= (modulo y x) 0) x (my-gcd x (modulo y x))))))

(define (rational a b) (cons a b))
(define (rat-num r) (/ (car r) (my-gcd (cdr r) (car r))))
(define (rat-denom r) (/ (cdr r) (my-gcd (cdr r) (car r))))

(define (rat-= r1 r2) (and (= (rat-num r1) (rat-num r2)) (= (rat-denom r1) (rat-denom r2))) )

(define rat-0 (rational 0 1))

(define (rat-+ r1 r2)
  (rational (+ (* (rat-num r1) (rat-denom r2)) (* (rat-num r2) (rat-denom r1)))  (* (rat-denom r1) (rat-denom r2))) )

(define (rat-- r)
  (rational (* -1 (rat-num r)) (rat-denom r)))


(define rat-1 (rational 1 1))

(define (rat-* r1 r2) (rational (* (rat-num r1) (rat-num r2)) (* (rat-denom r1) (rat-denom r2))))

(define (rat-/ r) (rational (cdr r) (car r)))


