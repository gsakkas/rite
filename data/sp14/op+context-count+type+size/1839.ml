
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
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ (("+" exprToString e4) ^ ")/2)"));;


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
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")));;

*)

(* changed spans
(18,35)-(18,56)
(18,40)-(18,52)
*)

(* type error slice
(18,35)-(18,56)
(18,36)-(18,39)
*)
