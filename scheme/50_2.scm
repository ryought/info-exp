(define my-length (lambda (l)
                    (if (null? l)
                        0
                        (+ 1 (my-length (cdr l))))))

(define (my-map f l)
  (if (null? l)
      l
      (cons (f (car l)) (my-map f (cdr l)))))

(define (square x) (* x x))


(define (my-assoc key l)
  (if (null? l)
      #f
      (if (equal? (car (car l)) key)
          (car l)
          (my-assoc key (cdr l)))))
