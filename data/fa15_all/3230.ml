
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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) / 2
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;

*)

(* changed spans
(36,25)-(36,71)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(37,23)-(37,41)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(37,24)-(37,36)
eval
VarG

(37,37)-(37,40)
(ex1 , x , y)
TupleG (fromList [VarG])

(37,42)-(37,43)
2.0
LitG

(37,45)-(37,48)
x
VarG

(37,51)-(37,69)
y
VarG

(37,52)-(37,64)
eval
VarG

(37,65)-(37,68)
(ex2 , x , y)
TupleG (fromList [VarG])

(40,9)-(40,27)
y
VarG

(40,9)-(40,27)
eval (ex1 , x , y) < eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,9)-(40,27)
if eval (ex1 , x , y) < eval (ex2 , x , y)
then eval (ex3 , x , y)
else eval (ex4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,10)-(40,22)
eval
VarG

(40,23)-(40,26)
(ex1 , x , y)
TupleG (fromList [VarG])

(40,28)-(40,29)
x
VarG

(42,15)-(42,33)
y
VarG

(42,16)-(42,28)
eval
VarG

(42,29)-(42,32)
(ex2 , x , y)
TupleG (fromList [VarG])

(42,34)-(42,35)
x
VarG

(44,21)-(44,39)
y
VarG

(44,22)-(44,34)
eval
VarG

(44,35)-(44,38)
(ex3 , x , y)
TupleG (fromList [VarG])

(44,40)-(44,41)
x
VarG

(44,50)-(44,68)
y
VarG

(44,51)-(44,63)
eval
VarG

(44,64)-(44,67)
(ex4 , x , y)
TupleG (fromList [VarG])

(44,69)-(44,70)
x
VarG

(44,71)-(44,74)
x
VarG

*)
