
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
(21,8)-(21,29)
(21,12)-(21,24)
*)

(* type error slice
(11,22)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,3)-(25,76)
(12,9)-(12,10)
(15,18)-(15,28)
(15,18)-(15,57)
(15,29)-(15,30)
(15,33)-(15,45)
(15,33)-(15,50)
(15,33)-(15,50)
(15,33)-(15,57)
(15,33)-(15,57)
(15,46)-(15,50)
(15,52)-(15,53)
(15,54)-(15,57)
(16,20)-(16,30)
(16,20)-(16,59)
(16,31)-(16,32)
(16,35)-(16,47)
(16,35)-(16,52)
(16,35)-(16,59)
(16,48)-(16,52)
(16,54)-(16,55)
(16,56)-(16,59)
(18,7)-(18,11)
(18,7)-(18,75)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,33)
(18,16)-(18,75)
(18,29)-(18,33)
(18,35)-(18,36)
(18,38)-(18,43)
(18,38)-(18,75)
(18,44)-(18,45)
(18,48)-(18,60)
(18,48)-(18,65)
(18,48)-(18,75)
(18,61)-(18,65)
(18,67)-(18,68)
(18,69)-(18,75)
(19,27)-(19,39)
(19,27)-(19,44)
(19,27)-(19,75)
(19,40)-(19,44)
(19,46)-(19,47)
(19,49)-(19,54)
(19,49)-(19,75)
(19,55)-(19,56)
(19,58)-(19,70)
(19,58)-(19,75)
(19,71)-(19,75)
(21,8)-(21,11)
(21,8)-(21,29)
(21,12)-(21,24)
(21,25)-(21,29)
(21,31)-(21,32)
*)
