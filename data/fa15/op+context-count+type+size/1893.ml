
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
  | Average (e,ex) -> "(" exprToString e "+" exprToString ex ")/2"
  | Times e -> "Times"
  | Thresh e -> "Thresh";;


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
(12,2)-(19,24)
(15,14)-(15,27)
(15,14)-(15,29)
(16,16)-(16,29)
(16,16)-(16,31)
(16,30)-(16,31)
(17,22)-(17,25)
(17,22)-(17,66)
(17,41)-(17,44)
(17,45)-(17,57)
(17,58)-(17,60)
(17,61)-(17,66)
(18,15)-(18,22)
(19,16)-(19,24)
*)

(* type error slice
(15,14)-(15,27)
(15,14)-(15,29)
(16,16)-(16,29)
(16,16)-(16,31)
(17,22)-(17,25)
(17,22)-(17,66)
*)
