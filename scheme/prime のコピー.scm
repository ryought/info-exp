;; ふるい
(define (sieve m)
  (if (< m 2)
      (lambda (n) #t)  ;; 2以下ならとりあえずtを返す関数を返す
      (let ((f (sieve (- m 1))))
	(if (f m)
	    (lambda (n) (and (f n) (< 0 (modulo n m))))
	    f
	    ))))
