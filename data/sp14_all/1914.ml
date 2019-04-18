
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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ (e ^ ")")
  | Average (e1,e2) -> e1 ^ ("+" ^ (e2 ^ "/2"))
  | Times (e1,e2) -> e1 ^ ("*" ^ e2)
  | Thresh (e1,e2,e3,e4) -> e1 ^ ("<" ^ (e2 ^ ("?" ^ (e3 ^ (":" ^ e4)))));;


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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(16,27)-(16,28)
exprToString e
AppG (fromList [VarG])

(17,24)-(17,26)
exprToString e1
AppG (fromList [VarG])

(17,37)-(17,39)
exprToString e2
AppG (fromList [VarG])

(18,22)-(18,24)
exprToString e1
AppG (fromList [VarG])

(18,34)-(18,36)
exprToString e2
AppG (fromList [VarG])

(19,29)-(19,31)
exprToString e1
AppG (fromList [VarG])

(19,42)-(19,44)
exprToString e2
AppG (fromList [VarG])

(19,55)-(19,57)
exprToString e3
AppG (fromList [VarG])

(19,67)-(19,69)
exprToString e4
AppG (fromList [VarG])

*)

(* type error slice
(12,3)-(19,74)
(16,26)-(16,35)
(16,27)-(16,28)
(16,29)-(16,30)
(17,24)-(17,26)
(17,24)-(17,48)
(17,27)-(17,28)
(17,36)-(17,47)
(17,37)-(17,39)
(17,40)-(17,41)
(18,22)-(18,24)
(18,22)-(18,37)
(18,25)-(18,26)
(18,27)-(18,37)
(18,32)-(18,33)
(18,34)-(18,36)
(19,29)-(19,31)
(19,29)-(19,74)
(19,32)-(19,33)
(19,41)-(19,73)
(19,42)-(19,44)
(19,45)-(19,46)
(19,54)-(19,71)
(19,55)-(19,57)
(19,58)-(19,59)
(19,60)-(19,70)
(19,65)-(19,66)
(19,67)-(19,69)
*)
