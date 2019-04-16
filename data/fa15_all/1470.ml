
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
  | Sine e -> "sin (pi*%s)" e
  | Cosine e -> "cos (pi*%s)" e
  | Average (e,ex) -> "((" exprToString e "+" exprToString ex ")/2)"
  | Times (e,ex) -> exprToString e "*" exprToString ex
  | Thresh (e1,e2,e3,e4) ->
      "(" exprToString e1 "<" exprToString e2 "?" exprToString e3 ":"
        exprToString e4 ")";;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos (pi*" ^ ((exprToString e) ^ ")")
  | Average (e,ex) ->
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString ex) ^ ")/2)")))
  | Times (e,ex) -> (exprToString e) ^ ("*" ^ (exprToString ex))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(15,15)-(15,30)
"sin (pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,17)-(16,32)
"cos (pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,23)-(17,69)
"((" ^ (exprToString e ^ ("+" ^ (exprToString ex ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,21)-(18,55)
exprToString e ^ ("*" ^ exprToString ex)
AppG (fromList [AppG (fromList [EmptyG])])

(20,7)-(21,28)
"(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,15)-(15,28)
(15,15)-(15,30)
(16,17)-(16,30)
(16,17)-(16,32)
(17,23)-(17,27)
(17,23)-(17,69)
(18,21)-(18,33)
(18,21)-(18,55)
(18,40)-(18,52)
(20,7)-(20,10)
(20,7)-(21,28)
*)
