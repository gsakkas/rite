
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
(12,3)-(38,76)
(13,11)-(13,13)
(15,8)-(38,76)
(15,14)-(15,15)
(16,19)-(16,41)
(16,23)-(16,24)
(16,26)-(16,38)
(16,26)-(16,41)
(16,39)-(16,41)
(17,19)-(17,41)
(17,23)-(17,24)
(17,26)-(17,38)
(17,26)-(17,41)
(17,39)-(17,41)
(18,46)-(18,48)
(19,48)-(19,50)
(21,12)-(24,71)
(21,26)-(21,27)
(24,46)-(24,52)
(24,46)-(24,71)
(24,69)-(24,71)
(26,12)-(28,58)
(26,26)-(26,27)
(27,13)-(27,28)
(27,26)-(27,28)
(28,15)-(28,18)
(28,43)-(28,58)
(28,56)-(28,58)
(30,12)-(38,76)
(30,32)-(30,33)
(31,12)-(31,15)
(33,18)-(38,76)
*)

(* type error slice
(12,3)-(38,76)
(12,3)-(38,76)
(12,3)-(38,76)
(12,3)-(38,76)
(13,11)-(13,13)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,8)-(38,76)
(15,14)-(15,15)
(16,19)-(16,41)
(16,23)-(16,24)
(16,26)-(16,38)
(16,26)-(16,41)
(16,39)-(16,41)
(21,12)-(24,71)
(21,26)-(21,27)
(23,16)-(23,28)
(23,16)-(23,31)
(23,29)-(23,31)
(24,26)-(24,38)
(24,26)-(24,41)
(24,39)-(24,41)
(26,12)-(28,58)
(26,26)-(26,27)
(27,13)-(27,25)
(27,13)-(27,28)
(27,26)-(27,28)
(28,23)-(28,35)
(28,23)-(28,38)
(28,36)-(28,38)
(30,12)-(38,76)
(30,32)-(30,33)
*)
