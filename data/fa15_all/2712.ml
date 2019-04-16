
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
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" exprToString a ")"
  | Average (a,b) -> "((" exprToString a "+" exprToString b ")/2)"
  | Times (a,b) -> exprToString a "*" exprToString b
  | Thresh (a,b,c,d) ->
      "(" exprToString a "<" exprToString b "?" exprToString c ":"
        exprToString d ")";;


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
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))));;

*)

(* changed spans
(16,17)-(16,45)
"cos(pi*" ^ (exprToString a ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,22)-(17,67)
"((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,20)-(18,53)
exprToString a ^ ("*" ^ exprToString b)
AppG (fromList [AppG (fromList [EmptyG])])

(20,7)-(21,27)
"(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,27)-(15,51)
(15,28)-(15,44)
(15,29)-(15,41)
(15,45)-(15,46)
(16,17)-(16,26)
(16,17)-(16,45)
(17,22)-(17,26)
(17,22)-(17,67)
(18,20)-(18,32)
(18,20)-(18,53)
(20,7)-(20,10)
(20,7)-(21,27)
*)
