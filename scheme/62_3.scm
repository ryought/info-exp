
;; フレーム
(define (empty-frame)
  ;; 空のフレームを返す。
  (list)
  )
(define (update frame var val)
  ;; フレーム`frame'に変数`var'の値が`val'であるという情報を追加したフレームを返す。
  ;; `var'が既に`frame'内に定義されている場合は情報を上書きする。
  (cons (cons var val) frame)
  )
(define (lookup var frame)
  ;; `var'に割り当てられた値を`frame'から探し、変数と値のペアを返す。
  ;; 見つからない場合は、#fを返す。
  (assoc var frame)
  )

;; 環境
(define (make-env)
  ;; 空のフレーム1つからなる新しい環境を返す。
  (list (empty-frame))
  )
(define (extend-env env)
  ;; 環境`env'を空のフレームで拡張した環境を返す。
  (cons (empty-frame) env)
  )

(define (define-var env var val)
  (if (null? env)
      env
      (cons (update (car env) var val) (cdr env))))

(define (lookup-var var env)
  (if (null? env)
      #f
      (let ((found (lookup var (car env))))
        (if (pair? found)
            found
            (lookup-var var (cdr env))))))


;; lambda閉包
(define (make-closure env params body)
  ;; パラメータ 関数本体 環境
  (cons '*lambda* (cons env (cons params body))))

(define (data-closure? data)
  (and (pair? data) (equal? (car data) '*lambda*)))

(define closure-env cadr)
(define closure-params caddr)
(define closure-body cdddr)

;; 組み込み関数
(define (make-primitive arity fun)
  (list '*primitive* arity fun))
(define (data-primitive? data)
  (and (pair? data) (equal? (car data) '*primitive*)))
(define primitive-arity cadr)
(define primitive-fun caddr)


(define (print-data data)
  (cond ((data-closure? data) (display "#<closure>"))
        ((data-primitive? data) (display "#<primitive>"))
        ((equal? data '*unspecified*) (display "#<unspecified>"))
        ((equal? data '*error*) (display "#<error>"))
        ((equal? data '*exit*))
        (else (write data))))



;; 評価関数  環境と式→環境とデータ
(define (base-eval env exp)
  (cond ((eof-object? exp) (cons env '*exit*)) ;; EOF
        ((constant? exp) (cons env exp))
        ((symbol? exp) (var-eval env exp))
        ((not (pair? exp)) (eval-error env 'unknown-data exp)) ;; エラー
        ((equal? (car exp) 'exit) (cons env '*exit*))
        ((equal? (car exp) 'define) (def-eval env exp)) ;;
        ((equal? (car exp) 'let) (let-eval env exp)) ;;
        ((equal? (car exp) 'letrec) (letrec-eval env exp))
        ((equal? (car exp) 'lambda) (lambda-eval env exp)) ;; 
        ((equal? (car exp) 'if) (if-eval env exp))
        ((equal? (car exp) 'begin) (begin-eval env exp))
        ((equal? (car exp) 'quote) (quote-eval env exp))
        (else (app-eval env exp)))) ;;

(define (constant? exp)
  (or (boolean? exp) (number? exp) (string? exp)))


(define (eval-error env type exp)
  (display "ERROR: ")
  (write type)
  (display ": ")
  (print-data exp)
  (newline)
  (cons env '*error*))


(define (let-eval env exp)
  (if (correct-syntax? 'let exp)
      (base-eval env (let->app exp))
      (eval-error env 'syntax-error exp)))
(define (let->app exp)
  (let ((decl (cadr exp))
        (body (cddr exp)))
    (cons (cons 'lambda (cons (map car decl) body))
          (map cadr decl))))

(define (correct-syntax? type exp) #t)

(define (def-eval env exp)
  (if (correct-syntax? 'define exp)
      (let* ((var (cadr exp))
             (res (base-eval env (caddr exp)))
             (env (car res))
             (val (cdr res)))
        (cons (define-var env var val) var))
      (eval-error env 'syntax-error exp)))


(define (var-eval env exp)
  ;; DONE
  (if (correct-syntax? 'var exp)
      (cons env (cdr (lookup-var exp env)))
      (eval-error env 'syntax-error exp))
  )

(define (lambda-eval env exp)
  (if (correct-syntax? 'lambda exp)
      ;;ex (lambda (x) (* x x))
      (cons env (make-closure env (cadr exp) (caddr exp)))
      (eval-error env 'syntax-error exp)))


(define (if-eval env exp)
  ;; DONE
  (if (correct-syntax? 'if exp)
      (if (cdr (base-eval env (cadr exp)))
          (base-eval env (caddr exp))
          (base-eval env (cadddr exp)))
      )
  )

(define (quote-eval env exp)
  ;; DONE
  (if (correct-syntax? 'quote exp)
      (cons env (cadr exp))
      (eval-error env 'syntax-error exp))
  )


(define (map-base-eval env el)
  (cons env
        (map (lambda (exp) (cdr (base-eval env exp))) el))) ;; 

;; 関数適用
(define (app-eval env exp)
  (if (correct-syntax? 'app exp)
      (let* ((l (map-base-eval env exp))
             (env (car l))
             (fun (cadr l))
             (args (cddr l)))
        (base-apply env fun args))
      (eval-error env 'synatx-error exp)))

(define (fold2 f init lis1 lis2)
  (if (or (null? lis1) (null? lis2))
      init
      (fold2 f (f init (car lis1) (car lis2))
               (cdr lis1)
               (cdr lis2))))

(define (base-apply env fun args)
  (cond ((data-closure? fun)
         (if (= (length (closure-params fun)) (length args))
             (let* ((tmp-env (fold2 define-var (extend-env (closure-env fun)) (closure-params fun) args))
                    (res     (base-eval tmp-env (closure-body fun))))
               (cons env (cdr res)))
             (eval-error 'wrong-number-of-args fun env)))
        ((data-primitive? fun)
         (if (or (not (number? (primitive-arity fun)))
                 (= (primitive-arity fun) (length args)))
             ((primitive-fun fun) env args)
             (eval-error env 'wrong-number-of-args fun)))
        (else
         (eval-error env 'non-function (list env fun args)))))



(define (make-top-env)
  (let* ((env (make-env))
         (env
          (define-var env '=
            (make-primitive 2 (lambda (env args)
                                (cons env (= (car args) (cadr args)))))))
         (env
          (define-var env '+
            (make-primitive 2 (lambda (env args)
                                (cons env (+ (car args) (cadr args)))))))
         (env
          (define-var env '*
            (make-primitive 2 (lambda (env args)
                                (cons env (* (car args) (cadr args)))))))
         (env
          (define-var env 'list
            (make-primitive #f (lambda (env args) (cons env args)))))
         (env
          (define-var env 'null?
            (make-primitive 1 (lambda (env args)
                                (cons env (null? (car args)))))))
         (env
          (define-var env 'equal?
            (make-primitive 2 (lambda (env args)
                                (cons env (equal? (car args) (cadr args)))))))
         (env
          (define-var env 'display
            (make-primitive
             1
             (lambda (env args)
               (display (car args))
               (cons env '*unspecified*)))))
         (env
          (define-var env 'load ; load に関しては理解できなくもよい
            (make-primitive
             1
             (lambda (env args)
               (with-input-from-file (car args)
                 (lambda ()
                   (define (re-loop env)
                     (let* ((res (base-eval env (read)))
                            (env (car res))
                            (val (cdr res)))
                       (if (equal? val '*exit*)
                           (cons env '*unspecified*)
                           (re-loop env))))
                   (re-loop env))))))))
    env))





(define (scheme)
  (let ((top-env (make-top-env)))
    (define (rep-loop env)
      (display "sister> ")
      (let* ((res (base-eval env (read)))
             (env (car res))
             (val (cdr res)))
        (print-data val)
        ;(print-data env)
        (newline)
        (if (equal? val '*exit*)
            #t
            (rep-loop env))))
    (rep-loop top-env)))
