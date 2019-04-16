
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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (("+" exprToString b) ^ ")/20"))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;


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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/20")))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;

*)

(* changed spans
(21,35)-(21,55)
"+"
LitG

(21,58)-(21,64)
exprToString b ^ ")/20"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(21,35)-(21,55)
(21,36)-(21,39)
*)
