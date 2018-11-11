
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
(16,26)-(16,27)
exprToString
VarG

(16,26)-(16,27)
exprToString e
AppG [VarG]

(17,23)-(17,25)
exprToString
VarG

(17,23)-(17,25)
exprToString e1
AppG [VarG]

(17,36)-(17,38)
exprToString
VarG

(17,36)-(17,38)
exprToString e2
AppG [VarG]

(18,21)-(18,23)
exprToString
VarG

(18,21)-(18,23)
exprToString e1
AppG [VarG]

(18,33)-(18,35)
exprToString
VarG

(18,33)-(18,35)
exprToString e2
AppG [VarG]

(19,28)-(19,30)
exprToString
VarG

(19,28)-(19,30)
exprToString e1
AppG [VarG]

(19,41)-(19,43)
exprToString
VarG

(19,41)-(19,43)
exprToString e2
AppG [VarG]

(19,54)-(19,56)
exprToString
VarG

(19,54)-(19,56)
exprToString e3
AppG [VarG]

(19,66)-(19,68)
exprToString
VarG

(19,66)-(19,68)
exprToString e4
AppG [VarG]

*)
