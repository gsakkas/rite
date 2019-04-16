
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec exprToString e =
  match e with
  | Sine e1 -> sin (pi * (exprToString e1))
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
(14,3)-(19,60)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin (pi * " ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos (pi * " ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ (") + " ^ (exprToString e2 ^ "/2)")))
| Times (e1 , e2) -> exprToString e1 ^ (" * " ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ (" ? " ^ (exprToString e3 ^ (" : " ^ (exprToString e4 ^ ")")))))))
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(19,62)
(13,22)-(19,60)
(14,3)-(19,60)
(15,16)-(15,19)
(15,16)-(15,44)
(15,20)-(15,44)
(15,21)-(15,23)
(15,26)-(15,43)
(15,27)-(15,39)
(15,40)-(15,42)
(16,18)-(16,21)
(16,18)-(16,39)
(16,22)-(16,39)
(16,23)-(16,35)
(18,7)-(18,47)
(18,7)-(18,67)
(18,8)-(18,25)
(18,9)-(18,21)
(18,29)-(18,46)
(18,30)-(18,42)
(18,51)-(18,67)
(18,52)-(18,64)
(18,65)-(18,66)
(19,22)-(19,39)
(19,22)-(19,60)
(19,23)-(19,35)
(19,43)-(19,60)
(19,44)-(19,56)
*)
