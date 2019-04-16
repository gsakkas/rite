
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
  | Sine x -> ("sin(pi*" + (exprToString x)) + ")"
  | Cosine x -> ("cos(pi*" + (exprToString x)) + ")"
  | Average (x,y) ->
      ((("((" + (exprToString x)) + "*") + (exprToString y)) + ")/2)"
  | Times (x,y) -> ((exprToString x) + "*") + (exprToString y)
  | Thresh (a,b,c,d) ->
      ((((("(" + (exprToString a)) + "<") + (exprToString b)) +
          ("?" exprToString c))
         + ":")
        + (exprToString d);;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(15,15)-(15,51)
"sin(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,17)-(16,53)
"cos(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,7)-(18,70)
"((" ^ (exprToString x ^ ("*" ^ (exprToString y ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,20)-(19,63)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

(21,7)-(24,27)
"(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(24,29)
(11,22)-(24,27)
(12,3)-(24,27)
(13,14)-(13,17)
(15,15)-(15,45)
(15,15)-(15,51)
(15,16)-(15,25)
(15,28)-(15,44)
(15,29)-(15,41)
(15,48)-(15,51)
(16,17)-(16,47)
(16,17)-(16,53)
(16,18)-(16,27)
(16,50)-(16,53)
(18,7)-(18,70)
(18,8)-(18,41)
(18,9)-(18,34)
(18,10)-(18,14)
(18,37)-(18,40)
(18,64)-(18,70)
(19,20)-(19,44)
(19,20)-(19,63)
(19,40)-(19,43)
(21,7)-(23,16)
(21,7)-(24,27)
(21,10)-(21,42)
(21,11)-(21,35)
(21,12)-(21,15)
(21,38)-(21,41)
(22,11)-(22,31)
(22,12)-(22,15)
(23,12)-(23,15)
*)
