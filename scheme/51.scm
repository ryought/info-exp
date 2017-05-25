(define (my-reverse l)
  )

(define (_reverse l r)
  (if (null? l)
      r
      (cons (_reverse (cdr l) ) (car l))))


(define (_reverse2 l r)
  (if (null? l)
      r
      (_reverse2 (cdr l) (cons (car l) r))))

