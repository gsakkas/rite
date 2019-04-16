
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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" + (exprToString d ")" "/2)")))
  | Times (e,f) -> exprToString e "*" exprToString f
  | Thresh (g,h,i,j) ->
      "(" exprToString g "<" exprToString h "?" exprToString i ":"
        exprToString j ")";;


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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ ((exprToString d) ^ ")/2)")))
  | Times (e,f) -> (exprToString e) ^ ("*" ^ (exprToString f))
  | Thresh (g,h,i,j) ->
      "(" ^
        ((exprToString g) ^
           ("<" ^
              ((exprToString h) ^
                 ("?" ^ ((exprToString i) ^ (":" ^ ((exprToString j) ^ ")")))))));;

*)

(* changed spans
(18,34)-(18,68)
"+" ^ (exprToString d ^ ")/2)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,20)-(19,53)
exprToString e ^ ("*" ^ exprToString f)
AppG (fromList [AppG (fromList [EmptyG])])

(21,7)-(22,27)
"(" ^ (exprToString g ^ ("<" ^ (exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,24)-(15,48)
(15,25)-(15,41)
(15,26)-(15,38)
(15,42)-(15,43)
(18,14)-(18,69)
(18,32)-(18,33)
(18,34)-(18,68)
(18,35)-(18,38)
(18,41)-(18,67)
(18,42)-(18,54)
(19,20)-(19,32)
(19,20)-(19,53)
(21,7)-(21,10)
(21,7)-(22,27)
*)
