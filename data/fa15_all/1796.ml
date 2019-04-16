
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString expr =
  match expr with
  | "VarX" -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString expr =
  match expr with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

*)

(* changed spans
(12,3)-(26,82)
match expr with
| VarX -> "x"
| VarY -> "y"
| Sine ex -> "sin(pi*" ^ (exprToString ex ^ ")")
| Cosine ex -> "cos(pi*" ^ (exprToString ex ^ ")")
| Average (ex1 , ex2) -> "(" ^ (exprToString ex1 ^ ("*" ^ (exprToString ex2 ^ ")/2")))
| Times (ex1 , ex2) -> exprToString ex1 ^ ("*" ^ exprToString ex2)
| Thresh (ex1 , ex2 , ex3 , ex4) -> "(" ^ (exprToString ex1 ^ ("<" ^ (exprToString ex2 ^ ("?" ^ (exprToString ex3 ^ (":" ^ (exprToString ex4 ^ ")")))))))
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,4)-(26,84)
(11,22)-(26,82)
(12,3)-(26,82)
(12,9)-(12,13)
(15,29)-(15,46)
(15,30)-(15,42)
(15,43)-(15,45)
*)
