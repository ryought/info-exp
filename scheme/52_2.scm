(define (f key x acc)
  (if (equal? acc #f)
      (if (equal? (car x) key)
          x
          #f)
      acc))



(define (my-assoc2 key l)
  (define (ff key) (lambda (x acc) (f key x acc)))
  (my-foldl (ff key) #f l))
