
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
(12,3)-(17,50)
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
(12,3)-(17,50)
(13,16)-(13,19)
(13,16)-(13,37)
(15,24)-(15,33)
(15,24)-(15,37)
(15,25)-(15,27)
(15,30)-(15,32)
(16,22)-(16,24)
(16,22)-(16,29)
(16,27)-(16,29)
(17,29)-(17,45)
(17,29)-(17,50)
(17,30)-(17,39)
(17,31)-(17,33)
(17,36)-(17,38)
(17,42)-(17,44)
(17,48)-(17,50)
*)
