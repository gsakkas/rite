#lang racket
(require redex)
(require racket/list)

(define-language λh
  ;; configurations (for the reduction relation)
  (Config (e vsu) (stuck vsu))

  ;; expressions
  (e v
     x
     (e e)
     (e + e)
     (ite e e e)
     (cons e e)
     nil
     (hd e)
     ;(fix e)
     ;; (c es)
     ;; (match e with alts)
     )
  ;; stuck terms
  (stuck stuck-t ;; stuck due to a (dynamic) type error
         stuck-e ;; stuck due to some other error (e.g. div-zero)
         )
  ;; values
  (v n b (λ x e) h
     (cons @ t v v) (nil @ t) ;; `t` is the *element* type
     ;;(c vs)
     )
  (n number)
  (b true false)
  ;; types
  (t int bool (t -> t) a
     (list t)
     )
  ;; variables
  (x variable-not-otherwise-mentioned)
  ;; value substitutions
  (vsu ((h_!_ v) ...))
  (h variable-not-otherwise-mentioned)
  (a variable-not-otherwise-mentioned)

  ;; ;; constructors
  ;; (c variable-not-otherwise-mentioned)

  ;; ;; patterns
  ;; (p (c xs))
  ;; (alt (p -> e))

  ;; evaluation contexts
  (E (E e)
     (v E)
     (E + e)
     (v + E)
     (ite E e e)
     (cons E e)
     (cons v E)
     (hd E)
     ;; (c E)
     ;; (E : es)
     ;; (v : E)
     hole)

  ;; type contexts
  (T (T -> t) (t -> T) hole)

  ;; lists, ugh..
  (xs nil (x : xs))
  ;; (es nil (e : es))
  ;; (vs nil (v : vs))
  ;; (ps nil (p : ps))
  ;; (alts nil (alt : alts))

  #:binding-forms
  (λ x e #:refers-to x)
  )

(define-judgment-form λh
  #:mode (elem I I)
  #:contract (elem x xs)
  [----------------
   (elem x (x : _))]
  [(elem x xs)
   -----------
   (elem x (_ : xs))]
  )

;; stolen from david van horn's redex-aam-tutorial
(define-language REDEX)
(define-judgment-form REDEX
    #:mode (lookup I I O)
    #:contract (lookup ((any any) ...) any any)
    [(lookup (_ ... (any any_0) _ ...) any any_0)])
;(define-judgment-form λh
;    #:mode (vsu-lookup I I O)
;    #:contract (vsu-lookup ((any any) ...) any any)
;    [(vsu-lookup (_ ... (any any_0) _ ...) any any_0)])
(define-metafunction λh
  vsu-lookup : vsu h -> any
  [(vsu-lookup vsu h)
   ,(let ((v (assq (term h) (term vsu))))
      (if v (term ,(second v)) v))])
(define-metafunction λh
    ext1 : ((any any) ...) (any any) -> ((any any) ...)
    [(ext1 (any_0 ... (any_k any_v0) any_1 ...) (any_k any_v1))
     (any_0 ... (any_k any_v1) any_1 ...)]
    [(ext1 (any_0 ...) (any_k any_v1))
     ((any_k any_v1) any_0 ...)])
(define-metafunction λh
    vsu-extend : ((any any) ...) (any any) ... -> ((any any) ...)
    [(vsu-extend any) any]
    [(vsu-extend any any_0 any_1 ...)
     (ext1 (vsu-extend any any_1 ...) any_0)])



(define-metafunction λh
  type-of : e -> t
  [(type-of n) int]
  [(type-of b) bool]
  [(type-of (nil @ t)) t]
  [(type-of (cons @ t v_1 v_2)) t]
  [(type-of (λ x e)) (a -> (type-of e))] ;; fresh a?
  [(type-of e) a] ;; fresh a?
  )

;; TODO: need to produce substitution and propagate. suspicious that
;; redex doesn't find a counter-example
(define-judgment-form λh
  #:mode (type-compat I I)
  #:contract (type-compat t t)
  [------------------
   (type-compat int int)]

  [------------------
   (type-compat bool bool)]

  [(type-compat t_1 t_2)
   ------------------
   (type-compat (list t_1) (list t_2))]

  [(type-compat t_1 t_3) (type-compat t_2 t_4)
   ------------------
   (type-compat (t_1 -> t_2) (t_3 -> t_4))]

  [------------------
   (type-compat a t)]
  [------------------
   (type-compat t a)]
  )

;; (define-judgement-form λh
;;   #:mode (I ~ I)
;;   #:contract (t ~ t)
;;   [------------------------ "refl"
;;    (t ~ t)]

;;   )

(define-metafunction λh
  gen : t -> v
  [(gen int)
   ,(generate-term λh n 5)
   (clause-name "Gen-Int")]
  [(gen bool)
   ,(generate-term λh b 5)
   (clause-name "Gen-Bool")]
  [(gen (list t))
   (nil @ t) ;; FIXME
   ;; ,(generate-term λh  5)
   (clause-name "Gen-List")]
  [(gen (t_1 -> t_2))
                      ;; how to say fresh h?
   ,(generate-term λh (λ x h) 5)
   (clause-name "Gen-Fun")]
  [(gen a)
                      ;; how to say fresh h?
   ,(generate-term λh h 5)
   (clause-name "Gen-Hole")])

(define-metafunction λh
  narrow : e t vsu -> (v vsu) or (stuck-t vsu)
  ;; any value narrows to a type-hole
  [(narrow v a vsu)
   (v vsu)
   (clause-name "Narrow-Type-Hole")]
  
  ;; a value-hole that is in the vsu narrows to the same value
  [(narrow h t vsu)
   (v vsu)
   (where v (vsu-lookup vsu h))
   (side-condition (term v))
   ;; provided that the narrowing type matches (thanks redex!)
   (side-condition (equal? (term (type-of v)) (term t)))
   (clause-name "Narrow-Hole-Known-Good")]
  ;; otherwise we're stuck
  [(narrow h t vsu)
   (stuck-t vsu)
   (where v (vsu-lookup vsu h))
   (side-condition (term v))
   (clause-name "Narrow-Hole-Known-Bad")]
  
  ;; a value-hole narrows to a random value of the given type
  [(narrow h t vsu)
   (v (vsu-extend vsu (h v)))
   (where v (gen t))
   (clause-name "Narrow-Hole-Good")]

  ;; ints narrow to int
  [(narrow n int vsu)
   (n vsu)
   (clause-name "Narrow-Int-Good")]
  [(narrow v int vsu)
   (stuck-t vsu)
   (clause-name "Narrow-Int-Bad")]

  ;; bools narrow to bools
  [(narrow b bool vsu)
   (b vsu)
   (clause-name "Narrow-Bool-Good")]
  [(narrow v bool vsu)
   (stuck-t vsu)
   (clause-name "Narrow-Bool-Bad")]

  ;; and functions to functions
  [(narrow (λ x e) (t_1 -> t_2) vsu)
   ((λ x e) vsu)
   (clause-name "Narrow-Fun-Good")]
  [(narrow v (t_1 -> t_2) vsu)
   (stuck-t vsu)
   (clause-name "Narrow-Fun-Bad")]

  [(narrow (nil @ t) (list t) vsu)
   ((nil @ t) vsu)
   (clause-name "Narrow-Nil-Good")]
  [(narrow v (list t) vsu)
   (stuck-t vsu)
   (clause-name "Narrow-Nil-Bad")]

  [(narrow (cons @ t v_1 v_2) (list t) vsu)
   ((cons @ t v_1 v_2) vsu)
   (side-condition (term (type-compat (type-of v_1) t)))
   (side-condition (term (type-compat (type-of v_2) (list t))))
   (clause-name "Narrow-Cons-Good")]
  [(narrow v (list t) vsu)
   (stuck-t vsu)
   (clause-name "Narrow-Cons-Bad")]
  )

(module+ test
  (test-equal (term (narrow 1 int ())) '(1 ()))
  (test-equal (term (narrow 1 bool ())) '(stuck-t ()))
  (test-equal (term (narrow h bool ((h true)))) '(true ((h true))))
  (test-equal (term (narrow h int ((h true)))) '(stuck-t ((h true))))

  (test-predicate integer? (first (term (narrow h int ()))))
  )

(define -->λh
  (reduction-relation
   λh
   #:domain Config
   
   ;; Plus
   (--> [(in-hole E (v_1 + v_2)) vsu_1]
        [(in-hole E ,(+ (term n_1) (term n_2))) vsu_3]
        (where (n_1 vsu_2) (narrow v_1 int vsu_1))
        (where (n_2 vsu_3) (narrow v_2 int vsu_1))
        "E-Plus-Good")
   (--> [(in-hole E (v_1 + v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 int vsu_1))
        "E-Plus-Bad1")
   (--> [(in-hole E (v_1 + v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_2 int vsu_1))
        "E-Plus-Bad2")

   ;; If
   (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1]
        [(in-hole E e_1) vsu_2]
        (where (true vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good1")
   (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1]
        [(in-hole E e_2) vsu_2]
        (where (false vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good2")
   (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Bad")

   ;; App
   (--> [(in-hole E (v_1 v_2)) vsu_1]
        [(in-hole E (substitute e_1 x_1 v_2)) vsu_2]
        (where ((λ x_1 e_1) vsu_2) (narrow v_1 (a_1 -> a_2) vsu_1))
        (fresh k_1 k_2)
        "E-App-Good")
   (--> [(in-hole E (v_1 v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 (a_1 -> a_2) vsu_1))
        (fresh k_1 k_2)
        "E-App-Bad")

   ;; Cons
   (--> [(in-hole E (cons v_1 v_2)) vsu_1]
        [(in-hole E (cons @ t v_1 v_3)) vsu_2]
        (where t (type-of v_1))
        (where (v_3 vsu_2) (narrow v_2 (list t) vsu_1))
        "E-Cons-Good")
   (--> [(in-hole E (cons v_1 v_2)) vsu_1]
        [stuck-t vsu_2]
        (where t (type-of v_1))
        (where (stuck-t vsu_2) (narrow v_2 (list t) vsu_1))
        "E-Cons-Bad")

   ;; Nil
   (--> [(in-hole E nil) vsu]
        [(in-hole E (nil @ a)) vsu]
        (fresh k))

   ;; Hd
   (--> [(in-hole E (hd v_1)) vsu_1]
        [(in-hole E v_2) vsu_2]
        (where ((cons @ t v_2 v_3) vsu_2) (narrow v_1 (list a) vsu_1))
        (fresh k)
        "E-Hd-Good")
   (--> [(in-hole E (hd v_1)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 (list a) vsu_1))
        (fresh k)
        "E-Hd-Bad1")
   (--> [(in-hole E (hd v_1)) vsu_1]
        [stuck-e vsu_2]
        (where ((nil @ t) vsu_2) (narrow v_1 (list a) vsu_1))
        (fresh k)
        "E-Hd-Bad2")


   ;; Match
   ;; (--> [(in-hole E (match v_1 with (p ...))) vsu_1]
   ;;      [(in-hole E (subst su e)) vsu_2]
   ;;      (where ((v_2 vsu_2) (narrow v_1 (type-of-pattern (p ...)))))
   ;;      (where (e su) (matching-pattern v_2 (p ...)))
   ;;      "E-Match-Good")
   ))

;; (define-metafunction λh
;;   matches-pattern : v ps -> ((x v) ...) or stuck
;;   [(matches-pattern (c vs) ((c xs) : _))
;;    (safe-zip xs vs)]
;;   [(matches-pattern (c_1 vs) ((c_2 xs) : ps))
;;    (matches-pattern (c_1 vs) ps)]
;;   [(matches-pattern (c vs) nil)
;;    stuck-e]
;;   ;; #:mode (matches-pattern? I I O)
;;   ;; #:contract (matches-pattern? )
;;   )

;; (define-metafunction λh
;;   safe-zip : xs vs -> ((x v) ...) or stuck
;;   [(safe-zip nil nil) ()]
;;   [(safe-zip nil _)   stuck-t]
;;   [(safe-zip _   nil) stuck-t]
;;   [(safe-zip (x : xs) (v : vs)) stuck
;;    (where stuck (safe-zip xs vs))]
;;   [(safe-zip (x : xs) (v : vs)) ((x v) (x_1 v_1) ...)
;;    (where ((x_1 v_1) ...) (safe-zip xs vs))])

;; (module+ test
;;   ;; safe-zip
;;   (test-equal (term (safe-zip (x : (y : nil)) (1 : (2 : nil)))) (term ((x 1) (y 2))))
;;   (test-equal (term (safe-zip (x : (y : nil)) (1 : nil)))       (term stuck-t))

;;   ;; matches-pattern
;;   (test-equal (term (matches-pattern (c nil)       ((c nil) : nil)))       (term ()))
;;   (test-equal (term (matches-pattern (c (1 : nil)) ((c nil) : nil)))       (term stuck-t))
;;   (test-equal (term (matches-pattern (c nil)       ((c (x : nil)) : nil))) (term stuck-t))
;;   (test-equal (term (matches-pattern (c nil)       nil))                   (term stuck-e))
;;   )

(module+ test
  ;; E-Plus
  (test--> -->λh (term ((1    + 2   ) ())) (term (3     ())))
  (test--> -->λh (term ((1    + true) ())) (term (stuck-t ())))
  (test--> -->λh (term ((true + 2   ) ())) (term (stuck-t ())))
  ;; E-If
  (test--> -->λh (term ((ite true  1 2) ())) (term (1     ())))
  (test--> -->λh (term ((ite false 1 2) ())) (term (2     ())))
  (test--> -->λh (term ((ite 1     1 2) ())) (term (stuck-t ())))
  ;; E-App
  (test--> -->λh (term (((λ x x) 1) ())) (term (1     ())))
  (test--> -->λh (term ((1       1) ())) (term (stuck-t ()))))

;; value? : expression -> boolean
;; returns true if the input matches
;; the 'v' non-terminal
(define value? (redex-match λh v))

;; single-step? : expression -> boolean
;; returns true if 'e' steps to exactly one term
(define (single-step? e)
  (= (length (apply-reduction-relation -->λh e))
     1))

;; value-or-confluent-step? : term → boolean
(define (value-or-confluent-step? e)
  (or (redex-match λh v e)
      ;; E-Plus-Bad makes -->λh non-deterministic, so we check that the 
      ;; reductions are confluent rather than unique
      (match (apply-reduction-relation -->λh (term (,e ())))
        [(list) #f]
        [(list _) #t]
        [(list x ys ...) (andmap (λ (y) (equal? x y)) ys)])
      ))

(module+ test
  (redex-check λh #:satisfying (closed e nil)
    (value-or-confluent-step? (term e))))

(define-metafunction λh
  eval-value : e -> v or stuck
  [(eval-value e_1) any
   (where (any _) ,(first (apply-reduction-relation* -->λh
                            (term (e_1 ())))))])

(define-judgment-form λh
  #:mode (gets-stuck-t? I)
  #:contract (gets-stuck-t? e)
  [(gets-stuck-t? e) (where stuck-t (eval-value e))])

(module+ test
  ;;(test-equal (judgment-holds (gets-stuck-t? stuck-t)) #t)
  ;; (test-equal (first (apply-reduction-relation* -->λh (term (stuck-t ()))))
  ;;             (term (stuck-t ())))
  (test-equal (judgment-holds (gets-stuck-t? (1 + true))) #t)
  (test-equal (judgment-holds (gets-stuck-t? (1 + 2))) #f))

(define-judgment-form λh
  #:mode (closed I I)
  #:contract (closed e xs)

  [(elem x xs)
   -----------
   (closed x xs)]

  [---------------------------
   (closed n xs)]

  [---------------------------
   (closed b xs)]

  ;; [---------------------------
  ;;  (closed h xs)]

  [(closed e (x : xs))
   ---------------------------
   (closed (λ x e) xs)]

  [(closed e_1 xs) (closed e_2 xs)
   ---------------------------
   (closed (e_1 e_2) xs)]

  [(closed e_1 xs) (closed e_2 xs)
   ---------------------------
   (closed (e_1 + e_2) xs)]

  [(closed e_1 xs) (closed e_2 xs) (closed e_3 xs)
   ---------------------------
   (closed (ite e_1 e_2 e_3) xs)]

  [---------------------------
   (closed nil xs)]

  [(closed e_1 xs) (closed e_2 xs)
   ---------------------------
   (closed (cons e_1 e_2) xs)]

  [(closed e xs)
   ---------------------------
   (closed (hd e) xs)])

(define-judgment-form λh
  #:mode (used I I)
  #:contract (used e xs)

  [(elem x xs)
   -----------
   (used x xs)]

  ;; [---------------------------
  ;;  (used n (x ...))]

  ;; [---------------------------
  ;;  (used b (x ...))]

  ;; [---------------------------
  ;;  (closed h (x ...))]

  [(used e (x : xs))
   ---------------------------
   (used (λ x e) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (e_1 e_2) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (e_1 e_2) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (e_1 + e_2) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (e_1 + e_2) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (ite e_1 e_2 e_3) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (ite e_1 e_2 e_3) xs)]
  [(used e_3 xs)
   ---------------------------
   (used (ite e_1 e_2 e_3) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (cons e_1 e_2) xs)]

  [(used e_2 xs)
   ---------------------------
   (used (cons e_1 e_2) xs)]

  [(used e xs)
   ---------------------------
   (used (hd e) xs)])

(define-judgment-form λh
  #:mode (closed-used I I)
  #:contract (closed-used e xs)

  [(closed e xs) (used e xs)
   ---------------------------
   (closed-used e xs)])


(module+ test
  ;; Generality
  (let ([cr (make-coverage -->λh)]
        [cn (make-coverage narrow)]
        [cg (make-coverage gen)]
        ; [gen-value (generate-term λh v)]
        )
    (parameterize ([relation-coverage (list cr cn cg)])
      (redex-check λh
                   ;((λ x e) v)
                   ;(λ x e)
                   #:satisfying (closed-used e (x : nil))
                   ; #:in-order
                   (begin
                     ;;(printf "checking ~s\n" (term (λ x e)))
                     (implies (and ; (judgment-holds (closed e (x)))
                                   ; (judgment-holds (closed v ()))
                                   (judgment-holds (gets-stuck-t? ((λ x e) h))))
                              ;; (judgment-holds (gets-stuck-t? ((λ x e) 0)))
                              (and 
                               (ormap (λ (i)
                                        (judgment-holds (gets-stuck-t? ((λ x e)
                                                                      ,(generate-term λh n #:i-th i)))))
                                      (range 10))
                               (or
                                (judgment-holds (gets-stuck-t? ((λ x e) true)))
                                (judgment-holds (gets-stuck-t? ((λ x e) false))))
                               (ormap (λ (i)
                                        (judgment-holds (gets-stuck-t? ((λ x e)
                                                                      ,(generate-term λh (λ x e) #:i-th i)))))
                                      (range 10))
                              ))
                   ; #:source -->λh
                   ))
      ;; (values (covered-cases cr)
      ;;         (covered-cases cn)
      ;;         (covered-cases cg))
      (covered-cases cr)
      ))
    ;; #:satisfying (gets-stuck-t? ((λ x e)) h)
    ;; (judgment-holds
    ;;  (gets-stuck-t? ((λ x e) v))))
)

(module+ test
  (test-results))
