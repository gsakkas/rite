
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Squared e -> "(" ^ ((exprToString e) ^ ")^(2)")
  | Flatten (e1,e2,e3) ->
      ("(" exprToString e1) ^
        ("/" ^ ((exprToString e2) ^ ("/" ^ ((exprToString e3) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Squared e -> "(" ^ ((exprToString e) ^ ")^(2)")
  | Flatten (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/" ^ ((exprToString e2) ^ ("/" ^ ((exprToString e3) ^ ")")))));;

*)

(* changed spans
(31,7)-(31,28)
"("
LitG

(32,10)-(32,13)
exprToString e1
AppG (fromList [VarG])

(32,17)-(32,34)
"/"
LitG

(32,38)-(32,41)
exprToString e2
AppG (fromList [VarG])

(32,45)-(32,62)
"/"
LitG

(32,65)-(32,68)
exprToString e3 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(31,7)-(31,28)
(31,8)-(31,11)
*)
