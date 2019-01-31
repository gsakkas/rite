
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
  | Sine e1 -> sin (pi *. (exprToString e1))
  | Cosine e1 -> cos (pi * (exprToString e1))
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
(34,27)-(34,39)
eval
VarG

(34,40)-(34,42)
(e1 , x , y)
TupleG (fromList [VarG])

(35,17)-(35,45)
x
VarG

(35,17)-(35,45)
y
VarG

(35,21)-(35,45)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(35,28)-(35,40)
eval
VarG

(35,41)-(35,43)
(e1 , x , y)
TupleG (fromList [VarG])

(37,14)-(37,31)
y
VarG

(37,14)-(37,31)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(37,14)-(37,31)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(37,15)-(37,27)
eval
VarG

(37,28)-(37,30)
(e1 , x , y)
TupleG (fromList [VarG])

(37,32)-(37,33)
x
VarG

(37,42)-(37,59)
y
VarG

(37,43)-(37,55)
eval
VarG

(37,56)-(37,58)
(e2 , x , y)
TupleG (fromList [VarG])

(37,60)-(37,61)
x
VarG

(38,21)-(38,38)
y
VarG

(38,21)-(38,38)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(38,21)-(38,38)
2.0
LitG

(38,22)-(38,34)
eval
VarG

(38,35)-(38,37)
(e1 , x , y)
TupleG (fromList [VarG])

(38,39)-(38,40)
x
VarG

(38,42)-(38,45)
x
VarG

(38,48)-(38,65)
y
VarG

(38,49)-(38,61)
eval
VarG

(38,62)-(38,64)
(e2 , x , y)
TupleG (fromList [VarG])

(41,9)-(41,26)
y
VarG

(41,9)-(41,26)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(41,9)-(41,26)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(41,10)-(41,22)
eval
VarG

(41,23)-(41,25)
(e1 , x , y)
TupleG (fromList [VarG])

(41,27)-(41,28)
x
VarG

(43,15)-(43,32)
y
VarG

(43,16)-(43,28)
eval
VarG

(43,29)-(43,31)
(e2 , x , y)
TupleG (fromList [VarG])

(43,33)-(43,34)
x
VarG

(45,21)-(45,38)
y
VarG

(45,22)-(45,34)
eval
VarG

(45,35)-(45,37)
(e3 , x , y)
TupleG (fromList [VarG])

(45,39)-(45,40)
x
VarG

(45,49)-(45,66)
y
VarG

(45,50)-(45,62)
eval
VarG

(45,63)-(45,65)
(e4 , x , y)
TupleG (fromList [VarG])

(45,67)-(45,68)
x
VarG

(45,69)-(45,72)
x
VarG

*)
