
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> exprToString e "*" exprToString e
  | Volume (l,w,h) ->
      "(" ^
        ((exprToString e) ^
           ("*(" ^ ((exprToString e) ^ (")*" ^ ((exprToString e) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Volume (l,w,h) ->
      "(" ^
        ((exprToString e) ^
           ("*(" ^ ((exprToString e) ^ (")*" ^ ((exprToString e) ^ ")")))));;

*)

(* changed spans
(28,17)-(28,29)
(^)
VarG

(28,17)-(28,29)
exprToString e
AppG (fromList [VarG])

(28,17)-(28,50)
exprToString e ^ ("*" ^ exprToString e)
AppG (fromList [AppG (fromList [EmptyG])])

(28,32)-(28,35)
(^)
VarG

(28,32)-(28,35)
"*" ^ exprToString e
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(28,36)-(28,48)
exprToString e
AppG (fromList [VarG])

*)
