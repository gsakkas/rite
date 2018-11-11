
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
  | Arc (a,b,c) -> "sin(pi*" ^ ((exprToString a (b, c)) ^ ")");;


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
(14,2)-(30,62)
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
CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG])]

(30,19)-(30,28)
"sin(pi*("
LitG

(30,32)-(30,55)
exprToString a
AppG [VarG]

(30,48)-(30,54)
"+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))
AppG [LitG,AppG [EmptyG,EmptyG]]

(30,49)-(30,50)
(^)
VarG

(30,49)-(30,50)
exprToString
VarG

(30,49)-(30,50)
(^)
VarG

(30,49)-(30,50)
exprToString b ^ (exprToString c ^ ")/3)")
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

(30,49)-(30,50)
exprToString b
AppG [VarG]

(30,49)-(30,50)
"+"
LitG

(30,52)-(30,53)
exprToString
VarG

(30,52)-(30,53)
(^)
VarG

(30,52)-(30,53)
exprToString c ^ ")/3)"
AppG [AppG [EmptyG],LitG]

(30,52)-(30,53)
exprToString c
AppG [VarG]

(30,58)-(30,61)
")/3)"
LitG

*)
