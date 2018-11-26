
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
(15,14)-(15,44)
"sin(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(15,15)-(15,24)
(^)
VarG

(15,27)-(15,43)
(^)
VarG

(15,27)-(15,43)
exprToString x ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,16)-(16,46)
"cos(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,17)-(16,26)
(^)
VarG

(16,29)-(16,45)
(^)
VarG

(16,29)-(16,45)
exprToString x ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,8)-(18,33)
"((" ^ (exprToString x ^ ("*" ^ (exprToString y ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,9)-(18,13)
(^)
VarG

(18,16)-(18,32)
(^)
VarG

(18,16)-(18,32)
exprToString x ^ ("*" ^ (exprToString y ^ ")/2)"))
AppG (fromList [AppG (fromList [EmptyG])])

(18,36)-(18,39)
(^)
VarG

(18,36)-(18,39)
"*" ^ (exprToString y ^ ")/2)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,43)-(18,59)
(^)
VarG

(18,43)-(18,59)
exprToString y ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,19)-(19,43)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

(19,20)-(19,36)
(^)
VarG

(19,39)-(19,42)
(^)
VarG

(19,39)-(19,42)
"*" ^ exprToString y
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,10)-(21,34)
"(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,11)-(21,14)
(^)
VarG

(21,17)-(21,33)
(^)
VarG

(21,17)-(21,33)
exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d)))))
AppG (fromList [AppG (fromList [EmptyG])])

(21,37)-(21,40)
(^)
VarG

(21,37)-(21,40)
"<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,44)-(21,60)
(^)
VarG

(21,44)-(21,60)
exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d)))
AppG (fromList [AppG (fromList [EmptyG])])

(22,11)-(22,14)
(^)
VarG

(22,15)-(22,27)
(^)
VarG

(22,15)-(22,27)
exprToString c ^ (":" ^ exprToString d)
AppG (fromList [AppG (fromList [EmptyG])])

(22,15)-(22,27)
exprToString c
AppG (fromList [VarG])

(23,11)-(23,14)
(^)
VarG

(23,11)-(23,14)
":" ^ exprToString d
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
