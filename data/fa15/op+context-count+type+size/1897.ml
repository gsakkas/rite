
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
  | Cosine e -> "cos (pi*" exprToString e ")"
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
(16,16)-(16,26)
(16,16)-(16,45)
(16,27)-(16,39)
(17,22)-(17,26)
(17,22)-(17,68)
(17,27)-(17,39)
(17,42)-(17,45)
(17,46)-(17,58)
(18,20)-(18,32)
(18,20)-(18,54)
(18,35)-(18,38)
(18,39)-(18,51)
(18,52)-(18,54)
(20,6)-(20,9)
(20,6)-(21,27)
(20,10)-(20,22)
(20,23)-(20,25)
(20,26)-(20,29)
(20,30)-(20,42)
(20,43)-(20,45)
(20,46)-(20,49)
(20,50)-(20,62)
(20,63)-(20,65)
(20,66)-(20,69)
(21,8)-(21,20)
(21,21)-(21,23)
(21,24)-(21,27)
*)

(* type error slice
(15,27)-(15,51)
(15,28)-(15,44)
(15,29)-(15,41)
(15,45)-(15,46)
(16,16)-(16,26)
(16,16)-(16,45)
(17,22)-(17,26)
(17,22)-(17,68)
(18,20)-(18,32)
(18,20)-(18,54)
(20,6)-(20,9)
(20,6)-(21,27)
*)
