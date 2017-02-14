
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
(12,2)-(19,24)
(15,14)-(15,27)
(15,14)-(15,29)
(15,28)-(15,29)
(16,16)-(16,29)
(16,16)-(16,31)
(16,30)-(16,31)
(17,22)-(17,26)
(17,22)-(17,68)
(17,42)-(17,45)
(17,46)-(17,58)
(17,59)-(17,61)
(17,62)-(17,68)
(18,20)-(18,32)
(18,20)-(18,54)
(18,35)-(18,38)
(18,39)-(18,51)
(18,52)-(18,54)
(19,16)-(19,24)
*)

(* type error slice
(15,14)-(15,27)
(15,14)-(15,29)
(16,16)-(16,29)
(16,16)-(16,31)
(17,22)-(17,26)
(17,22)-(17,68)
(18,20)-(18,32)
(18,20)-(18,54)
(18,39)-(18,51)
*)
