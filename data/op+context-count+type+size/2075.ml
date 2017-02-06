
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
(12,3)-(15,24)
(14,9)-(14,21)
(14,9)-(14,23)
(14,9)-(15,24)
(14,22)-(14,23)
(14,27)-(14,39)
(14,27)-(14,41)
(14,40)-(14,41)
(14,45)-(14,57)
(14,45)-(14,59)
(14,58)-(14,59)
(15,10)-(15,24)
(15,23)-(15,24)
*)

(* type error slice
(11,4)-(15,28)
(11,22)-(15,24)
(12,3)-(15,24)
(12,9)-(12,10)
(14,9)-(14,21)
(14,9)-(14,23)
(14,9)-(15,24)
(14,27)-(14,39)
(14,27)-(14,41)
(14,45)-(14,57)
(14,45)-(14,59)
(15,10)-(15,22)
(15,10)-(15,24)
*)
