
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | MyExpr of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine m -> "sin(pi*" ^ ((exprToString m) ^ ")")
  | Cosine m -> "cos(pi*" ^ ((exprToString m) ^ ")")
  | Square m -> "(" ^ ((exprToString m) ^ "^2)")
  | Average (m,n) ->
      "((" ^ ((exprToString m) ^ ("+" ^ ((exprToString n) ^ ")/2)")))
  | Times (m,n) -> (exprToString m) ^ ("*" ^ (exprToString n))
  | MyExpr (m,n,o) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              (exprToString ^
                 ("?sqrt(|" ^
                    ((exprToString o) ^
                       ("|)" ^ (":" ^ ("(" ^ ((exprToString o) ^ "/2)")))))))))
  | Thresh (m,n,o,p) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?" ^ ((exprToString o) ^ (":" ^ ((exprToString p) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | MyExpr of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine m -> "sin(pi*" ^ ((exprToString m) ^ ")")
  | Cosine m -> "cos(pi*" ^ ((exprToString m) ^ ")")
  | Square m -> "(" ^ ((exprToString m) ^ "^2)")
  | Average (m,n) ->
      "((" ^ ((exprToString m) ^ ("+" ^ ((exprToString n) ^ ")/2)")))
  | Times (m,n) -> (exprToString m) ^ ("*" ^ (exprToString n))
  | MyExpr (m,n,o) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?sqrt(|" ^
                    ((exprToString o) ^
                       ("|)" ^ (":" ^ ("(" ^ ((exprToString o) ^ "/2)")))))))))
  | Thresh (m,n,o,p) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?" ^ ((exprToString o) ^ (":" ^ ((exprToString p) ^ ")")))))));;

*)

(* changed spans
(27,15)-(27,27)
(28,17)-(30,76)
*)

(* type error slice
(17,27)-(17,43)
(17,28)-(17,40)
(27,14)-(30,77)
(27,15)-(27,27)
(27,28)-(27,29)
*)
