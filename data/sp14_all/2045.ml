
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
(27,16)-(27,28)
exprToString n
AppG (fromList [VarG])

*)

(* type error slice
(17,28)-(17,44)
(17,29)-(17,41)
(27,15)-(30,78)
(27,16)-(27,28)
(27,29)-(27,30)
*)
