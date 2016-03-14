#lang racket
(require redex)
(require racket/list)

;; gen is non-deterministic, so turn off redex's caching
(caching-enabled? #f)
(check-redundancy #t)

;; (current-traced-metafunctions '(gen narrow apply-su))

(define-language λh
  ;; configurations (for the reduction relation)
  (Config (e vsu tsu) (stuck vsu tsu))

  ;; expressions
  (e v ;; n b (λ x e) ;; same as values
     x
     h
     (e e)
     (e + e)
     (ite e e e)
     (node e e e)
     leaf
     (case e of (leaf -> e) (node x x x -> e))
     ;; (get-val e)
     ;; (get-left e)
     ;; (get-right e)

     (pair e e)
     (case e of (pair x x -> e))
     ;; (fst e)
     ;; (snd e)
     ;; (inl e)
     ;; (inr e)
     ;; (getl e)
     ;; (getr e)

     ;(fix e)
     ;; (c es)
     ;; (match e with alts)
     )
  ;; stuck terms
  (stuck stuck-t ;; stuck due to a (dynamic) type error
         stuck-e ;; stuck due to some other error (e.g. div-zero)
         )
  ;; values
  (v n b (λ x e) (h @ t)
     (node @ t v v v) (leaf @ t) ;; `t` is the *element* type
     (pair v v)
     ;; (pair (@ t t) v v) (inl @ t v) (inr @ t v)
     ;;(c vs)
     )
  (n integer)
  (b true false)
  ;; types
  (t int bool fun a
     (tree t)
     (t * t)
     ;; (t + t)
     )
  (t-gen int bool
     (tree t-gen)
     )
  ;; variables
  (x (variable-prefix x))
  ;; value substitutions
  (vsu ((h_!_ v) ...))
  ;; type substitutions
  (tsu ((a_!_ t) ...))
  (h (variable-prefix h_))
  (a (variable-prefix a))

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
     (pair E e)
     (pair v E)
     (case E of (pair x x -> e))
     (node E e e)
     (node v E e)
     (node v v E)
     (case E of (leaf -> e) (node x x x -> e))

     ;; (pair E e)
     ;; (pair v E)
     ;; (inl E)
     ;; (inr E)

     ;; (c E)
     ;; (E : es)
     ;; (v : E)
     hole)

  ;; type contexts
  ;; (T (T -> t) (t -> T) hole)

  ;; lists, ugh..
  (xs nil (x : xs))
  ;; (es nil (e : es))
  ;; (vs nil (v : vs))
  ;; (ps nil (p : ps))
  ;; (alts nil (alt : alts))

  #:binding-forms
  (λ x e #:refers-to x)
  (case e_1 of
        (leaf -> e_2)
        (node x_1 x_2 x_3 -> e_3 #:refers-to (shadow x_1 x_2 x_3)))
  (case e_1 of
        (pair x_1 x_2 -> e_2 #:refers-to (shadow x_1 x_2)))
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
;; (define-language REDEX)
;; (define-judgment-form REDEX
;;     #:mode (lookup I I O)
;;     #:contract (lookup ((any any) ...) any any)
;;     [(lookup (_ ... (any any_0) _ ...) any any_0)])
;(define-judgment-form λh
;    #:mode (vsu-lookup I I O)
;    #:contract (vsu-lookup ((any any) ...) any any)
;    [(vsu-lookup (_ ... (any any_0) _ ...) any any_0)])
(define-metafunction λh
  lookup : ((any any) ...) any -> any
  [(lookup any_1 any_2)
   ,(let ((v (assq (term any_2) (term any_1))))
      (if v (term ,(second v)) v))])
(define-metafunction λh
    ext1 : ((any any) ...) (any any) -> ((any any) ...)
    [(ext1 (any_0 ... (any_k any_v0) any_1 ...) (any_k any_v1))
     (any_0 ... (any_k any_v1) any_1 ...)]
    [(ext1 (any_0 ...) (any_k any_v1))
     ((any_k any_v1) any_0 ...)])
(define-metafunction λh
    extend : ((any any) ...) (any any) ... -> ((any any) ...)
    [(extend any) any]
    [(extend any any_0 any_1 ...)
     (ext1 (extend any any_1 ...) any_0)])


(define-judgment-form λh
  #:mode (type-of I O)
  #:contract (type-of v t)
  ;; type-of : v -> t
  [(type-of n int)]
  [(type-of b bool)]

  [(type-of v_1 t_1) (type-of v_2 t_2)
   ----------------------------------------
   (type-of (pair v_1 v_2) (t_1 * t_2))]

  [(type-of (leaf @ t) (tree t))]
  [(type-of v_1 t) (type-of v_2 (tree t)) (type-of v_3 (tree t))
   -------------------------------------
   (type-of (node @ t v_1 v_2 v_3) (tree t))]

  ;; [(type-of (pair (@ t_1 t_2) _ _) (t_1 * t_2))]
  ;; [(type-of (inl (@ t_1 t_2) _) (t_1 + t_2))]
  ;; [(type-of (inr (@ t_1 t_2) _) (t_1 + t_2))]

  [(type-of (λ x e) fun)]

  [(type-of (h @ t) t)]
  ;; [(type-of h a)
  ;;  (where a ,(generate-term λh a 5))]
  )

(define-judgment-form λh
  #:mode (type-of-gen I O)
  #:contract (type-of-gen v t-gen)
  ;; type-of-gen : v -> t
  [(type-of-gen n int)]
  [(type-of-gen b bool)]
  [(type-of-gen v_1 t_1) (type-of-gen v_2 t_2)
   ----------------------------------------
   (type-of-gen (pair v_1 v_2) (t_1 * t_2))]
  [(type-of-gen (leaf @ t-gen) (tree t-gen))]
  [(type-of-gen v_1 t-gen) (type-of-gen v_2 (tree t-gen)) (type-of-gen v_3 (tree t-gen))
   -------------------------------------
   (type-of-gen (node @ t-gen v_1 v_2 v_3) (tree t-gen))]

  ;; [(type-of-gen (pair (@ t-gen_1 t-gen_2) _ _) (t-gen_1 * t-gen_2))]
  ;; [(type-of-gen (inl (@ t-gen_1 t-gen_2) _) (t-gen_1 + t-gen_2))]
  ;; [(type-of-gen (inr (@ t-gen_1 t-gen_2) _) (t-gen_1 + t-gen_2))]
  )

(define-judgment-form λh
  #:mode (wf-tree I I)
  #:contract (wf-tree v t-gen)
  [----------------
   (wf-tree (leaf @ t) t)]
  [(type-of-gen v_1 t) (wf-tree v_2 t) (wf-tree v_3 t)
   ----------------------------------------------
   (wf-tree (node @ t v_1 v_2 v_3) t)]
  )

(define-metafunction λh
  type-compat-1 : t t tsu -> tsu or #f
  ;; #:mode (type-compat-1 I I I O)
  ;; #:contract (type-compat-1 t t tsu tsu)
  [(type-compat-1 t t tsu) tsu]
  [(type-compat-1 a t tsu)
   (type-compat-var a t tsu)]
  [(type-compat-1 t a tsu)
   (type-compat-var a t tsu)]
  [(type-compat-1 (tree t_1) (tree t_2) tsu_1) tsu_2
   (where tsu_2 (type-compat-1 t_1 t_2 tsu_1))]
  [(type-compat-1 (t_11 * t_12) (t_21 * t_22) tsu_1) tsu_3
   (where tsu_2 (type-compat-1 t_11 t_21 tsu_1))
   (side-condition (term tsu_2))
   (where tsu_3 (type-compat-1 t_12 t_22 tsu_2))]
  [(type-compat-1 t_1 t_2 tsu) #f])

(define-metafunction λh
  type-compat-var : a t tsu -> tsu or #f

  ;; apply substitution
  [(type-compat-var a t tsu)
   (type-compat-1 t_1 t tsu)
   (where t_1 (lookup tsu a))
   (side-condition/hidden (term t_1))]

  ;; occurs check
  [(type-compat-var a t tsu)
   #f
   (side-condition (memq (term a) (term (ty-vars-of t))))]

  ;; otherwise extend substitution
  [(type-compat-var a t tsu) tsu_1
   (where tsu_1 (extend tsu (a t)))])

(define-metafunction λh
  ty-vars-of : t -> (a ...)
  [(ty-vars-of a) (a)]
  [(ty-vars-of (tree t)) (ty-vars-of t)]
  [(ty-vars-of (t_1 * t_2)) ,(append (term (ty-vars-of t_1)) (term (ty-vars-of t_2)))]
  [(ty-vars-of t) ()])

(define-metafunction λh
  apply-su : tsu t -> t
  [(apply-su tsu a)
   (apply-su tsu t)
   (where t (lookup tsu a))
   (side-condition/hidden (term t))]
  [(apply-su tsu t)
   t])

(module+ test
  (test-equal (term (type-compat-1 int int  ())) (term ()))
  (test-equal (term (type-compat-1 int bool ())) (term #f))
  (test-equal (term (type-compat-1 a   a    ())) (term ()))
  (test-equal (term (type-compat-1 a   bool ())) (term ((a bool))))
  (test-equal (term (type-compat-1 int a    ())) (term ((a int))))
  (test-equal (term (type-compat-1 a_1 a_2  ())) (term ((a_1 a_2))))

  (test-equal (term (type-compat-1 (tree a)   (tree a)   ())) (term ()))
  (test-equal (term (type-compat-1 (tree a_1) (tree a_2) ())) (term ((a_1 a_2))))
  (test-equal (term (type-compat-1 (tree a)   (tree int) ())) (term ((a int))))
  (test-equal (term (type-compat-1 (tree int) (tree a)   ())) (term ((a int))))

  (test-equal (term (type-compat-1 (tree a)   a          ())) (term #f))

  (test-equal (term (type-compat-1 (int * bool) (int * bool) ())) (term ()))
  (test-equal (term (type-compat-1 (int * bool) (int * int) ())) (term #f))
  (test-equal (term (type-compat-1 (int * bool) (int * a) ())) (term ((a bool))))
  )

(define-metafunction λh
  gen : t -> v
  [(gen int)
   ,(generate-term λh n 5)
   (clause-name "Gen-Int")]
  [(gen bool)
   ,(generate-term λh b 5)
   (clause-name "Gen-Bool")]
  [(gen (t_1 * t_2))
   (pair v_1 v_2)
   (where v_1 (gen t_1))
   (where v_2 (gen t_2))]
  [(gen (tree int))
   ,(second (generate-term λh #:satisfying (wf-tree v int) 3))
   (clause-name "Gen-Tree-Int")]
  [(gen (tree bool))
   ,(second (generate-term λh #:satisfying (wf-tree v bool) 3))
   (clause-name "Gen-Tree-Bool")]
  [(gen (tree a))
   (node @ a v (leaf @ a) (leaf @ a))
   (where v (gen a))
   (clause-name "Gen-Tree-Hole")]
  [(gen (tree t))
   ;; FIXME: how can i refer to the `t` bound by `tree t`?
   ;; ,(second (eval `(generate-term λh #:satisfying (wf-tree v t) 5)))
   (leaf @ t)
   (clause-name "Gen-Tree-T")]
  ;; [(gen (list t))
  ;;  ,(second (generate-term λh #:satisfying (wf-list v t) 5))
  ;;  (clause-name "Gen-List")]
  ;; [(gen (t_1 * t_2))
  ;;  (pair (@ t_1 t_2) v_1 v_2)
  ;;  (where v_1 (gen t_1))
  ;;  (where v_2 (gen t_2))
  ;;  (clause-name "Gen-Pair")]
  [(gen fun)
   ;; how to say fresh h?
   ,(generate-term λh (λ x h) 5)
   (clause-name "Gen-Fun")]
  [(gen a)
   (h @ a)
   ;; how to say fresh h?
   (where h ,(generate-term λh h 5))
   (clause-name "Gen-Hole")])

(define-metafunction λh
  narrow : v t vsu tsu -> (v vsu tsu) or (stuck-t vsu tsu)
  ;; any value narrows to a type-hole
  [(narrow v a vsu tsu)
   (v vsu tsu_1)
   (judgment-holds (type-of v t))
   (where tsu_1 (extend tsu (a t)))
   (clause-name "Narrow-Type-Hole")]
  
  ;; a value-hole that is in the vsu narrows to the same value
  [(narrow (h @ t_1) t_2 vsu tsu)
   (v vsu tsu_2)
   (where v (lookup vsu h))
   (side-condition/hidden (term v))
   ;; provided that the narrowing type matches (thanks redex!)
   (where tsu_1 (type-compat-1 t_1 t_2 tsu))
   (judgment-holds (type-of v t_v))
   (where t_11 (apply-su tsu_1 t_1))
   (where tsu_2 (type-compat-1 t_11 t_v tsu_1))
   (clause-name "Narrow-Hole-Known-Good")]
  ;; otherwise we're stuck
  [(narrow (h @ t_1) t_2 vsu tsu)
   (stuck-t vsu tsu)
   (where v (lookup vsu h))
   (side-condition/hidden (term v))
   (clause-name "Narrow-Hole-Known-Bad")]
  ;; a value-hole narrows to a random value of the given type
  [(narrow (h @ t_1) t_2 vsu tsu)
   (v (extend vsu (h v)) tsu_1)
   (where tsu_1 (type-compat-1 t_1 t_2 tsu))
   (where t_3 (apply-su tsu_1 t_1))
   (where v (gen t_3))
   (clause-name "Narrow-Hole-Good")]

  ;; ints narrow to int
  [(narrow n int vsu tsu)
   (n vsu tsu)
   (clause-name "Narrow-Int-Good")]
  ;; [(narrow v int vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Int-Bad")]

  ;; bools narrow to bools
  [(narrow b bool vsu tsu)
   (b vsu tsu)
   (clause-name "Narrow-Bool-Good")]
  ;; [(narrow v bool vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Bool-Bad")]

  ;; and functions to functions
  [(narrow (λ x e) fun vsu tsu)
   ((λ x e) vsu tsu)
   (clause-name "Narrow-Fun-Good")]
  ;; [(narrow v fun vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Fun-Bad")]

  [(narrow (leaf @ t_1) (tree t_2) vsu tsu)
   ((leaf @ t_1) vsu tsu_1)
   ;; FIXME: apply resulting su
   (where tsu_1 (type-compat-1 t_1 t_2 tsu))
   (side-condition/hidden (term tsu_1))
   (clause-name "Narrow-Leaf-Good")]
  ;; [(narrow v (list t) vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Nil-Bad")]
  [(narrow (node @ t_1 v_1 v_2 v_3) (tree t_2) vsu tsu)
   ((node @ t_1 v_1 v_2 v_3) vsu tsu_1)
   ;; FIXME: apply resulting su
   (where tsu_1 (type-compat-1 t_1 t_2 tsu))
   (side-condition/hidden (term tsu_1))
   (clause-name "Narrow-Node-Good")]
  ;; [(narrow v (tree t) vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Tree-Bad")]

  [(narrow (pair v_1 v_2) (t_1 * t_2) vsu tsu)
   ((pair v_1 v_2) vsu tsu_2)
   (judgment-holds (type-of v_1 t_v_1))
   (where tsu_1 (type-compat-1 t_v_1 t_1 tsu))
   (side-condition/hidden (term tsu_1))
   (judgment-holds (type-of v_2 t_v_2))
   (where tsu_2 (type-compat-1 t_v_2 t_2 tsu_1))
   (side-condition/hidden (term tsu_2))
   (clause-name "Narrow-Pair-Good")]

  [(narrow v t vsu tsu)
   (stuck-t vsu tsu)
   (clause-name "Narrow-Bad")]

  ;; [(narrow (pair (@ t_1 t_2) v_1 v_2) (t_3 * t_4) vsu)
  ;;  (pair (@ t_1 t_2) v_1 v_2)
  ;;  (side-condition (term (type-compat t_1 t_3)))
  ;;  (side-condition (term (type-compat t_2 t_4)))
  ;;  (clause-name "Narrow-Pair-Good")]
  ;; [(narrow v (t_1 * t_2) vsu)
  ;;  (stuck-t vsu)
  ;;  (clause-name "Narrow-Pair-Bad")]

  )

(module+ test
  (test-equal (term (narrow 1 int () ()))
              '(1 () ()))
  (test-equal (term (narrow 1 bool () ()))
              '(stuck-t () ()))
  (test-equal (term (narrow (h_0 @ a) bool ((h_0 true)) ()))
              '(true ((h_0 true)) ((a bool))))
  (test-equal (term (narrow (h_0 @ a) int ((h_0 true)) ()))
              '(stuck-t ((h_0 true)) ()))

  (test-equal (term (narrow (leaf @ int) (tree int) () ()))
              '((leaf @ int) () ()))
  (test-equal (term (narrow (leaf @ int) (tree bool) () ()))
              '(stuck-t () ()))
  (test-equal (term (narrow (node @ int 1 (leaf @ int) (leaf @ int))
                            (tree int) () ()))
              '((node @ int 1 (leaf @ int) (leaf @ int)) () ()))
  (test-equal (term (narrow (node @ int 1 (leaf @ int) (leaf @ int))
                            (tree bool) () ()))
              '(stuck-t () ()))

  (test-equal (term (narrow 1 a () ()))
              '(1 () ((a int))))
  (test-equal (term (narrow (leaf @ a_1) a_2 () ()))
              '((leaf @ a_1) () ((a_2 (tree a_1)))))

  (test-equal (term (narrow (pair 1 true) (int * bool) () ()))
              '((pair 1 true) () ()))
  (test-equal (term (narrow (pair 1 true) (int * int) () ()))
              '(stuck-t () ()))
  (test-equal (term (narrow (pair 1 (leaf @ int)) (int * (tree a)) () ()))
              '((pair 1 (leaf @ int)) () ((a int))))

  (test-predicate integer? (first (term (narrow (h_0 @ a) int () ()))))
  )

(define-metafunction λh
  choose-branch : b e e -> e
  [(choose-branch true e_1 e_2) e_1]
  [(choose-branch false e_1 e_2) e_2])

(define-metafunction λh
  choose-alt : v e x x x e -> e
  [(choose-alt (leaf @ _) e_1 _ _ _ _)
   e_1]
  [(choose-alt (node @ _ v_1 v_2 v_3) _ x_1 x_2 x_3 e_2)
   (substitute
    (substitute
     (substitute
      e_2
      x_1 v_1)
     x_2 v_2)
    x_3 v_3)])

(define -->λh
  (reduction-relation
   λh #:domain Config

   ;; Hole
   (--> [(in-hole E h) vsu tsu]
        [(in-hole E (h @ a)) vsu tsu]
        (fresh a)
        "E-Hole")

   ;; Plus
   (--> [(in-hole E (v_1 + v_2)) vsu_1 tsu_1]
        [(in-hole E ,(+ (term n_1) (term n_2))) vsu_3 tsu_3]
        (where (n_1 vsu_2 tsu_2) (narrow v_1 int vsu_1 tsu_1))
        (where (n_2 vsu_3 tsu_3) (narrow v_2 int vsu_2 tsu_2))
        "E-Plus-Good")
   (--> [(in-hole E (v_1 + v_2)) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (where (stuck-t vsu_2 tsu_2) (narrow v_1 int vsu_1 tsu_1))
        "E-Plus-Bad1")
   (--> [(in-hole E (v_1 + v_2)) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (where (stuck-t vsu_2 tsu_2) (narrow v_2 int vsu_1 tsu_1))
        "E-Plus-Bad2")

   ;; If

   ;; this is different from the latex semantics in that
   ;; we separate the narrowing of the condition from the
   ;; reduction of the if. redex seems to need this, otherwise
   ;; due to the non-deterministic gen, it can try to reduce
   ;; both via true and false, and get stuck

   ;; (--> [(in-hole E (ite true e_1 e_2)) vsu_1]
   ;;      [(in-hole E e_1) vsu_1]
   ;;      "E-If-1")
   ;; (--> [(in-hole E (ite false e_1 e_2)) vsu_1]
   ;;      [(in-hole E e_2) vsu_1]
   ;;      "E-If-2")
   ;; (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1]
   ;;      [(in-hole E (ite b   e_1 e_2)) vsu_2]
   ;;      (where (b vsu_2) (narrow v_1 bool vsu_1))
   ;;      "E-If-Good")

   (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1 tsu_1]
        [(in-hole E e_3) vsu_2 tsu_2]
        (where (b vsu_2 tsu_2) (narrow v_1 bool vsu_1 tsu_1))
        (where e_3 (choose-branch b e_1 e_2))
        "E-If-Good")
   (--> [(in-hole E (ite v_1 e_1 e_2)) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (where (stuck-t vsu_2 tsu_2) (narrow v_1 bool vsu_1 tsu_1))
        "E-If-Bad")

   ;; App
   (--> [(in-hole E (v_1 v_2)) vsu_1 tsu_1]
        [(in-hole E (substitute e_1 x_1 v_2)) vsu_2 tsu_2]
        (where ((λ x_1 e_1) vsu_2 tsu_2) (narrow v_1 fun vsu_1 tsu_1))
        "E-App-Good")
   (--> [(in-hole E (v_1 v_2)) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (where (stuck-t vsu_2 tsu_2) (narrow v_1 fun vsu_1 tsu_1))
        "E-App-Bad")

   ;; Node
   (--> [(in-hole E (node     v_1 v_2  v_3))  vsu_1 tsu_1]
        [(in-hole E (node @ t v_1 v_21 v_31)) vsu_3 tsu_3]
        (judgment-holds (type-of v_1 t))
        (where (v_21 vsu_2 tsu_2) (narrow v_2 (tree t) vsu_1 tsu_1))
        (where (v_31 vsu_3 tsu_3) (narrow v_3 (tree t) vsu_2 tsu_2))
        "E-Node-Good")
   (--> [(in-hole E (node v_1 v_2 v_3)) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (judgment-holds (type-of v_1 t))
        (where (stuck-t vsu_2 tsu_2) (narrow v_2 (tree t) vsu_1 tsu_1))
        "E-Node-Bad1")
   (--> [(in-hole E (node v_1 v_2 v_3)) vsu_1 tsu_1]
        [stuck-t vsu_3 tsu_3]
        (judgment-holds (type-of v_1 t))
        (where (v_11 vsu_2 tsu_2) (narrow v_2 (tree t) vsu_1 tsu_1))
        (where (stuck-t vsu_3 tsu_3) (narrow v_3 (tree t) vsu_2 tsu_2))
        "E-Node-Bad2")

   ;; Leaf
   (--> [(in-hole E leaf) vsu tsu]
        [(in-hole E (leaf @ a)) vsu tsu]
        (fresh a)
        "E-Leaf")

   ;; Case
   (--> [(in-hole E (case v_1 of (leaf -> e_1) (node x_1 x_2 x_3 -> e_2))) vsu_1 tsu_1]
        [(in-hole E e_3) vsu_2 tsu_2]
        (fresh a)
        (where (v_2 vsu_2 tsu_2) (narrow v_1 (tree a) vsu_1 tsu_1))
        (where e_3 (choose-alt v_2 e_1 x_1 x_2 x_3 e_2))
        "E-Case-Good")
   (--> [(in-hole E (case v_1 of (leaf -> e_1) (node x_1 x_2 x_3 -> e_2))) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (fresh a)
        (where (stuck-t vsu_2 tsu_2) (narrow v_1 (tree a) vsu_1 tsu_1))
        "E-Case-Bad")

   (--> [(in-hole E (case v of (pair x_1 x_2 -> e))) vsu_1 tsu_1]
        [(in-hole E e_1) vsu_2 tsu_2]
        (fresh a_1 a_2)
        (where ((pair v_1 v_2) vsu_2 tsu_2) (narrow v (a_1 * a_2) vsu_1 tsu_1))
        (where e_1 (substitute (substitute e x_1 v_1) x_2 v_2))
        "E-Case-Pair-Good")
   (--> [(in-hole E (case v of (pair x_1 x_2 -> e))) vsu_1 tsu_1]
        [stuck-t vsu_2 tsu_2]
        (fresh a_1 a_2)
        (where (stuck-t vsu_2 tsu_2) (narrow v (a_1 * a_2) vsu_1 tsu_1))
        "E-Case-Pair-Bad")
   ))


(module+ test
  ;; (define (test-->h e1 e2)
  ;;   (test--> -->λh (term (,e1 () ())) (term (,e2 () ()))))

  ;; E-Plus
  (test--> -->λh (term ((1    + 2   ) () ())) (term (3       () ())))
  (test--> -->λh (term ((1    + true) () ())) (term (stuck-t () ())))
  (test--> -->λh (term ((true + 2   ) () ())) (term (stuck-t () ())))
  ;; E-If
  (test--> -->λh (term ((ite true  1 2) () ())) (term (1       () ())))
  (test--> -->λh (term ((ite false 1 2) () ())) (term (2       () ())))
  (test--> -->λh (term ((ite 1     1 2) () ())) (term (stuck-t () ())))
  ;; E-App
  (test--> -->λh (term (((λ x x) 1) () ())) (term (1       () ())))
  (test--> -->λh (term ((1       1) () ())) (term (stuck-t () ())))
  ;; E-Leaf
  (test--> -->λh (term (leaf () ())) (term ((leaf @ a) () ())))
  ;; E-Node
  (test--> -->λh (term ((node 1 1 1) () ())) (term (stuck-t () ())))
  (test--> -->λh (term ((node 1 (leaf @ bool) (leaf @ int)) () ())) (term (stuck-t () ())))
  (test--> -->λh (term ((node 1 (leaf @ int) (leaf @ bool)) () ())) (term (stuck-t () ())))
  (test--> -->λh
           (term ((node       1 (leaf @ int) (leaf @ int)) () ()))
           (term ((node @ int 1 (leaf @ int) (leaf @ int)) () ())))
  ;; (test--> -->λh
  ;;          (term ((node       (h_0 @ a_0) (h_1 @ a_1) (h_2 @ a_3)) () ()))
  ;;          (term ((node @ a_0 h_0 (leaf @ h_0) (leaf @ h_0))
  ;;                 ((h_2 (leaf @ h_0)) (h_1 (leaf @ h_0))) ())))
  ;; E-Case
  (define x (term (node @ int 1 (leaf @ int) (node @ int 2 (leaf @ int) (leaf @ int)))))
  (test--> -->λh
           (term ((case (leaf @ int) of (leaf -> true) (node x_1 x_2 x_3 -> false)) () ()))
           (term (true () ((a int)))))
  (test--> -->λh
           (term ((case ,x of (leaf -> true) (node x_1 x_2 x_3 -> false)) () ()))
           (term (false () ((a int)))))
  (test--> -->λh
           (term ((case ,x of (leaf -> true) (node x_1 x_2 x_3 -> x_1)) () ()))
           (term (1 () ((a int)))))
  (test--> -->λh
           (term ((case ,x of (leaf -> true) (node x_1 x_2 x_3 -> x_2)) () ()))
           (term ((leaf @ int) () ((a int)))))
  (test--> -->λh
           (term ((case ,x of (leaf -> true) (node x_1 x_2 x_3 -> x_3)) () ()))
           (term ((node @ int 2 (leaf @ int) (leaf @ int)) () ((a int)))))

  (test--> -->λh
           (term ((case (pair 1 true) of (pair x_1 x_2 -> x_2)) () ()))
           (term (true () ((a_2 bool) (a_1 int)))))
  (test--> -->λh
           (term ((case true of (pair x_1 x_2 -> x_2)) () ()))
           (term (stuck-t () ())))
  )


;; value-or-confluent-step? : term → boolean
(define (value-or-confluent-step? e)
  (or (redex-match λh v e)
      ;; E-Plus-Bad makes -->λh non-deterministic, so we check that the 
      ;; reductions are confluent rather than unique
      (match (apply-reduction-relation -->λh (term (,e () ())))
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
   (where (any _ _) ,(first (apply-reduction-relation*
                             -->λh
                             (term (e_1 () ())))))])

(define-judgment-form λh
  #:mode (gets-stuck-t? I)
  #:contract (gets-stuck-t? e)
  [(gets-stuck-t? e) (where stuck-t (eval-value e))])

(module+ test
  (test-equal (judgment-holds (gets-stuck-t? (1 + true))) #t)
  (test-equal (judgment-holds (gets-stuck-t? (1 + 2))) #f)
  (test-equal (judgment-holds (gets-stuck-t? (case (node 1 leaf leaf) of
                                                   (leaf -> 2)
                                                   (node x_1 x_2 x_3 -> (node true x_2 leaf)))))
              #t)
  (test-equal (judgment-holds (gets-stuck-t? (node leaf (node 1 leaf leaf) leaf)))
              #t)

  (define f (term (λ x (case x of
                             (leaf -> leaf)
                             (node x_1 x_2 x_3 -> (node x_1
                                                        (node 2 leaf leaf)
                                                        (node true leaf leaf)))))))
  )

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

  [---------------------------
   (closed h xs)]

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
   (closed leaf xs)]

  [(closed e_1 xs) (closed e_2 xs) (closed e_3 xs)
   ---------------------------
   (closed (node e_1 e_2 e_3) xs)]

  [(closed e_1 xs) (closed e_2 xs)
   ---------------------------
   (closed (pair e_1 e_2) xs)]

  [(closed e_1 xs) (closed e_2 (x_1 : (x_2 : xs)))
   ---------------------------
   (closed (case e_1 of (pair x_1 x_2 -> e_2)) xs)]

  [(closed e_1 xs) (closed e_2 xs) (closed e_3 (x_1 : (x_2 : (x_3 : xs))))
   ---------------------------
   (closed (case e_1 of (leaf -> e_2) (node x_1 x_2 x_3 -> e_3)) xs)])

(define-judgment-form λh
  #:mode (used I I)
  #:contract (used e xs)

  [(elem x xs)
   -----------
   (used x xs)]

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
   (used (node e_1 e_2 e_3) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (node e_1 e_2 e_3) xs)]
  [(used e_3 xs)
   ---------------------------
   (used (node e_1 e_2 e_3) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (pair e_1 e_2) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (pair e_1 e_2) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (case e_1 of (pair x_1 x_2 -> e_2)) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (case e_1 of (pair x_1 x_2 -> e_2)) xs)]

  [(used e_1 xs)
   ---------------------------
   (used (case e_1 of (leaf -> e_2) (node x_1 x_2 x_3 -> e_3)) xs)]
  [(used e_2 xs)
   ---------------------------
   (used (case e_1 of (leaf -> e_2) (node x_1 x_2 x_3 -> e_3)) xs)]
  [(used e_3 xs)
   ---------------------------
   (used (case e_1 of (leaf -> e_2) (node x_1 x_2 x_3 -> e_3)) xs)])

(define-judgment-form λh
  #:mode (closed-used I I)
  #:contract (closed-used e xs)

  [(closed e xs) (used e xs)
   ---------------------------
   (closed-used e xs)])


(module+ test
  ;; Generality

  (define (finds-general-witness? e)
    ;; for any function
    (begin
      ;; (printf "checking ~s\n" e)

      (implies

       ;; if it gets stuck when applied to a hole
       (and
        (judgment-holds (closed ,e nil))
        (judgment-holds (gets-stuck-t? (,e h_0))))

       ;; then there exists a value of every type s.t. it gets stuck
       (and

        ;; ints
        (ormap
         (λ (i)
           (let [(v (generate-term λh n #:i-th i))]
             (or
              (judgment-holds (gets-stuck-t? (,e ,v)))
              (and (printf "not stuck: ~s\n" (term (,e ,v))) #f))))
         (range 10))

        ;; bools
        (or
         (or (judgment-holds (gets-stuck-t? (,e true)))
             (and (printf "not stuck: ~s\n" (term (,e true))) #f))
         (or (judgment-holds (gets-stuck-t? (,e false)))
             (and (printf "not stuck: ~s\n" (term (,e false))) #f)))

        ;; trees
        (and
         ;; tree int
         (or
          (judgment-holds (gets-stuck-t? (,e (leaf @ int))))
          (and (printf "not stuck: ~s\n" (term (,e (leaf @ int)))) #f)
          (ormap
           (λ (i) (let [(v (second (generate-term λh #:satisfying (wf-tree v int) 3)))]
                    ;; (printf "testing ~s\n" (term ((λ x e) ,v)))
                    (or (judgment-holds (gets-stuck-t? (,e ,v)))
                        (and (printf "not stuck: ~s\n" (term (,e ,v))) #f))))
           (range 10)))
         ;; tree bool
         (or
          (judgment-holds (gets-stuck-t? (,e (leaf @ bool))))
          (and (printf "not stuck: ~s\n" (term (,e (leaf @ bool)))) #f)
          (ormap
           (λ (i) (let [(v (second (generate-term λh #:satisfying (wf-tree v bool) 3)))]
                    ;; (printf "testing ~s\n" (term ((λ x e) ,v)))
                    (or (judgment-holds (gets-stuck-t? (,e ,v)))
                        (and (printf "not stuck: ~s\n" (term (,e ,v))) #f))))
           (range 10))))

        ;; pairs
        (ormap
         (λ (i) (let [(v (second (generate-term λh #:satisfying (type-of-gen v (int * bool)) 3)))]
                  ;; (printf "testing ~s\n" (term ((λ x e) ,v)))
                  (or (judgment-holds (gets-stuck-t? (,e ,v)))
                      (and (printf "not stuck: ~s\n" (term (,e ,v))) #f))))
         (range 10))

        ;; functions
        (ormap
         (λ (i)
           (or
            (judgment-holds
             ;; dont generate arbitrary functions, may be ill-formed, e.g not closed
             (gets-stuck-t? (,e (λ x h_50))))
            (and (printf "not stuck: ~s\n" (term (,e (λ x h_50)))) #f)))
         (range 10))
        ))
      ))

  (let ([cr (make-coverage -->λh)]
        [cn (make-coverage narrow)]
        [cg (make-coverage gen)]
        ; [gen-value (generate-term λh v)]
        )
    (parameterize ([relation-coverage (list cr cn cg)])
      (redex-check
       λh (λ x e) #:in-order
       (finds-general-witness? (term (λ x e)))
       #:attempts 1000)
      (redex-check
       λh e #:in-order
       (finds-general-witness? (term (λ x (case e of
                                                (leaf -> 1)
                                                (node x_1 x_2 x_3 -> 2)))))
       #:attempts 1000)
      (redex-check
       ;; for any closed function
       λh #:satisfying (closed-used e (x : nil))
       (finds-general-witness? (term (λ x e)))
       #:attempts 2000)
      ;; (values (covered-cases cr)
      ;;         (covered-cases cn)
      ;;         (covered-cases cg))
      (covered-cases cr)
      )))

(module+ test
  (test-results))

(require typeset-rewriter)

(define typeof-rw
  (rw-lambda
   [`(type-of ,e ,t)
    => (list "" e " : " t)]))

(define extend-rw
  (rw-lambda
   [`(extend ,Γ (,x ,t))
    => (list "" Γ "[" x "→" t "]")]))

(define apply-su-rw
  (rw-lambda
   [`(apply-su ,Γ ,x)
    => (list "" Γ "(" x ")")]))

(define lookup-rw
  (rw-lambda
   [`(lookup ,Γ ,x)
    => (list "" Γ "(" x ")")]))

(define type-compat-rw
  (rw-lambda
   [`(type-compat-1 ,s ,t, su)
    => (list "" s " ~ " t)]))

(define substitute-rw
  (rw-lambda
   [
    `(substitute ,e ,x ,v)
    => (list "" e "[" x "/" v "]")
    ;;`(substitute (substitute (substitute ,e ,x1 ,v1) ,x2 ,v2) ,x3 ,v3)
    ;;=> (list "" e "[" x1 "/" v1 "][" x2 "/" v2 "][" x3 "/" v3 "]")
    ]))


(define-rw-context with-rws
  #:atomic (['t "τ"] ['-> "→"] ['number "n"] ['vsu "σ"] ['a "α"] ['tsu "θ"])
  #:compound (['type-of typeof-rw]
              ['extend extend-rw]
              ['lookup lookup-rw]
              ['type-compat-1 type-compat-rw]
              ['substitute substitute-rw]
              ['apply-su apply-su-rw]
              ))

(define (render-λh)
  (with-rws (render-language λh "language.ps" #:nts '(e stuck v n b t)))
  (parameterize ([metafunction-pict-style 'left-right])
    (with-rws (render-metafunction narrow "narrow.ps" #:contract? #t)))
  (parameterize ([metafunction-pict-style 'left-right/beside-side-conditions])
    (with-rws (render-metafunctions choose-branch choose-alt
                                    #:filename "choose.ps"
                                    #:contract? #t)))
  (with-rws (render-reduction-relation -->λh "reduction.ps")))
