
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | [] -> []
  | h::e' ->
      (match h with
       | VarX  -> "x" ^ (exprToString e')
       | VarY  -> "y" ^ (exprToString e')
       | Sine  -> "sin(pi*" ^ ((exprToString e') ^ ")")
       | Cosine  -> "cos(pi*" ^ ((exprToString e') ^ ")")
       | Average  ->
           let (e1,e2) = h in
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times  ->
           let (e1,e2) = h in
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh  ->
           let (e1,e2,e3,e4) = h in
           "(" ^
             ((exprToString e1) ^
                ("<" ^
                   ((exprToString e2) ^
                      ("?" ^
                         ((exprToString e3) ^
                            (":" ^
                               ((exprToString e4) ^ (")" ^ (exprToString e'))))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(38,85)
(13,10)-(13,12)
(15,6)-(38,85)
(15,13)-(15,14)
(16,18)-(16,41)
(16,22)-(16,23)
(16,24)-(16,41)
(16,25)-(16,37)
(16,38)-(16,40)
(17,18)-(17,41)
(17,22)-(17,23)
(17,24)-(17,41)
(17,25)-(17,37)
(17,38)-(17,40)
(18,45)-(18,47)
(19,47)-(19,49)
(21,11)-(24,75)
(21,25)-(21,26)
(24,44)-(24,72)
(24,45)-(24,51)
(24,68)-(24,70)
(26,11)-(28,60)
(26,25)-(26,26)
(27,11)-(27,28)
(27,25)-(27,27)
(28,14)-(28,17)
(28,41)-(28,58)
(28,55)-(28,57)
(30,11)-(38,84)
(30,31)-(30,32)
(31,11)-(31,14)
(33,16)-(38,83)
*)

(* type error slice
(12,2)-(38,85)
(12,2)-(38,85)
(12,2)-(38,85)
(12,2)-(38,85)
(13,10)-(13,12)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,6)-(38,85)
(15,13)-(15,14)
(16,18)-(16,41)
(16,22)-(16,23)
(16,24)-(16,41)
(16,25)-(16,37)
(16,38)-(16,40)
(21,11)-(24,75)
(21,25)-(21,26)
(23,14)-(23,31)
(23,15)-(23,27)
(23,28)-(23,30)
(24,24)-(24,41)
(24,25)-(24,37)
(24,38)-(24,40)
(26,11)-(28,60)
(26,25)-(26,26)
(27,11)-(27,28)
(27,12)-(27,24)
(27,25)-(27,27)
(28,21)-(28,38)
(28,22)-(28,34)
(28,35)-(28,37)
(30,11)-(38,84)
(30,31)-(30,32)
*)
