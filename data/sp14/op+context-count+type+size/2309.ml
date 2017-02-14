
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
  | Sine var1 -> ("sin (pi*" + (exprToString var1)) + ")"
  | Cosine var2 -> ("cos (pi*" + (exprToString var2)) + ")"
  | Average (var3,var4) ->
      ((("((" exprToString var3) + " + ") + (exprToString var4)) + ")/2)"
  | Times (var5,var6) -> ((exprToString var5) + " * ") + (exprToString var6)
  | Thresh (var7,var8,var9,var0) ->
      ((((((("(" exprToString var7) + "<") + (exprToString var8)) + " ? ") +
           (exprToString var9))
          + " : ")
         + (exprToString var0))
        + ")";;


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
(15,17)-(15,51)
(15,17)-(15,57)
(15,18)-(15,28)
(15,31)-(15,50)
(16,19)-(16,53)
(16,19)-(16,59)
(16,20)-(16,30)
(16,33)-(16,52)
(18,6)-(18,64)
(18,6)-(18,73)
(18,7)-(18,41)
(18,9)-(18,13)
(18,14)-(18,26)
(18,35)-(18,40)
(18,44)-(18,63)
(19,25)-(19,54)
(19,25)-(19,76)
(19,26)-(19,45)
(19,48)-(19,53)
(21,6)-(24,31)
(21,6)-(25,13)
(21,7)-(23,18)
(21,8)-(22,31)
(21,9)-(21,74)
(21,10)-(21,65)
(21,11)-(21,42)
(21,13)-(21,16)
(21,17)-(21,29)
(21,38)-(21,41)
(21,45)-(21,64)
(21,46)-(21,58)
(21,59)-(21,63)
(21,68)-(21,73)
(22,11)-(22,30)
(22,12)-(22,24)
(22,25)-(22,29)
(23,12)-(23,17)
(24,11)-(24,30)
(24,12)-(24,24)
(24,25)-(24,29)
(25,10)-(25,13)
*)

(* type error slice
(11,3)-(25,15)
(11,21)-(25,13)
(12,2)-(25,13)
(12,2)-(25,13)
(12,2)-(25,13)
(12,2)-(25,13)
(12,2)-(25,13)
(12,2)-(25,13)
(13,13)-(13,16)
(15,17)-(15,51)
(15,17)-(15,51)
(15,17)-(15,57)
(15,17)-(15,57)
(15,18)-(15,28)
(15,31)-(15,50)
(15,32)-(15,44)
(15,54)-(15,57)
(16,19)-(16,53)
(16,19)-(16,59)
(16,19)-(16,59)
(16,20)-(16,30)
(16,56)-(16,59)
(18,6)-(18,73)
(18,6)-(18,73)
(18,7)-(18,41)
(18,8)-(18,32)
(18,9)-(18,13)
(18,35)-(18,40)
(18,67)-(18,73)
(19,25)-(19,54)
(19,25)-(19,76)
(19,48)-(19,53)
(21,6)-(25,13)
(21,6)-(25,13)
(21,7)-(23,18)
(21,9)-(21,74)
(21,11)-(21,42)
(21,12)-(21,35)
(21,13)-(21,16)
(21,38)-(21,41)
(21,68)-(21,73)
(23,12)-(23,17)
(25,10)-(25,13)
*)
