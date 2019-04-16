
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
  | Sine e -> "sin (pi*" + (exprToString e);;


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
  | Sine e -> "sin (pi*" ^ (exprToString e);;

*)

(* changed spans
(15,15)-(15,44)
"sin (pi*" ^ exprToString e
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(15,46)
(11,22)-(15,44)
(12,3)-(15,44)
(13,14)-(13,17)
(15,15)-(15,25)
(15,15)-(15,44)
(15,28)-(15,44)
(15,29)-(15,41)
*)
