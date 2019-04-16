
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
  | Sine x -> "sin(" @ ((exprToString x) @ ")");;


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
  | Sine x -> "sin(" ^ ((exprToString x) ^ ")");;

*)

(* changed spans
(15,15)-(15,48)
"sin(" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(15,50)
(11,22)-(15,48)
(12,3)-(15,48)
(13,14)-(13,17)
(15,15)-(15,21)
(15,15)-(15,48)
(15,22)-(15,23)
(15,24)-(15,48)
(15,25)-(15,41)
(15,26)-(15,38)
(15,42)-(15,43)
(15,44)-(15,47)
*)
