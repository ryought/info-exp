(define min (lambda (x y) (if (< x y) x y)))
(define min-of-four (lambda (a b c d) (min a (min b (min c d)))))

(min-of-four 1 2 5 3)
;; 最小の値を返す
;; (min-of-four 9 2 3 2)
