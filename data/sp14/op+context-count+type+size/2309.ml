
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
(15,19)-(15,29)
(15,19)-(15,50)
(15,19)-(15,58)
(15,33)-(15,50)
(16,21)-(16,31)
(16,21)-(16,52)
(16,21)-(16,60)
(16,35)-(16,52)
(18,10)-(18,14)
(18,10)-(18,41)
(18,10)-(18,63)
(18,10)-(18,74)
(18,15)-(18,27)
(18,36)-(18,41)
(18,46)-(18,63)
(19,28)-(19,45)
(19,28)-(19,54)
(19,28)-(19,76)
(19,49)-(19,54)
(21,14)-(21,17)
(21,14)-(21,42)
(21,14)-(21,64)
(21,14)-(21,74)
(21,14)-(22,30)
(21,14)-(23,18)
(21,14)-(24,30)
(21,14)-(25,14)
(21,18)-(21,30)
(21,39)-(21,42)
(21,47)-(21,59)
(21,47)-(21,64)
(21,60)-(21,64)
(21,69)-(21,74)
(22,13)-(22,25)
(22,13)-(22,30)
(22,26)-(22,30)
(23,13)-(23,18)
(24,13)-(24,25)
(24,13)-(24,30)
(24,26)-(24,30)
(25,11)-(25,14)
*)

(* type error slice
(11,4)-(25,16)
(11,22)-(25,14)
(12,3)-(25,14)
(12,3)-(25,14)
(12,3)-(25,14)
(12,3)-(25,14)
(12,3)-(25,14)
(12,3)-(25,14)
(13,14)-(13,17)
(15,19)-(15,29)
(15,19)-(15,50)
(15,19)-(15,50)
(15,19)-(15,58)
(15,19)-(15,58)
(15,33)-(15,45)
(15,33)-(15,50)
(15,55)-(15,58)
(16,21)-(16,31)
(16,21)-(16,52)
(16,21)-(16,60)
(16,21)-(16,60)
(16,57)-(16,60)
(18,10)-(18,14)
(18,10)-(18,32)
(18,10)-(18,41)
(18,10)-(18,74)
(18,10)-(18,74)
(18,36)-(18,41)
(18,68)-(18,74)
(19,28)-(19,54)
(19,28)-(19,76)
(19,49)-(19,54)
(21,14)-(21,17)
(21,14)-(21,35)
(21,14)-(21,42)
(21,14)-(21,74)
(21,14)-(23,18)
(21,14)-(25,14)
(21,14)-(25,14)
(21,39)-(21,42)
(21,69)-(21,74)
(23,13)-(23,18)
(25,11)-(25,14)
*)
