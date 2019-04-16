
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
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2 "?") ^
                 ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")"))))));;


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
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(24,16)-(24,37)
exprToString e2
AppG (fromList [VarG])

(25,19)-(25,36)
"?"
LitG

(25,40)-(25,43)
exprToString e3
AppG (fromList [VarG])

(25,47)-(25,64)
":"
LitG

(25,67)-(25,70)
exprToString e4 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,15)-(15,39)
(15,21)-(15,22)
(15,23)-(15,39)
(15,24)-(15,36)
(24,16)-(24,37)
(24,17)-(24,29)
*)
