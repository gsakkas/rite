
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
  | Thresh (a,b,c,d) ->
      ((exprToString a), (exprToString b), (exprToString c),
        (exprToString d));;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")");;

*)

(* changed spans
(12,2)-(15,25)
(14,6)-(15,25)
(14,7)-(14,23)
(14,8)-(14,20)
(14,21)-(14,22)
(14,25)-(14,41)
(14,26)-(14,38)
(14,39)-(14,40)
(14,43)-(14,59)
(14,44)-(14,56)
(14,57)-(14,58)
(15,8)-(15,24)
(15,22)-(15,23)
*)

(* type error slice
(11,3)-(15,27)
(11,21)-(15,25)
(12,2)-(15,25)
(14,6)-(15,25)
(15,8)-(15,24)
(15,9)-(15,21)
*)
