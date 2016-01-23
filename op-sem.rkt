#lang racket
(require redex)

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
     hole))

(define-metafunction λh
  Σ : number ... -> number
  [(Σ number ...)
   ,(apply + (term (number ...)))])

;; stolen from david van horn's redex-aam-tutorial
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
  [(type-of (v-box k_1)) (t-box k_2)] ;; fresh n?
  [(type-of (λ x e)) ((t-box k_1) -> (t-box k_2))])
  

(define-metafunction λh
  gen : t -> v
  [(gen int)
   ,(generate-term λh n 5)]
  [(gen bool)
   ,(generate-term λh b 5)]
  [(gen (t_1 -> t_2))
                      ;; how to say fresh k?
   ,(generate-term λh (λ x (v-box k)) 5)]
  [(gen (t-box x_1))
                      ;; how to say fresh k?
   ,(generate-term λh (v-box k) 5)])

(define-metafunction λh
  narrow : e t vsu -> (e vsu)
  ;; any value narrows to a type-hole
  [(narrow v (t-box k) vsu)
   (v vsu)]
  
  ;; a value-hole that is in the vsu narrows to the same value
  [(narrow (v-box k) t vsu)
   (v vsu)
   (where v (vsu-lookup vsu k))
   (side-condition (term v))
   ;; provided that the narrowing type matches (thanks redex!)
   (side-condition (equal? (term (type-of v)) (term t)))]
  ;; otherwise we're stuck
  [(narrow (v-box k) t vsu)
   (stuck vsu)
   (where v (vsu-lookup vsu k))
   (side-condition (term v))]
  
  ;; a value-hole narrows to a random value of the given type
  [(narrow (v-box k) t vsu)
   (v (vsu-extend vsu (k v)))
   (where v (gen t))]

  ;; ints narrow to int
  [(narrow n int vsu)
   (n vsu)]
  [(narrow v int vsu)
   (stuck vsu)]

  ;; bools narrow to bools
  [(narrow b bool vsu)
   (b vsu)]
  [(narrow v bool vsu)
   (stuck vsu)]

  ;; and functions to functions
  [(narrow (λ x e) (t_1 -> t_2) vsu)
   ((λ x e) vsu)]
  [(narrow v (t_1 -> t_2) vsu)
   (stuck vsu)])

(module+ test
  (test-equal (term (narrow 1 int ())) '(1 ()))
  (test-equal (term (narrow 1 bool ())) '(stuck ()))
  (test-equal (integer? (first (term (narrow (v-box k) int ())))) #true)
  (test-equal (term (narrow (v-box k) bool ((k true)))) '(true ((k true))))
  (test-equal (term (narrow (v-box k) int ((k true)))) '(stuck ((k true)))))

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

(module+ test
  (test-results))
