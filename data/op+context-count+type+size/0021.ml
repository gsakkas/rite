
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
(28,19)-(30,71)
*)

(* type error slice
(14,3)-(36,75)
(17,29)-(17,41)
(17,29)-(17,43)
(17,42)-(17,43)
(27,16)-(27,28)
(27,16)-(30,71)
(27,29)-(27,30)
(28,19)-(28,28)
(28,19)-(30,71)
(28,29)-(28,30)
(29,23)-(29,35)
(29,23)-(29,37)
(29,23)-(30,71)
(29,36)-(29,37)
(29,39)-(29,40)
(30,25)-(30,29)
(30,25)-(30,71)
(30,30)-(30,31)
(30,33)-(30,36)
(30,33)-(30,71)
(30,37)-(30,38)
(30,40)-(30,43)
(30,40)-(30,71)
(30,44)-(30,45)
(30,48)-(30,60)
(30,48)-(30,62)
(30,48)-(30,71)
(30,61)-(30,62)
(30,64)-(30,65)
(30,66)-(30,71)
*)
