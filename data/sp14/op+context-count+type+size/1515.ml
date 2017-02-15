
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
  | Sine s -> "sin(pi*" ^ (s ^ ")");;


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
  | Sine s -> "sin(pi*" ^ ((Format.sprintf "%expr" 1.0) ^ ")");;

*)

(* changed spans
(15,27)-(15,28)
(15,31)-(15,34)
*)

(* type error slice
(12,2)-(15,35)
(15,26)-(15,35)
(15,27)-(15,28)
(15,29)-(15,30)
*)
