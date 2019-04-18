
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = if e = VarX then "x";;


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
(11,26)-(11,46)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine ex -> "sin(pi*" ^ (exprToString ex ^ ")")
| Cosine ex -> "cos(pi*" ^ (exprToString ex ^ ")")
| Average (ex1 , ex2) -> "(" ^ (exprToString ex1 ^ ("*" ^ (exprToString ex2 ^ ")/2")))
| Times (ex1 , ex2) -> exprToString ex1 ^ ("*" ^ exprToString ex2)
| Thresh (ex1 , ex2 , ex3 , ex4) -> "(" ^ (exprToString ex1 ^ ("<" ^ (exprToString ex2 ^ ("?" ^ (exprToString ex3 ^ (":" ^ (exprToString ex4 ^ ")")))))))
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,26)-(11,46)
(11,43)-(11,46)
(11,46)-(11,46)
*)
