
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
(12,2)-(37,85)
(12,8)-(12,9)
(13,10)-(13,12)
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
(19,44)-(19,69)
(19,49)-(19,50)
(19,51)-(19,68)
(19,52)-(19,64)
(19,65)-(19,67)
(21,44)-(21,69)
(21,49)-(21,50)
(21,51)-(21,68)
(21,52)-(21,64)
(21,65)-(21,67)
(25,44)-(25,72)
(25,45)-(25,51)
(25,68)-(25,70)
(27,11)-(27,28)
(27,25)-(27,27)
(28,14)-(28,17)
(28,41)-(28,58)
(28,55)-(28,57)
(30,15)-(30,16)
*)

(* type error slice
(11,3)-(37,87)
(11,21)-(37,85)
(12,2)-(37,85)
(12,2)-(37,85)
(12,2)-(37,85)
(12,2)-(37,85)
(13,10)-(13,12)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(15,6)-(37,85)
(16,18)-(16,41)
(16,22)-(16,23)
(16,24)-(16,41)
(16,25)-(16,37)
(16,38)-(16,40)
(19,24)-(19,41)
(19,25)-(19,37)
(19,38)-(19,40)
(21,24)-(21,41)
(21,25)-(21,37)
(21,38)-(21,40)
(24,14)-(24,31)
(24,15)-(24,27)
(24,28)-(24,30)
(25,24)-(25,41)
(25,25)-(25,37)
(25,38)-(25,40)
(27,11)-(27,28)
(27,12)-(27,24)
(27,25)-(27,27)
(28,21)-(28,38)
(28,22)-(28,34)
(28,35)-(28,37)
(31,14)-(31,31)
(31,15)-(31,27)
(31,28)-(31,30)
(33,20)-(33,37)
(33,21)-(33,33)
(33,34)-(33,36)
(35,26)-(35,43)
(35,27)-(35,39)
(35,40)-(35,42)
(37,32)-(37,49)
(37,33)-(37,45)
(37,46)-(37,48)
*)
