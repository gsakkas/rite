
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
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) + (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) * (exprToString e2)
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) + (exprToString e2);;


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
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(17,23)-(17,62)
(exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,24)-(17,41)
(^)
VarG

(17,24)-(17,41)
(^)
VarG

(17,24)-(17,41)
exprToString e1 ^ ("+" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(17,44)-(17,61)
(^)
VarG

(17,44)-(17,61)
"+" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,44)-(17,61)
"+"
LitG

(18,21)-(18,38)
(^)
VarG

(18,21)-(18,38)
exprToString e1 ^ ("*" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(18,21)-(18,58)
"/2"
LitG

(18,41)-(18,58)
(^)
VarG

(18,41)-(18,58)
"*" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,41)-(18,58)
"*"
LitG

(19,28)-(19,45)
(^)
VarG

(19,28)-(19,65)
exprToString e1 ^ ("+" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(19,48)-(19,65)
(^)
VarG

(19,48)-(19,65)
"+" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,48)-(19,65)
"+"
LitG

*)
