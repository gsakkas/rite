
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
(12,2)-(17,59)
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
(16,51)-(16,63)
(16,64)-(16,65)
(17,21)-(17,38)
(17,21)-(17,59)
(17,42)-(17,59)
(17,43)-(17,55)
(17,56)-(17,58)
*)

(* type error slice
(12,2)-(17,59)
(13,19)-(13,36)
(13,20)-(13,32)
(13,33)-(13,35)
(16,50)-(16,66)
(16,51)-(16,63)
(16,64)-(16,65)
*)
