
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
  | Sine e1 -> sin (3.142 * (exprToString e1))
  | Cosine e1 -> cos (exprToString e1)
  | Average (e1,e2) ->
      ((exprToString e1) +. (exprToString e2)) /. (exprToString 2)
  | Times (e1,e2) -> (exprToString e1) *. (exprToString e2);;


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
(12,3)-(17,59)
(13,16)-(13,19)
(13,16)-(13,45)
(13,21)-(13,26)
(13,21)-(13,45)
(13,30)-(13,42)
(13,30)-(13,45)
(13,43)-(13,45)
(14,18)-(14,21)
(14,18)-(14,38)
(14,23)-(14,38)
(16,9)-(16,24)
(16,9)-(16,45)
(16,9)-(16,66)
(16,30)-(16,42)
(16,30)-(16,45)
(16,43)-(16,45)
(16,52)-(16,64)
(16,52)-(16,66)
(16,65)-(16,66)
(17,23)-(17,38)
(17,23)-(17,59)
(17,44)-(17,56)
(17,44)-(17,59)
(17,57)-(17,59)
*)

(* type error slice
(11,4)-(17,62)
(11,22)-(17,59)
(12,3)-(17,59)
(12,3)-(17,59)
(13,16)-(13,19)
(13,16)-(13,45)
(13,21)-(13,26)
(13,21)-(13,45)
(13,21)-(13,45)
(13,21)-(13,45)
(13,30)-(13,42)
(13,30)-(13,45)
(13,43)-(13,45)
(14,18)-(14,21)
(14,18)-(14,38)
(14,23)-(14,35)
(14,23)-(14,38)
(16,9)-(16,21)
(16,9)-(16,24)
(16,9)-(16,45)
(16,9)-(16,45)
(16,9)-(16,66)
(16,30)-(16,42)
(16,30)-(16,45)
(16,52)-(16,64)
(16,52)-(16,66)
(16,65)-(16,66)
(17,23)-(17,35)
(17,23)-(17,38)
(17,23)-(17,59)
(17,23)-(17,59)
(17,44)-(17,56)
(17,44)-(17,59)
*)
