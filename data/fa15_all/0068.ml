
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
(15,16)-(15,53)
"sin(pi*" ^ (exprToString e' ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,18)-(16,55)
"cos(pi*" ^ (exprToString e' ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,7)-(18,72)
"((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,22)-(19,67)
exprToString e1 ^ ("*" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(21,7)-(25,14)
"(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(25,16)
(11,22)-(25,14)
(12,3)-(25,14)
(13,14)-(13,17)
(15,16)-(15,47)
(15,16)-(15,53)
(15,17)-(15,26)
(15,29)-(15,46)
(15,30)-(15,42)
(15,50)-(15,53)
(16,18)-(16,49)
(16,18)-(16,55)
(16,19)-(16,28)
(16,52)-(16,55)
(18,7)-(18,72)
(18,8)-(18,42)
(18,9)-(18,35)
(18,10)-(18,14)
(18,38)-(18,41)
(18,66)-(18,72)
(19,22)-(19,47)
(19,22)-(19,67)
(19,43)-(19,46)
(21,7)-(25,14)
(21,8)-(23,17)
(21,10)-(21,73)
(21,12)-(21,45)
(21,13)-(21,38)
(21,14)-(21,17)
(21,41)-(21,44)
(21,69)-(21,72)
(23,13)-(23,16)
(25,11)-(25,14)
*)
