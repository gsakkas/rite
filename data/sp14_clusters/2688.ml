
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval a) * (eval a)) * (eval a);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval (a, x, y)) *. (eval (a, x, y))) *. (eval (a, x, y));;

*)

(* changed spans
(27,14)-(27,35)
(eval (a , x , y) *. eval (a , x , y)) *. eval (a , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(27,15)-(27,23)
eval (a , x , y) *. eval (a , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(27,21)-(27,22)
(a , x , y)
TupleG [VarG,VarG,VarG]

(27,26)-(27,34)
x
VarG

(27,26)-(27,34)
y
VarG

(27,32)-(27,33)
(a , x , y)
TupleG [VarG,VarG,VarG]

(27,38)-(27,46)
x
VarG

(27,38)-(27,46)
y
VarG

(27,44)-(27,45)
(a , x , y)
TupleG [VarG,VarG,VarG]

*)
