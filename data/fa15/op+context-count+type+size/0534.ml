
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
  | VarX  -> VarX
  | VarY  -> VarY
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(13,13)-(13,17)
(14,13)-(14,17)
(15,14)-(15,50)
*)

(* type error slice
(11,3)-(26,83)
(11,21)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(13,13)-(13,17)
(15,14)-(15,50)
(15,24)-(15,25)
(15,26)-(15,50)
(15,27)-(15,43)
(15,28)-(15,40)
(15,44)-(15,45)
(16,16)-(16,52)
(16,26)-(16,27)
(18,6)-(18,71)
(18,11)-(18,12)
(19,21)-(19,65)
(19,39)-(19,40)
(21,6)-(26,81)
(21,10)-(21,11)
*)
