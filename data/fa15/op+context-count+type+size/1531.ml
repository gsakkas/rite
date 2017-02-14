
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
(12,2)-(18,49)
(13,15)-(13,18)
(13,15)-(13,36)
(13,19)-(13,36)
(13,20)-(13,32)
(13,33)-(13,35)
(14,17)-(14,20)
(14,17)-(14,38)
(14,21)-(14,38)
(16,6)-(16,46)
(16,6)-(16,66)
(16,7)-(16,24)
(16,28)-(16,45)
(16,29)-(16,41)
(16,42)-(16,44)
(16,50)-(16,66)
(16,64)-(16,65)
(17,21)-(17,28)
(17,26)-(17,28)
(18,28)-(18,44)
(18,28)-(18,49)
(18,29)-(18,38)
(18,30)-(18,32)
(18,35)-(18,37)
(18,41)-(18,43)
(18,47)-(18,49)
*)

(* type error slice
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(12,2)-(18,49)
(13,15)-(13,18)
(13,15)-(13,36)
(13,19)-(13,36)
(13,20)-(13,32)
(13,33)-(13,35)
(16,50)-(16,66)
(16,51)-(16,63)
(16,64)-(16,65)
(17,21)-(17,23)
(17,21)-(17,28)
(17,21)-(17,28)
(17,21)-(17,28)
(17,26)-(17,28)
(18,28)-(18,44)
(18,28)-(18,49)
(18,28)-(18,49)
(18,29)-(18,38)
(18,29)-(18,38)
(18,30)-(18,32)
(18,35)-(18,37)
(18,41)-(18,43)
(18,47)-(18,49)
*)
