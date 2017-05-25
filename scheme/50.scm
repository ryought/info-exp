;; 同義
(list 1 2 3 4)
'(1 2 3 4)

(cons 1 (cons 2 (list)))


(define my-assoc (lambda ()))



(define alist '((1 . "One") (2 . "Two") (3 . "Three")))
(my-assoc 2 alist) ;; (2 . "Two)
