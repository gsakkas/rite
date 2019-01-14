
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SquareAv (a,b) -> ((a *. a) +. (b *. b)) / 2.0
  | MultHalf (a,b,c) -> ((a *. b) *. c) / 2.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SquareAv (a,b) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (b, x, y))))
        /. 2.0
  | MultHalf (a,b,c) ->
      (((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))) /. 2.0;;

*)

(* changed spans
(27,22)-(27,50)
((eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (b , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(27,24)-(27,25)
eval
VarG

(27,24)-(27,25)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,24)-(27,25)
(a , x , y)
TupleG (fromList [VarG])

(27,29)-(27,30)
x
VarG

(27,29)-(27,30)
y
VarG

(27,29)-(27,30)
eval
VarG

(27,29)-(27,30)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,29)-(27,30)
(a , x , y)
TupleG (fromList [VarG])

(27,35)-(27,43)
x
VarG

(27,35)-(27,43)
y
VarG

(27,36)-(27,37)
eval
VarG

(27,36)-(27,37)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,36)-(27,37)
(b , x , y)
TupleG (fromList [VarG])

(27,41)-(27,42)
x
VarG

(27,41)-(27,42)
y
VarG

(27,41)-(27,42)
eval
VarG

(27,41)-(27,42)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,41)-(27,42)
(b , x , y)
TupleG (fromList [VarG])

(27,47)-(27,50)
x
VarG

(27,47)-(27,50)
y
VarG

(28,24)-(28,45)
((eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,26)-(28,27)
eval
VarG

(28,26)-(28,27)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,26)-(28,27)
(a , x , y)
TupleG (fromList [VarG])

(28,31)-(28,32)
x
VarG

(28,31)-(28,32)
y
VarG

(28,31)-(28,32)
eval
VarG

(28,31)-(28,32)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,31)-(28,32)
(b , x , y)
TupleG (fromList [VarG])

(28,37)-(28,38)
x
VarG

(28,37)-(28,38)
y
VarG

(28,37)-(28,38)
eval
VarG

(28,37)-(28,38)
eval (c , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,37)-(28,38)
(c , x , y)
TupleG (fromList [VarG])

(28,42)-(28,45)
x
VarG

(28,42)-(28,45)
y
VarG

*)
