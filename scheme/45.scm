(define fib (lambda (n)
	       (cond ((= n 0) 0)
		     ((= n 1) 1) 
		     ((= n 2) 1)
		     ((> n 2) (+ (fib (- n 1)) (fib (- n 2)))))))
