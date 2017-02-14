
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
  | Sine e1 -> sin (exprToString e1)
  | Cosine e1 -> cos (exprToString e1)
  | Average (e1,e2) -> (e1 + e2) / 2
  | Times (e1,e2) -> e1 * e2
  | Thresh (e1,e2,e3,e4) -> ((e1 * e2) * e3) * e4;;


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
  | Sine e1 -> "sin (pi * " ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi * " ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (") + " ^ ((exprToString e2) ^ "/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(17,49)
(13,15)-(13,18)
(13,15)-(13,36)
(13,19)-(13,36)
(14,17)-(14,20)
(14,17)-(14,38)
(14,21)-(14,38)
(15,23)-(15,32)
(15,23)-(15,36)
(15,24)-(15,26)
(15,29)-(15,31)
(15,35)-(15,36)
(16,21)-(16,23)
(16,21)-(16,28)
(16,26)-(16,28)
(17,28)-(17,44)
(17,28)-(17,49)
(17,29)-(17,38)
(17,30)-(17,32)
(17,35)-(17,37)
(17,41)-(17,43)
(17,47)-(17,49)
*)

(* type error slice
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(12,2)-(17,49)
(13,15)-(13,18)
(13,15)-(13,36)
(15,23)-(15,32)
(15,23)-(15,32)
(15,23)-(15,36)
(15,24)-(15,26)
(15,29)-(15,31)
(16,21)-(16,23)
(16,21)-(16,28)
(16,21)-(16,28)
(16,21)-(16,28)
(16,26)-(16,28)
(17,28)-(17,44)
(17,28)-(17,49)
(17,28)-(17,49)
(17,29)-(17,38)
(17,29)-(17,38)
(17,30)-(17,32)
(17,35)-(17,37)
(17,41)-(17,43)
(17,47)-(17,49)
*)
