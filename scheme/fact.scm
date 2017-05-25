;; 関数定義
;; 再帰  定義の中に定義
;; 末尾再帰  引数の中に応えが入ってる→メモリの節約
;; 局所変数


(define fact (lambda (n)
               (if (= n 1)
                   1
                   (* n (fact (- n 1))))))


(define fact (lambda (n) (_fact n n)))

(define _fact (lambda (n p)
                    (if (= n 1)
                        p
                        (_fact (- n 1) (* p (- n 1))))))
