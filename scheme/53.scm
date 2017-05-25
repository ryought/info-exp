(define (_ack m n)
  (if (= m 0)
      (+ n 1)
      (if (= n 0)
          (ack (- m 1) 1)
          (ack (- m 1) (ack m (- n 1))))))


(define (_ack2 m n Y A B C)
  )

(define (__ack m n A)
  (if (= m 0)
      (+ n 1)
      ))

(define (ack m n))



(ack 0 3)
;; 4
(ack 4 0)
;; 13
(ack 5 0)
;; 65533


;;http://yppp.hatenablog.com/entry/20101120/1290228056
(define (ack m n)
  (cond ((= m 0) (+ n 1))
        ((= n 0) (ack (- m 1) 1))
        (else (ack (- m 1) (ack m (- n 1))))))


 (define (memoize func)
  (let ((dp (make-hash-table 'equal?)))
    (lambda args
      (if (hash-table-exists? dp args)
          (hash-table-get dp args)
          (let ((value (apply func args)))
            (hash-table-put! dp args value)
            value)))))

(define ack (memoize ack))


(define (ack m n)
  (cond ((= m 0) (+ n 1))
        ((= m 1) (+ n 2))
        ((= m 2) (+ 3 (* n 2)))
        ((= m 3) (+ 5 (* 8 (- (expt 2 n) 1))))
        (else (cond ((= n 0) (ack (- m 1) 1))
                 (else (ack (- m 1) (ack m (- n 1))))
                 ))
        ))

