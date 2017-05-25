(define my-gcd (lambda (x y)
		 (if (> x y) (if (= (modulo x y) 0) y (my-gcd y (modulo x y)))
		             (if (= (modulo y x) 0) x (my-gcd x (modulo y x))))))

