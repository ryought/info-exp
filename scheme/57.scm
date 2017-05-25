(define (if-fun exp1 exp2 exp3)
  (if exp1 exp2 exp3))
 
(define (fact3 n)
  (if-fun (< n 1)
          1
          (* n (fact3 (- n 1)))))


(define (fact4 n)
  (if-fun (= n 0)
          1
          (* n (fact4 (if-fun (= n 0)
                              0
                              (if-fun (> n 0)
                                      (- n 1)
                                      0))))))

(fact 10)
(fact 9)
(fact 8)
...
(fact 1)
で止まるようなもの


(if-fun (< 1 1) 1 (- 1 1))

