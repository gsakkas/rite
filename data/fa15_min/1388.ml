
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
(13,14)-(13,15)
"x"
LitG

(14,14)-(14,15)
"y"
LitG

*)

(* type error slice
(11,4)-(26,84)
(11,22)-(26,82)
(12,3)-(26,82)
(12,9)-(12,10)
(13,14)-(13,15)
(15,17)-(15,55)
(15,27)-(15,28)
(15,29)-(15,55)
(15,30)-(15,48)
(15,31)-(15,43)
(15,44)-(15,47)
(15,49)-(15,50)
(16,19)-(16,57)
(16,29)-(16,30)
(18,7)-(18,72)
(18,12)-(18,13)
(19,22)-(19,67)
(19,40)-(19,41)
(21,7)-(26,82)
(21,11)-(21,12)
*)
