
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      ("(" "1/sin(pi*") ^
        ((exprToString e1) ^
           (")" ^
              ("cos(pi*" ^
                 ((exprToString e1) ^
                    (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")"))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      "(" ^
        ("1/sin(pi*" ^
           ((exprToString e1) ^
              (")" ^
                 ("cos(pi*" ^
                    ((exprToString e1) ^
                       (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")")))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,7)-(31,24)
"("
LitG

(32,10)-(32,27)
"1/sin(pi*"
LitG

(33,13)-(33,16)
exprToString e1
AppG (fromList [VarG])

(34,16)-(34,25)
")"
LitG

(35,19)-(35,36)
"cos(pi*"
LitG

(36,22)-(36,25)
exprToString e1
AppG (fromList [VarG])

(36,29)-(36,38)
")"
LitG

(36,42)-(36,59)
"sin(pi*"
LitG

(36,63)-(36,66)
exprToString e1
AppG (fromList [VarG])

(36,69)-(36,72)
")" ^ ")"
AppG (fromList [LitG])

*)

(* type error slice
(31,7)-(31,24)
(31,8)-(31,11)
*)
