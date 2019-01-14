
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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
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

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(36,23)-(36,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(36,25)-(36,37)
eval
VarG

(36,38)-(36,40)
(e1 , x , y)
TupleG (fromList [VarG])

(36,45)-(36,62)
x
VarG

(36,45)-(36,62)
y
VarG

(36,46)-(36,58)
eval
VarG

(36,59)-(36,61)
(e2 , x , y)
TupleG (fromList [VarG])

(37,21)-(37,38)
y
VarG

(37,21)-(37,38)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(37,21)-(37,38)
2.0
LitG

(37,22)-(37,34)
eval
VarG

(37,35)-(37,37)
(e1 , x , y)
TupleG (fromList [VarG])

(37,39)-(37,40)
x
VarG

(37,42)-(37,45)
x
VarG

(37,48)-(37,65)
y
VarG

(37,49)-(37,61)
eval
VarG

(37,62)-(37,64)
(e2 , x , y)
TupleG (fromList [VarG])

(40,9)-(40,26)
y
VarG

(40,9)-(40,26)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,9)-(40,26)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,10)-(40,22)
eval
VarG

(40,23)-(40,25)
(e1 , x , y)
TupleG (fromList [VarG])

(40,27)-(40,28)
x
VarG

(42,15)-(42,32)
y
VarG

(42,16)-(42,28)
eval
VarG

(42,29)-(42,31)
(e2 , x , y)
TupleG (fromList [VarG])

(42,33)-(42,34)
x
VarG

(44,21)-(44,38)
y
VarG

(44,22)-(44,34)
eval
VarG

(44,35)-(44,37)
(e3 , x , y)
TupleG (fromList [VarG])

(44,39)-(44,40)
x
VarG

(44,49)-(44,66)
y
VarG

(44,50)-(44,62)
eval
VarG

(44,63)-(44,65)
(e4 , x , y)
TupleG (fromList [VarG])

(44,67)-(44,68)
x
VarG

(44,69)-(44,72)
x
VarG

*)
