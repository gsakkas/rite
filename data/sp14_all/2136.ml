
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
Format.sprintf "%expr" 1.0
AppG (fromList [LitG])

(15,31)-(15,34)
Format.sprintf
VarG

(15,31)-(15,34)
"%expr"
LitG

(15,31)-(15,34)
1.0
LitG

*)
