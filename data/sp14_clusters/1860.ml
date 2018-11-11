
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
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi * (eval (e', x, y)))
  | Cosine e' -> cos (pi * (exprToString e'))
  | Average (e1,e2) -> ((exprToString e1) + (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) * (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      if (exprToString e1) < (exprToString e2)
      then exprToString e3
      else exprToString e4;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(34,19)-(34,43)
pi *. eval (e' , x , y)
BopG VarG (AppG [EmptyG])

(35,21)-(35,45)
pi *. eval (e' , x , y)
BopG VarG (AppG [EmptyG])

(35,28)-(35,40)
eval
VarG

(35,41)-(35,43)
(e' , x , y)
TupleG [VarG,VarG,VarG]

(36,23)-(36,62)
x
VarG

(36,24)-(36,41)
y
VarG

(36,24)-(36,41)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(36,24)-(36,41)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(36,25)-(36,37)
eval
VarG

(36,38)-(36,40)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(36,44)-(36,61)
x
VarG

(36,44)-(36,61)
y
VarG

(36,45)-(36,57)
eval
VarG

(36,58)-(36,60)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(37,21)-(37,38)
y
VarG

(37,21)-(37,38)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(37,21)-(37,38)
2.0
LitG

(37,21)-(37,58)
x
VarG

(37,22)-(37,34)
eval
VarG

(37,35)-(37,37)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(37,41)-(37,58)
x
VarG

(37,41)-(37,58)
y
VarG

(37,42)-(37,54)
eval
VarG

(37,55)-(37,57)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(39,6)-(41,26)
x
VarG

(39,6)-(41,26)
y
VarG

(39,10)-(39,22)
eval
VarG

(39,23)-(39,25)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(39,29)-(39,46)
x
VarG

(39,29)-(39,46)
y
VarG

(39,30)-(39,42)
eval
VarG

(39,43)-(39,45)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(40,11)-(40,23)
eval
VarG

(40,11)-(40,26)
x
VarG

(40,11)-(40,26)
y
VarG

(40,24)-(40,26)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(41,11)-(41,23)
eval
VarG

(41,11)-(41,26)
x
VarG

(41,11)-(41,26)
y
VarG

(41,24)-(41,26)
(e4 , x , y)
TupleG [VarG,VarG,VarG]

*)
