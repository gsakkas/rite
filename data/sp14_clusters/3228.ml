
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
  | Average (ex1,ex2) ->
      ((exprToString (ex1, x, y)) +. (exprToString (ex2, x, y))) /. 2
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
(37,8)-(37,20)
eval
VarG

(37,38)-(37,50)
eval
VarG

(38,23)-(38,41)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(38,24)-(38,36)
eval
VarG

(38,37)-(38,40)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(38,42)-(38,43)
2.0
LitG

(38,45)-(38,48)
x
VarG

(38,51)-(38,69)
y
VarG

(38,52)-(38,64)
eval
VarG

(38,65)-(38,68)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(41,9)-(41,27)
y
VarG

(41,9)-(41,27)
eval (ex1 , x , y) < eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(41,9)-(41,27)
if eval (ex1 , x , y) < eval (ex2 , x , y)
then eval (ex3 , x , y)
else eval (ex4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

(41,10)-(41,22)
eval
VarG

(41,23)-(41,26)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(41,28)-(41,29)
x
VarG

(43,15)-(43,33)
y
VarG

(43,16)-(43,28)
eval
VarG

(43,29)-(43,32)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(43,34)-(43,35)
x
VarG

(45,21)-(45,39)
y
VarG

(45,22)-(45,34)
eval
VarG

(45,35)-(45,38)
(ex3 , x , y)
TupleG [VarG,VarG,VarG]

(45,40)-(45,41)
x
VarG

(45,50)-(45,68)
y
VarG

(45,51)-(45,63)
eval
VarG

(45,64)-(45,67)
(ex4 , x , y)
TupleG [VarG,VarG,VarG]

(45,69)-(45,70)
x
VarG

(45,71)-(45,74)
x
VarG

*)
