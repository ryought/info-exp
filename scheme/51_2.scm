(define (_reverse2 l r)
  (if (null? l)
      r
      (_reverse2 (cdr l) (cons (car l) r))))

(define (my-reverse l) (_reverse2 l (list)))
