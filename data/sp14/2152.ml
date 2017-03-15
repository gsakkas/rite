
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
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      ("(" exprToString var7) ^
        ("<" ^
           ((exprToString var8) ^
              (" ? " ^
                 ((exprToString var9) ^ (" : " ^ ((exprToString var0) ^ ")"))))));;


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
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      "(" ^
        ((exprToString var7) ^
           ("<" ^
              ((exprToString var8) ^
                 (" ? " ^
                    ((exprToString var9) ^
                       (" : " ^ ((exprToString var0) ^ ")")))))));;

*)

(* changed spans
(21,6)-(21,29)
(21,11)-(21,23)
*)

(* type error slice
(21,6)-(21,29)
(21,7)-(21,10)
*)

(* all spans
(11,21)-(25,81)
(12,2)-(25,81)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,17)-(15,57)
(15,28)-(15,29)
(15,17)-(15,27)
(15,30)-(15,57)
(15,51)-(15,52)
(15,31)-(15,50)
(15,32)-(15,44)
(15,45)-(15,49)
(15,53)-(15,56)
(16,19)-(16,59)
(16,30)-(16,31)
(16,19)-(16,29)
(16,32)-(16,59)
(16,53)-(16,54)
(16,33)-(16,52)
(16,34)-(16,46)
(16,47)-(16,51)
(16,55)-(16,58)
(18,6)-(18,77)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,77)
(18,34)-(18,35)
(18,14)-(18,33)
(18,15)-(18,27)
(18,28)-(18,32)
(18,36)-(18,76)
(18,43)-(18,44)
(18,37)-(18,42)
(18,45)-(18,75)
(18,66)-(18,67)
(18,46)-(18,65)
(18,47)-(18,59)
(18,60)-(18,64)
(18,68)-(18,74)
(19,25)-(19,76)
(19,45)-(19,46)
(19,25)-(19,44)
(19,26)-(19,38)
(19,39)-(19,43)
(19,47)-(19,76)
(19,54)-(19,55)
(19,48)-(19,53)
(19,56)-(19,75)
(19,57)-(19,69)
(19,70)-(19,74)
(21,6)-(25,81)
(21,30)-(21,31)
(21,6)-(21,29)
(21,7)-(21,10)
(21,11)-(21,23)
(21,24)-(21,28)
(22,8)-(25,81)
(22,13)-(22,14)
(22,9)-(22,12)
(23,11)-(25,80)
(23,32)-(23,33)
(23,12)-(23,31)
(23,13)-(23,25)
(23,26)-(23,30)
(24,14)-(25,79)
(24,21)-(24,22)
(24,15)-(24,20)
(25,17)-(25,78)
(25,38)-(25,39)
(25,18)-(25,37)
(25,19)-(25,31)
(25,32)-(25,36)
(25,40)-(25,77)
(25,47)-(25,48)
(25,41)-(25,46)
(25,49)-(25,76)
(25,70)-(25,71)
(25,50)-(25,69)
(25,51)-(25,63)
(25,64)-(25,68)
(25,72)-(25,75)
*)
