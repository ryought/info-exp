;; l を 順番にop(operation)にかけていった結果をaccに積む
(define (my-foldl op acc l)
  (if (null? l)
      acc
      (my-foldl op (op (car l) acc) (cdr l))))


(define (f key x acc)
  (if (equal? (car x)  key  )
      (car x)
      #f))

(define (ff x acc))

(define (f key x acc)
  (if (equal? acc #f)
      (if (equal? (car x) key)
          x
          #f)
      acc))



(define (my-assoc2 key l)
  (define (ff key) (lambda (x acc) (f key x acc)))
  (my-foldl (ff key) #f l))


(define (acc x) (+ 1 x))


(define (acc2 x y) (+ 1 x y))

(define (acc3 x)  (lambda (y)  (acc2 x y)))
