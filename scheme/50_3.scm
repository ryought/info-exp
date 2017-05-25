(define (my-assoc key l)
  (if (null? l)
      #f
      (if (equal? (car (car l)) key)
          (car l)
          (my-assoc key (cdr l)))))
