
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Arc of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Tan a -> "tan(pi*" ^ ((exprToString a) ^ ")")
  | Arc (a,b,c) -> "sin(pi*" ^ ((exprToString (a (b, c))) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sin_Avg of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Tan a -> "tan(pi*" ^ ((exprToString a) ^ ")")
  | Sin_Avg (a,b,c) ->
      "sin(pi*(" ^
        ((exprToString a) ^
           ("+" ^ ((exprToString b) ^ ((exprToString c) ^ ")/3)"))));;

*)

(* changed spans
(14,2)-(30,64)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exprToString a ^ ")")
| Cosine a -> "cos(pi*" ^ (exprToString a ^ ")")
| Average (a , b) -> "((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
| Times (a , b) -> exprToString a ^ ("*" ^ exprToString b)
| Thresh (a , b , c , d) -> "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
| _ -> "_"
| Tan a -> "tan(pi*" ^ (exprToString a ^ ")")
| Sin_Avg (a , b , c) -> "sin(pi*(" ^ (exprToString a ^ ("+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(30,19)-(30,28)
"sin(pi*("
LitG

(30,49)-(30,55)
"+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(30,50)-(30,51)
(^)
VarG

(30,50)-(30,51)
exprToString
VarG

(30,50)-(30,51)
(^)
VarG

(30,50)-(30,51)
exprToString b ^ (exprToString c ^ ")/3)")
AppG (fromList [AppG (fromList [EmptyG])])

(30,50)-(30,51)
exprToString b
AppG (fromList [VarG])

(30,50)-(30,51)
"+"
LitG

(30,53)-(30,54)
exprToString
VarG

(30,53)-(30,54)
(^)
VarG

(30,53)-(30,54)
exprToString c ^ ")/3)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(30,53)-(30,54)
exprToString c
AppG (fromList [VarG])

(30,60)-(30,63)
")/3)"
LitG

*)
