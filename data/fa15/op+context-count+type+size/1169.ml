
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
  | VarX  -> e
  | VarY  -> e
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<*" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))));;


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
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<*" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))));;

*)

(* changed spans
(13,13)-(13,14)
(14,13)-(14,14)
(15,16)-(15,54)
*)

(* type error slice
(11,3)-(26,83)
(11,21)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,8)-(12,9)
(13,13)-(13,14)
(15,16)-(15,54)
(15,26)-(15,27)
(15,28)-(15,54)
(15,29)-(15,47)
(15,30)-(15,42)
(15,43)-(15,46)
(15,48)-(15,49)
(16,18)-(16,56)
(16,28)-(16,29)
(18,6)-(18,71)
(18,11)-(18,12)
(19,21)-(19,66)
(19,39)-(19,40)
(21,6)-(26,81)
(21,10)-(21,11)
*)
