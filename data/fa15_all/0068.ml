
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
  | Sine e' -> ("sin(pi*" + (exprToString e')) + ")"
  | Cosine e' -> ("cos(pi*" + (exprToString e')) + ")"
  | Average (e1,e2) ->
      ((("((" + (exprToString e1)) + "+") + (exprToString e2)) + ")/2)"
  | Times (e1,e2) -> ((exprToString e1) + "*") + (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      ((((((("(" + (exprToString e1)) + "<") + (exprToString e2)) + "?") +
           (exprToString e3))
          + ":")
         + (exprToString e4))
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
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(15,15)-(15,46)
"sin(pi*" ^ (exprToString e' ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(15,16)-(15,25)
(^)
VarG

(15,28)-(15,45)
(^)
VarG

(15,28)-(15,45)
exprToString e' ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,17)-(16,48)
"cos(pi*" ^ (exprToString e' ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,18)-(16,27)
(^)
VarG

(16,30)-(16,47)
(^)
VarG

(16,30)-(16,47)
exprToString e' ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,8)-(18,34)
"((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,9)-(18,13)
(^)
VarG

(18,16)-(18,33)
(^)
VarG

(18,16)-(18,33)
exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)"))
AppG (fromList [AppG (fromList [EmptyG])])

(18,37)-(18,40)
(^)
VarG

(18,37)-(18,40)
"+" ^ (exprToString e2 ^ ")/2)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,44)-(18,61)
(^)
VarG

(18,44)-(18,61)
exprToString e2 ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,21)-(19,46)
exprToString e1 ^ ("*" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(19,22)-(19,39)
(^)
VarG

(19,42)-(19,45)
(^)
VarG

(19,42)-(19,45)
"*" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,12)-(21,37)
"(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,13)-(21,16)
(^)
VarG

(21,19)-(21,36)
(^)
VarG

(21,19)-(21,36)
exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")"))))))
AppG (fromList [AppG (fromList [EmptyG])])

(21,40)-(21,43)
(^)
VarG

(21,40)-(21,43)
"<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,47)-(21,64)
(^)
VarG

(21,47)-(21,64)
exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")"))))
AppG (fromList [AppG (fromList [EmptyG])])

(21,68)-(21,71)
(^)
VarG

(21,68)-(21,71)
"?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(22,11)-(22,28)
(^)
VarG

(22,11)-(22,28)
exprToString e3 ^ (":" ^ (exprToString e4 ^ ")"))
AppG (fromList [AppG (fromList [EmptyG])])

(23,12)-(23,15)
(^)
VarG

(23,12)-(23,15)
":" ^ (exprToString e4 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(24,11)-(24,28)
(^)
VarG

(24,11)-(24,28)
exprToString e4 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
