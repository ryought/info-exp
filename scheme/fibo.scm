(define fibo (lambda (n)
	       (cond ((= n 1) 1)
		     ((= n 2) 1)
		     ((> n 2) (+ (fibo (- n 1)) (fibo (- n 2)))))))
