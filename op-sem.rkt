#lang racket
(require redex)
(require racket/list)

(define-language λh
  ;; expressions
  (e v
     x
     (e e)
     (e + e)
     (if e then e else e)
     ;(fix e)
     )
  ;; values
  (v n b (λ x e) (v-box k) stuck)
  (n number)
  (b true false)
  ;; types
  (t int bool (t -> t) (t-box k))
  ;; variables
  (x variable-not-otherwise-mentioned)
  ;; value substitutions
  (vsu ((k_!_ v) ...))
  (k variable-not-otherwise-mentioned)

  ;; evaluation contexts
  (C (C e)
     (v C)
     (C + e)
     (v + C)
     (if C then e else e)
     hole)

  ;; type contexts
  (T (T -> t) (t -> T) hole)

  ;; lists, ugh..
  (xs nil (x : xs))
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

(define-metafunction λh
  Σ : number ... -> number
  [(Σ number ...)
   ,(apply + (term (number ...)))])

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
  vsu-lookup : vsu k -> any
  [(vsu-lookup vsu k)
   ,(let ((v (assq (term k) (term vsu))))
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


(require redex/tut-subst)
(define-metafunction λh
  subst : x v e -> e
  [(subst x v e)
   ,(subst/proc x? (list (term x)) (list (term v)) (term e))])
(define x? (redex-match λh x))


(define-metafunction λh
  type-of : v -> t
  [(type-of n) int]
  [(type-of b) bool]
  [(type-of (λ x e)) ((t-box k_1) -> (type-of e))] ;; fresh k?
  [(type-of e) (t-box k_2)] ;; fresh k?
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
  [(gen (t_1 -> t_2))
                      ;; how to say fresh k?
   ,(generate-term λh (λ x (v-box k)) 5)
   (clause-name "Gen-Fun")]
  [(gen (t-box x_1))
                      ;; how to say fresh k?
   ,(generate-term λh (v-box k) 5)
   (clause-name "Gen-Hole")])

(define-metafunction λh
  narrow : e t vsu -> (e vsu)
  ;; any value narrows to a type-hole
  [(narrow v (t-box k) vsu)
   (v vsu)
   (clause-name "Narrow-Type-Hole")]
  
  ;; a value-hole that is in the vsu narrows to the same value
  [(narrow (v-box k) t vsu)
   (v vsu)
   (where v (vsu-lookup vsu k))
   (side-condition (term v))
   ;; provided that the narrowing type matches (thanks redex!)
   (side-condition (equal? (term (type-of v)) (term t)))
   (clause-name "Narrow-Hole-Known-Good")]
  ;; otherwise we're stuck
  [(narrow (v-box k) t vsu)
   (stuck vsu)
   (where v (vsu-lookup vsu k))
   (side-condition (term v))
   (clause-name "Narrow-Hole-Known-Bad")]
  
  ;; a value-hole narrows to a random value of the given type
  [(narrow (v-box k) t vsu)
   (v (vsu-extend vsu (k v)))
   (where v (gen t))
   (clause-name "Narrow-Hole-Good")]

  ;; ints narrow to int
  [(narrow n int vsu)
   (n vsu)
   (clause-name "Narrow-Int-Good")]
  [(narrow v int vsu)
   (stuck vsu)
   (clause-name "Narrow-Int-Bad")]

  ;; bools narrow to bools
  [(narrow b bool vsu)
   (b vsu)
   (clause-name "Narrow-Bool-Good")]
  [(narrow v bool vsu)
   (stuck vsu)
   (clause-name "Narrow-Bool-Bad")]

  ;; and functions to functions
  [(narrow (λ x e) (t_1 -> t_2) vsu)
   ((λ x e) vsu)
   (clause-name "Narrow-Fun-Good")]
  [(narrow v (t_1 -> t_2) vsu)
   (stuck vsu)
   (clause-name "Narrow-Fun-Bad")])

(module+ test
  (test-equal (term (narrow 1 int ())) '(1 ()))
  (test-equal (term (narrow 1 bool ())) '(stuck ()))
  (test-equal (term (narrow (v-box k) bool ((k true)))) '(true ((k true))))
  (test-equal (term (narrow (v-box k) int ((k true)))) '(stuck ((k true))))

  (test-predicate integer? (first (term (narrow (v-box k) int ()))))
  )

(define -->λh
  (reduction-relation
   λh
   #:domain (e vsu)
   
   ;; Plus
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [(in-hole C ,(+ (term n_1) (term n_2))) vsu_3]
        (where (n_1 vsu_2) (narrow v_1 int vsu_1))
        (where (n_2 vsu_3) (narrow v_2 int vsu_2))
        "E-Plus-Good")
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [(in-hole C stuck) vsu_2]
        (where (stuck vsu_2) (narrow v_1 int vsu_1))
        "E-Plus-Bad1")
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [(in-hole C stuck) vsu_2]
        (where (stuck vsu_2) (narrow v_2 int vsu_1))
        "E-Plus-Bad2")

   ;; If
   (--> [(in-hole C (if v_1 then e_1 else e_2)) vsu_1]
        [(in-hole C e_1) vsu_2]
        (where (true vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good1")
   (--> [(in-hole C (if v_1 then e_1 else e_2)) vsu_1]
        [(in-hole C e_2) vsu_2]
        (where (false vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good2")
   (--> [(in-hole C (if v_1 then e_1 else e_2)) vsu_1]
        [(in-hole C stuck) vsu_2]
        (where (stuck vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Bad")

   ;; App
   (--> [(in-hole C (v_1 v_2)) vsu_1]
        [(in-hole C (subst x_1 v_2 e_1)) vsu_2]
        (where ((λ x_1 e_1) vsu_2) (narrow v_1 ((t-box k_1) -> (t-box k_2)) vsu_1))
        (fresh k_1 k_2)
        "E-App-Good")
   (--> [(in-hole C (v_1 v_2)) vsu_1]
        [(in-hole C stuck) vsu_2]
        (where (stuck vsu_2) (narrow v_1 ((t-box k_1) -> (t-box k_2)) vsu_1))
        (fresh k_1 k_2)
        "E-App-Bad")))

(module+ test
  ;; E-Plus
  (test--> -->λh (term ((1    + 2   ) ())) (term (3     ())))
  (test--> -->λh (term ((1    + true) ())) (term (stuck ())))
  (test--> -->λh (term ((true + 2   ) ())) (term (stuck ())))
  ;; E-If
  (test--> -->λh (term ((if true  then 1 else 2) ())) (term (1     ())))
  (test--> -->λh (term ((if false then 1 else 2) ())) (term (2     ())))
  (test--> -->λh (term ((if 1     then 1 else 2) ())) (term (stuck ())))
  ;; E-App
  (test--> -->λh (term (((λ x x) 1) ())) (term (1     ())))
  (test--> -->λh (term ((1       1) ())) (term (stuck ()))))


(define-metafunction λh
  eval-value : e -> v
  [(eval-value e) v (where (v _) ,(first (apply-reduction-relation* -->λh (term (e ())))))])

(define-judgment-form λh
  #:mode (gets-stuck? I)
  #:contract (gets-stuck? e)
  [(gets-stuck? e) (where stuck (eval-value e))])

(module+ test
  (test-equal (judgment-holds (gets-stuck? stuck)) #t)
  ;; (test-equal (first (apply-reduction-relation* -->λh (term (stuck ()))))
  ;;             (term (stuck ())))
  (test-equal (judgment-holds (gets-stuck? (1 + true))) #t))

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
  ;;  (closed (v-box k) xs)]

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
   (closed (if e_1 then e_2 else e_3) xs)])

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
  ;;  (closed (v-box k) (x ...))]

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
   (used (if e_1 then e_2 else e_3) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (if e_1 then e_2 else e_3) xs)]
  [(used e_3 xs)
   ---------------------------
   (used (if e_1 then e_2 else e_3) xs)]
)

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
                     (printf "checking ~s\n" (term (λ x e)))
                     (implies (and ; (judgment-holds (closed e (x)))
                                   ; (judgment-holds (closed v ()))
                                   (judgment-holds (gets-stuck? ((λ x e) (v-box k)))))
                              (judgment-holds (gets-stuck? ((λ x e) 0)))
                              ;; (andmap (λ (i)
                              ;;           (judgment-holds (gets-stuck? ((λ x e) 
                              ;;                                         ,(generate-term λh v #:i-th i)))))
                              ;;         (range 1000))
                              ))
                   ; #:source -->λh
                   )
      (values (covered-cases cr)
              (covered-cases cn)
              (covered-cases cg))
      ;;(covered-cases cr)
      ))
    ;; #:satisfying (gets-stuck? ((λ x e)) (v-box k))
    ;; (judgment-holds
    ;;  (gets-stuck? ((λ x e) v))))
)

(module+ test
  (test-results))
