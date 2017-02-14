
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
(12,3)-(19,25)
(15,15)-(15,28)
(15,15)-(15,30)
(15,29)-(15,30)
(16,17)-(16,30)
(16,17)-(16,32)
(16,31)-(16,32)
(17,23)-(17,27)
(17,23)-(17,69)
(17,43)-(17,46)
(17,47)-(17,59)
(17,60)-(17,62)
(17,63)-(17,69)
(18,21)-(18,33)
(18,21)-(18,55)
(18,36)-(18,39)
(18,40)-(18,52)
(18,53)-(18,55)
(19,17)-(19,25)
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
*)
