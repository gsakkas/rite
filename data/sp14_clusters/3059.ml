
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
"sin (pi*" ^ (exprToString var1 ^ ")")
AppG [LitG,AppG [EmptyG,EmptyG]]

(15,18)-(15,28)
(^)
VarG

(15,31)-(15,50)
(^)
VarG

(15,31)-(15,50)
exprToString var1 ^ ")"
AppG [AppG [EmptyG],LitG]

(16,19)-(16,53)
"cos (pi*" ^ (exprToString var2 ^ ")")
AppG [LitG,AppG [EmptyG,EmptyG]]

(16,20)-(16,30)
(^)
VarG

(16,33)-(16,52)
(^)
VarG

(16,33)-(16,52)
exprToString var2 ^ ")"
AppG [AppG [EmptyG],LitG]

(18,9)-(18,13)
(^)
VarG

(18,14)-(18,26)
(^)
VarG

(18,14)-(18,26)
exprToString var3 ^ (" + " ^ (exprToString var4 ^ ")/2)"))
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(18,14)-(18,26)
exprToString var3
AppG [VarG]

(18,35)-(18,40)
(^)
VarG

(18,35)-(18,40)
" + " ^ (exprToString var4 ^ ")/2)")
AppG [LitG,AppG [EmptyG,EmptyG]]

(18,44)-(18,63)
(^)
VarG

(18,44)-(18,63)
exprToString var4 ^ ")/2)"
AppG [AppG [EmptyG],LitG]

(19,25)-(19,54)
exprToString var5 ^ (" * " ^ exprToString var6)
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(19,26)-(19,45)
(^)
VarG

(19,48)-(19,53)
(^)
VarG

(19,48)-(19,53)
" * " ^ exprToString var6
AppG [LitG,AppG [EmptyG]]

(21,13)-(21,16)
(^)
VarG

(21,17)-(21,29)
(^)
VarG

(21,17)-(21,29)
exprToString var7 ^ ("<" ^ (exprToString var8 ^ (" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")"))))))
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(21,17)-(21,29)
exprToString var7
AppG [VarG]

(21,38)-(21,41)
(^)
VarG

(21,38)-(21,41)
"<" ^ (exprToString var8 ^ (" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")")))))
AppG [LitG,AppG [EmptyG,EmptyG]]

(21,45)-(21,64)
(^)
VarG

(21,45)-(21,64)
exprToString var8 ^ (" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")"))))
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(21,68)-(21,73)
(^)
VarG

(21,68)-(21,73)
" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")")))
AppG [LitG,AppG [EmptyG,EmptyG]]

(22,11)-(22,30)
(^)
VarG

(22,11)-(22,30)
exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")"))
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(23,12)-(23,17)
(^)
VarG

(23,12)-(23,17)
" : " ^ (exprToString var0 ^ ")")
AppG [LitG,AppG [EmptyG,EmptyG]]

(24,11)-(24,30)
(^)
VarG

(24,11)-(24,30)
exprToString var0 ^ ")"
AppG [AppG [EmptyG],LitG]

*)
