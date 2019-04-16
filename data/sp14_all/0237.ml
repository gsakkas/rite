
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Inverse a -> "1/" ^ (exprToString a)
  | Max (a,b) ->
      "max(" ^ ((exprToString a) ^ ("," ^ ((exprToString b) ^ ")")))
  | Range (a,b,c) ->
      "range(" ^
        ((exprToString a) ^
           (("," exprToString b) ^ ("," ^ ((exprToString c) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Inverse a -> "1/" ^ (exprToString a)
  | Max (a,b) ->
      "max(" ^ ((exprToString a) ^ ("," ^ ((exprToString b) ^ ")")))
  | Range (a,b,c) ->
      "range(" ^
        ((exprToString a) ^
           ("," ^ ((exprToString b) ^ ("," ^ ((exprToString c) ^ ")")))));;

*)

(* changed spans
(35,13)-(35,33)
","
LitG

(35,37)-(35,40)
exprToString b
AppG (fromList [VarG])

(35,44)-(35,60)
","
LitG

(35,63)-(35,66)
exprToString c ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(35,13)-(35,33)
(35,14)-(35,17)
*)
