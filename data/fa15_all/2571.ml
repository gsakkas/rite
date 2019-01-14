
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | Square ex -> "(" ^ ((exprToString ex) ^ ") ^ 2")
  | Mix (ex1,ex2,ex3) ->
      exprToString Average ((Times (ex1, ex2)), (Times (ex2, ex3)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | Square ex -> "(" ^ ((exprToString ex) ^ ") ^ 2")
  | Mix (ex1,ex2,ex3) ->
      exprToString (Average ((Times (ex1, ex2)), (Times (ex2, ex3))));;

*)

(* changed spans
(31,6)-(31,67)
exprToString (Average (Times (ex1 , ex2) , Times (ex2 , ex3)))
AppG (fromList [ConAppG (Just (TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing])

(31,27)-(31,67)
Average (Times (ex1 , ex2) , Times (ex2 , ex3))
ConAppG (Just (TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing

*)
