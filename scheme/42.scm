(define even<odd? (lambda (a b c d e)
		    (< (evenN a b c d e) (oddN a b c d e))
		    ))

;; 順繰りにFを適用する
(define mul (lambda (F a b c d e) (+ (F a) (+ (F b) (+ (F c) (+ (F d) (F e))))) ))

(define even (lambda (x) (if (even? x) 1 0)))
(define odd (lambda (x) (if (odd? x) 1 0)))

(define evenN (lambda (a b c d e) (mul even a b c d e)))
(define oddN (lambda (a b c d e) (mul odd a b c d e)))

;; 奇数が偶数より多い場合t、そうでない場合fを返す
;; (even<odd? 7 1 2 4 9)
