
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
  | Sine x -> "sin(pi*%s)" x
  | Cosine x -> "cos(pi*%s)" x
  | Average (x,y) -> "((%s+%s)/2)" x y
  | Times (x,y) -> "%s*%s" x y
  | Thresh (x,y,z,a) -> "%s<%s?%s:%s" x y z a;;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,a) ->
      (exprToString x) ^
        ("<" ^
           ((exprToString y) ^
              ("?" ^ ((exprToString z) ^ (":" ^ (exprToString a))))));;

*)

(* changed spans
(15,14)-(15,26)
(15,14)-(15,28)
(16,16)-(16,28)
(16,16)-(16,30)
(17,21)-(17,34)
(17,21)-(17,38)
(17,35)-(17,36)
(17,37)-(17,38)
(18,19)-(18,26)
(18,19)-(18,30)
(18,27)-(18,28)
(18,29)-(18,30)
(19,24)-(19,37)
(19,24)-(19,45)
(19,38)-(19,39)
(19,40)-(19,41)
(19,42)-(19,43)
(19,44)-(19,45)
*)

(* type error slice
(15,14)-(15,26)
(15,14)-(15,28)
(16,16)-(16,28)
(16,16)-(16,30)
(17,21)-(17,34)
(17,21)-(17,38)
(18,19)-(18,26)
(18,19)-(18,30)
(19,24)-(19,37)
(19,24)-(19,45)
*)
