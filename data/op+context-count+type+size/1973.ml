
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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (("+" exprToString b) ^ ")/20"))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;


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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/20")))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;

*)

(* changed spans
(21,36)-(21,54)
(21,40)-(21,52)
*)

(* type error slice
(11,22)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,3)-(25,17)
(12,9)-(12,10)
(14,7)-(14,10)
(14,7)-(18,75)
(14,11)-(14,12)
(15,11)-(15,23)
(15,11)-(15,25)
(15,11)-(15,25)
(15,11)-(18,75)
(15,24)-(15,25)
(15,27)-(15,28)
(16,13)-(16,16)
(16,13)-(18,75)
(16,17)-(16,18)
(17,17)-(17,29)
(17,17)-(17,31)
(17,17)-(18,75)
(17,30)-(17,31)
(17,33)-(17,34)
(18,19)-(18,22)
(18,19)-(18,75)
(18,23)-(18,24)
(18,27)-(18,39)
(18,27)-(18,41)
(18,27)-(18,75)
(18,40)-(18,41)
(18,43)-(18,44)
(18,46)-(18,49)
(18,46)-(18,75)
(18,50)-(18,51)
(18,54)-(18,66)
(18,54)-(18,68)
(18,54)-(18,75)
(18,54)-(18,75)
(18,67)-(18,68)
(18,70)-(18,71)
(18,72)-(18,75)
(19,21)-(19,33)
(19,21)-(19,35)
(19,21)-(19,61)
(19,34)-(19,35)
(19,37)-(19,38)
(19,40)-(19,43)
(19,40)-(19,61)
(19,44)-(19,45)
(19,47)-(19,59)
(19,47)-(19,61)
(19,60)-(19,61)
(21,7)-(21,11)
(21,12)-(21,13)
(21,16)-(21,28)
(21,16)-(21,30)
(21,29)-(21,30)
(21,32)-(21,33)
(21,36)-(21,39)
(21,36)-(21,54)
(21,40)-(21,52)
(21,53)-(21,54)
(21,56)-(21,57)
*)
