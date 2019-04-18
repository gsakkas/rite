
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
(12,3)-(17,60)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin (pi * " ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos (pi * " ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ (") + " ^ (exprToString e2 ^ "/2)")))
| Times (e1 , e2) -> exprToString e1 ^ (" * " ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ (" ? " ^ (exprToString e3 ^ (" : " ^ (exprToString e4 ^ ")")))))))
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

(13,16)-(13,47)
"x"
LitG

(14,18)-(14,39)
"y"
LitG

(16,7)-(16,67)
"sin (pi * " ^ (exprToString e1 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,22)-(17,60)
"cos (pi * " ^ (exprToString e1 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(17,62)
(11,22)-(17,60)
(12,3)-(17,60)
(13,16)-(13,19)
(13,16)-(13,47)
(13,20)-(13,47)
(13,21)-(13,26)
(13,29)-(13,46)
(13,30)-(13,42)
(13,43)-(13,45)
(14,18)-(14,21)
(14,18)-(14,39)
(14,22)-(14,39)
(14,23)-(14,35)
(16,7)-(16,47)
(16,7)-(16,67)
(16,8)-(16,25)
(16,9)-(16,21)
(16,29)-(16,46)
(16,30)-(16,42)
(16,51)-(16,67)
(16,52)-(16,64)
(16,65)-(16,66)
(17,22)-(17,39)
(17,22)-(17,60)
(17,23)-(17,35)
(17,43)-(17,60)
(17,44)-(17,56)
*)
