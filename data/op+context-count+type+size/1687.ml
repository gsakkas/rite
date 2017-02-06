
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
(15,28)-(15,29)
(15,32)-(15,35)
*)

(* type error slice
(11,4)-(15,38)
(11,22)-(15,35)
(12,3)-(15,35)
(12,9)-(12,10)
(15,15)-(15,24)
(15,25)-(15,26)
(15,28)-(15,29)
(15,28)-(15,35)
(15,28)-(15,35)
(15,30)-(15,31)
(15,32)-(15,35)
*)
