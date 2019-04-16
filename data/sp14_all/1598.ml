
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           (("<" exprToString e2) ^
              (" ? " ^
                 ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")"))))));;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(23,13)-(23,34)
"<"
LitG

(24,16)-(24,21)
exprToString e2
AppG (fromList [VarG])

(25,19)-(25,36)
" ? "
LitG

(25,40)-(25,45)
exprToString e3
AppG (fromList [VarG])

(25,49)-(25,66)
" : "
LitG

(25,69)-(25,72)
exprToString e4 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(23,13)-(23,34)
(23,14)-(23,17)
*)
