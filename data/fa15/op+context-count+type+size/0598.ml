
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
       | Sine e1 ->
           "sin(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Cosine e1 ->
           "cos(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Average (e1,e2) ->
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times (e1,e2) ->
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh (e1,e2,e3,e4) ->
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
(12,3)-(37,76)
(12,9)-(12,10)
(13,11)-(13,13)
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
(19,46)-(19,68)
(19,50)-(19,51)
(19,53)-(19,65)
(19,53)-(19,68)
(19,66)-(19,68)
(21,46)-(21,68)
(21,50)-(21,51)
(21,53)-(21,65)
(21,53)-(21,68)
(21,66)-(21,68)
(25,46)-(25,52)
(25,46)-(25,71)
(25,69)-(25,71)
(27,13)-(27,28)
(27,26)-(27,28)
(28,15)-(28,18)
(28,43)-(28,58)
(28,56)-(28,58)
*)

(* type error slice
(11,4)-(37,88)
(11,22)-(37,76)
(12,3)-(37,76)
(12,3)-(37,76)
(12,3)-(37,76)
(12,3)-(37,76)
(13,11)-(13,13)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(15,8)-(37,76)
(16,19)-(16,41)
(16,23)-(16,24)
(16,26)-(16,38)
(16,26)-(16,41)
(16,39)-(16,41)
(19,26)-(19,38)
(19,26)-(19,41)
(19,39)-(19,41)
(21,26)-(21,38)
(21,26)-(21,41)
(21,39)-(21,41)
(24,16)-(24,28)
(24,16)-(24,31)
(24,29)-(24,31)
(25,26)-(25,38)
(25,26)-(25,41)
(25,39)-(25,41)
(27,13)-(27,25)
(27,13)-(27,28)
(27,26)-(27,28)
(28,23)-(28,35)
(28,23)-(28,38)
(28,36)-(28,38)
(31,16)-(31,28)
(31,16)-(31,31)
(31,29)-(31,31)
(33,22)-(33,34)
(33,22)-(33,37)
(33,35)-(33,37)
(35,28)-(35,40)
(35,28)-(35,43)
(35,41)-(35,43)
(37,34)-(37,46)
(37,34)-(37,49)
(37,47)-(37,49)
*)
