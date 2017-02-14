
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
  | Sine e -> "sin(pi*" exprToString e ")"
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
(15,15)-(15,24)
(15,15)-(15,43)
(15,25)-(15,37)
(16,17)-(16,27)
(16,17)-(16,46)
(16,28)-(16,40)
(17,23)-(17,27)
(17,23)-(17,69)
(17,28)-(17,40)
(17,43)-(17,46)
(17,47)-(17,59)
(18,21)-(18,33)
(18,21)-(18,55)
(18,36)-(18,39)
(18,40)-(18,52)
(18,53)-(18,55)
(20,7)-(20,10)
(20,7)-(21,28)
(20,11)-(20,23)
(20,24)-(20,26)
(20,27)-(20,30)
(20,31)-(20,43)
(20,44)-(20,46)
(20,47)-(20,50)
(20,51)-(20,63)
(20,64)-(20,66)
(20,67)-(20,70)
(21,9)-(21,21)
(21,22)-(21,24)
(21,25)-(21,28)
*)

(* type error slice
(15,15)-(15,24)
(15,15)-(15,43)
(16,17)-(16,27)
(16,17)-(16,46)
(17,23)-(17,27)
(17,23)-(17,69)
(18,21)-(18,33)
(18,21)-(18,55)
(18,40)-(18,52)
(20,7)-(20,10)
(20,7)-(21,28)
*)
