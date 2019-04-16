
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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> ((exprToString x) + "*") ^ (exprToString y)
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 (("?" exprToString c) ^ (":" ^ (exprToString d))))));;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(19,20)-(19,44)
exprToString x
AppG (fromList [VarG])

(19,47)-(19,63)
"*" ^ exprToString y
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(25,19)-(25,39)
"?"
LitG

(25,43)-(25,46)
exprToString c
AppG (fromList [VarG])

(25,49)-(25,65)
":" ^ exprToString d
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,27)-(15,51)
(15,28)-(15,44)
(15,29)-(15,41)
(15,45)-(15,46)
(19,20)-(19,44)
(19,20)-(19,63)
(19,21)-(19,37)
(19,22)-(19,34)
(19,40)-(19,43)
(19,45)-(19,46)
(25,19)-(25,39)
(25,20)-(25,23)
*)
