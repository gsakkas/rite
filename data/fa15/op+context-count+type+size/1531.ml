
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
  | Average (e1,e2) ->
      ((exprToString e1) +. (exprToString e2)) /. (exprToString 2)
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
(12,3)-(18,50)
(13,16)-(13,19)
(13,16)-(13,36)
(13,21)-(13,33)
(13,21)-(13,36)
(13,34)-(13,36)
(14,18)-(14,21)
(14,18)-(14,38)
(14,23)-(14,38)
(16,9)-(16,24)
(16,9)-(16,45)
(16,9)-(16,66)
(16,30)-(16,42)
(16,30)-(16,45)
(16,43)-(16,45)
(16,52)-(16,66)
(16,65)-(16,66)
(17,22)-(17,29)
(17,27)-(17,29)
(18,31)-(18,33)
(18,31)-(18,38)
(18,31)-(18,44)
(18,31)-(18,50)
(18,36)-(18,38)
(18,42)-(18,44)
(18,48)-(18,50)
*)

(* type error slice
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(12,3)-(18,50)
(13,16)-(13,19)
(13,16)-(13,36)
(13,21)-(13,33)
(13,21)-(13,36)
(13,34)-(13,36)
(16,52)-(16,64)
(16,52)-(16,66)
(16,65)-(16,66)
(17,22)-(17,24)
(17,22)-(17,29)
(17,22)-(17,29)
(17,22)-(17,29)
(17,27)-(17,29)
(18,31)-(18,33)
(18,31)-(18,38)
(18,31)-(18,38)
(18,31)-(18,44)
(18,31)-(18,50)
(18,31)-(18,50)
(18,36)-(18,38)
(18,42)-(18,44)
(18,48)-(18,50)
*)
