
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
(11,25)-(11,45)
"y"
LitG

(11,28)-(11,36)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine ex -> "sin(pi*" ^ (exprToString ex ^ ")")
| Cosine ex -> "cos(pi*" ^ (exprToString ex ^ ")")
| Average (ex1 , ex2) -> "(" ^ (exprToString ex1 ^ ("*" ^ (exprToString ex2 ^ ")/2")))
| Times (ex1 , ex2) -> exprToString ex1 ^ ("*" ^ exprToString ex2)
| Thresh (ex1 , ex2 , ex3 , ex4) -> "(" ^ (exprToString ex1 ^ ("<" ^ (exprToString ex2 ^ ("?" ^ (exprToString ex3 ^ (":" ^ (exprToString ex4 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)
