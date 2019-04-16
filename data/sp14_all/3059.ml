
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
(15,18)-(15,58)
"sin (pi*" ^ (exprToString var1 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,20)-(16,60)
"cos (pi*" ^ (exprToString var2 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,7)-(18,74)
"((" ^ (exprToString var3 ^ (" + " ^ (exprToString var4 ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,26)-(19,77)
exprToString var5 ^ (" * " ^ exprToString var6)
AppG (fromList [AppG (fromList [EmptyG])])

(21,7)-(25,14)
"(" ^ (exprToString var7 ^ ("<" ^ (exprToString var8 ^ (" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(25,16)
(11,22)-(25,14)
(12,3)-(25,14)
(13,14)-(13,17)
(15,18)-(15,52)
(15,18)-(15,58)
(15,19)-(15,29)
(15,32)-(15,51)
(15,33)-(15,45)
(15,55)-(15,58)
(16,20)-(16,54)
(16,20)-(16,60)
(16,21)-(16,31)
(16,57)-(16,60)
(18,7)-(18,74)
(18,8)-(18,42)
(18,9)-(18,33)
(18,10)-(18,14)
(18,36)-(18,41)
(18,68)-(18,74)
(19,26)-(19,55)
(19,26)-(19,77)
(19,49)-(19,54)
(21,7)-(25,14)
(21,8)-(23,19)
(21,10)-(21,75)
(21,12)-(21,43)
(21,13)-(21,36)
(21,14)-(21,17)
(21,39)-(21,42)
(21,69)-(21,74)
(23,13)-(23,18)
(25,11)-(25,14)
*)
