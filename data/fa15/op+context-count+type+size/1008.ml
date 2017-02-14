
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
  | Sine a -> "sin(pi*" exprToString a ")"
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
(15,15)-(15,24)
(15,15)-(15,43)
(15,25)-(15,37)
(16,17)-(16,26)
(16,17)-(16,45)
(16,27)-(16,39)
(17,22)-(17,26)
(17,22)-(17,67)
(17,27)-(17,39)
(17,42)-(17,45)
(17,46)-(17,58)
(18,20)-(18,32)
(18,20)-(18,53)
(18,33)-(18,34)
(18,35)-(18,38)
(18,39)-(18,51)
(18,52)-(18,53)
(20,7)-(20,10)
(20,7)-(21,27)
(20,11)-(20,23)
(20,26)-(20,29)
(20,30)-(20,42)
(20,43)-(20,44)
(20,45)-(20,48)
(20,49)-(20,61)
(20,62)-(20,63)
(20,64)-(20,67)
(21,9)-(21,21)
(21,22)-(21,23)
(21,24)-(21,27)
*)

(* type error slice
(15,15)-(15,24)
(15,15)-(15,43)
(16,17)-(16,26)
(16,17)-(16,45)
(17,22)-(17,26)
(17,22)-(17,67)
(18,20)-(18,32)
(18,20)-(18,53)
(18,39)-(18,51)
(20,7)-(20,10)
(20,7)-(21,27)
*)
