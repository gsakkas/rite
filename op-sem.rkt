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
     ;(fix e)
     (c es)
     (match e with ps)
     )
  ;; stuck terms
  (stuck stuck-t ;; stuck due to a (dynamic) type error
         stuck-e ;; stuck due to some other error (e.g. div-zero)
         )
  ;; values
  (v n b (λ x e) (v-box k) (c vs))
  (n number)
  (b true false)
  ;; types
  (t int bool (t -> t) (t-box k))
  ;; variables
  (x variable-not-otherwise-mentioned)
  ;; value substitutions
  (vsu ((k_!_ v) ...))
  (k variable-not-otherwise-mentioned)

  ;; constructors
  (c variable-not-otherwise-mentioned)

  ;; patterns
  (p (c xs -> e))

  ;; evaluation contexts
  (C (C e)
     (v C)
     (C + e)
     (v + C)
     (ite C e e)
     (c C)
     (C : es)
     (v : C)
     hole)

  ;; type contexts
  (T (T -> t) (t -> T) hole)

  ;; lists, ugh..
  (xs nil (x : xs))
  (es nil (e : es))
  (vs nil (v : vs))
  (ps nil (p : ps))

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
  narrow : e t vsu -> (v vsu) or (stuck-t vsu)
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
   (stuck-t vsu)
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
   (clause-name "Narrow-Fun-Bad")])

(module+ test
  (test-equal (term (narrow 1 int ())) '(1 ()))
  (test-equal (term (narrow 1 bool ())) '(stuck-t ()))
  (test-equal (term (narrow (v-box k) bool ((k true)))) '(true ((k true))))
  (test-equal (term (narrow (v-box k) int ((k true)))) '(stuck-t ((k true))))

  (test-predicate integer? (first (term (narrow (v-box k) int ()))))
  )

(define -->λh
  (reduction-relation
   λh
   #:domain Config
   
   ;; Plus
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [(in-hole C ,(+ (term n_1) (term n_2))) vsu_3]
        (where (n_1 vsu_2) (narrow v_1 int vsu_1))
        (where (n_2 vsu_3) (narrow v_2 int vsu_1))
        "E-Plus-Good")
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 int vsu_1))
        "E-Plus-Bad1")
   (--> [(in-hole C (v_1 + v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_2 int vsu_1))
        "E-Plus-Bad2")

   ;; If
   (--> [(in-hole C (ite v_1 e_1 e_2)) vsu_1]
        [(in-hole C e_1) vsu_2]
        (where (true vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good1")
   (--> [(in-hole C (ite v_1 e_1 e_2)) vsu_1]
        [(in-hole C e_2) vsu_2]
        (where (false vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Good2")
   (--> [(in-hole C (ite v_1 e_1 e_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 bool vsu_1))
        "E-If-Bad")

   ;; App
   (--> [(in-hole C (v_1 v_2)) vsu_1]
        [(in-hole C (substitute e_1 x_1 v_2)) vsu_2]
        (where ((λ x_1 e_1) vsu_2) (narrow v_1 ((t-box k_1) -> (t-box k_2)) vsu_1))
        (fresh k_1 k_2)
        "E-App-Good")
   (--> [(in-hole C (v_1 v_2)) vsu_1]
        [stuck-t vsu_2]
        (where (stuck-t vsu_2) (narrow v_1 ((t-box k_1) -> (t-box k_2)) vsu_1))
        (fresh k_1 k_2)
        "E-App-Bad")

   ;; Match
   ;; (--> [(in-hole C (match v_1 with (p ...))) vsu_1]
   ;;      [(in-hole C (subst su e)) vsu_2]
   ;;      (where ((v_2 vsu_2) (narrow v_1 (type-of-pattern (p ...)))))
   ;;      (where (e su) (matching-pattern v_2 (p ...))))
   ))

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
   (closed (ite e_1 e_2 e_3) xs)])

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
   (used (ite e_1 e_2 e_3) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (ite e_1 e_2 e_3) xs)]
  [(used e_3 xs)
   ---------------------------
   (used (ite e_1 e_2 e_3) xs)]
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
                     ;;(printf "checking ~s\n" (term (λ x e)))
                     (implies (and ; (judgment-holds (closed e (x)))
                                   ; (judgment-holds (closed v ()))
                                   (judgment-holds (gets-stuck-t? ((λ x e) (v-box k)))))
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
    ;; #:satisfying (gets-stuck-t? ((λ x e)) (v-box k))
    ;; (judgment-holds
    ;;  (gets-stuck-t? ((λ x e) v))))
)

(module+ test
  (test-results))
