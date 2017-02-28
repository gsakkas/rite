
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Square e -> "%s*%s" exprToString e exprToString e;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Square e -> (exprToString e) ^ ("*" ^ (exprToString e));;

*)

(* changed spans
(28,16)-(28,23)
(28,16)-(28,53)
(28,24)-(28,36)
(28,37)-(28,38)
(28,39)-(28,51)
*)

(* type error slice
(28,16)-(28,23)
(28,16)-(28,53)
*)

(* all spans
(12,21)-(28,53)
(13,2)-(28,53)
(13,8)-(13,9)
(14,13)-(14,16)
(15,13)-(15,16)
(16,14)-(16,50)
(16,24)-(16,25)
(16,14)-(16,23)
(16,26)-(16,50)
(16,44)-(16,45)
(16,27)-(16,43)
(16,28)-(16,40)
(16,41)-(16,42)
(16,46)-(16,49)
(17,16)-(17,52)
(17,26)-(17,27)
(17,16)-(17,25)
(17,28)-(17,52)
(17,46)-(17,47)
(17,29)-(17,45)
(17,30)-(17,42)
(17,43)-(17,44)
(17,48)-(17,51)
(19,6)-(19,71)
(19,11)-(19,12)
(19,6)-(19,10)
(19,13)-(19,71)
(19,32)-(19,33)
(19,14)-(19,31)
(19,15)-(19,27)
(19,28)-(19,30)
(19,34)-(19,70)
(19,39)-(19,40)
(19,35)-(19,38)
(19,41)-(19,69)
(19,60)-(19,61)
(19,42)-(19,59)
(19,43)-(19,55)
(19,56)-(19,58)
(19,62)-(19,68)
(20,21)-(20,66)
(20,39)-(20,40)
(20,21)-(20,38)
(20,22)-(20,34)
(20,35)-(20,37)
(20,41)-(20,66)
(20,46)-(20,47)
(20,42)-(20,45)
(20,48)-(20,65)
(20,49)-(20,61)
(20,62)-(20,64)
(22,6)-(27,79)
(22,10)-(22,11)
(22,6)-(22,9)
(23,8)-(27,79)
(23,27)-(23,28)
(23,9)-(23,26)
(23,10)-(23,22)
(23,23)-(23,25)
(24,11)-(27,78)
(24,16)-(24,17)
(24,12)-(24,15)
(25,14)-(27,77)
(25,33)-(25,34)
(25,15)-(25,32)
(25,16)-(25,28)
(25,29)-(25,31)
(26,17)-(27,76)
(26,22)-(26,23)
(26,18)-(26,21)
(27,20)-(27,75)
(27,39)-(27,40)
(27,21)-(27,38)
(27,22)-(27,34)
(27,35)-(27,37)
(27,41)-(27,74)
(27,46)-(27,47)
(27,42)-(27,45)
(27,48)-(27,73)
(27,67)-(27,68)
(27,49)-(27,66)
(27,50)-(27,62)
(27,63)-(27,65)
(27,69)-(27,72)
(28,16)-(28,53)
(28,16)-(28,23)
(28,24)-(28,36)
(28,37)-(28,38)
(28,39)-(28,51)
(28,52)-(28,53)
*)
