
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
(15,15)-(15,27)
(15,15)-(15,29)
(16,17)-(16,29)
(16,17)-(16,31)
(17,22)-(17,35)
(17,22)-(17,39)
(17,36)-(17,37)
(17,38)-(17,39)
(18,20)-(18,27)
(18,20)-(18,31)
(18,28)-(18,29)
(18,30)-(18,31)
(19,25)-(19,38)
(19,25)-(19,46)
(19,39)-(19,40)
(19,41)-(19,42)
(19,43)-(19,44)
(19,45)-(19,46)
*)

(* type error slice
(11,4)-(19,48)
(11,22)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,3)-(19,46)
(12,9)-(12,10)
(15,15)-(15,27)
(15,15)-(15,29)
(15,28)-(15,29)
(16,17)-(16,29)
(16,17)-(16,31)
(16,30)-(16,31)
(17,22)-(17,35)
(17,22)-(17,39)
(17,36)-(17,37)
(17,38)-(17,39)
(18,20)-(18,27)
(18,20)-(18,31)
(18,28)-(18,29)
(18,30)-(18,31)
(19,25)-(19,38)
(19,25)-(19,46)
(19,39)-(19,40)
(19,41)-(19,42)
(19,43)-(19,44)
(19,45)-(19,46)
*)
