
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a,b,c) ->
      if c < 0
      then ((log (x *. 100)) ** (sin (x *. 100))) -. 1.0
      else (-1.0) *. (((log (x *. 100)) ** (sin (x *. 100))) -. 1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100.0)) **
           (sin ((eval (b, x, y)) *. 100.0)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100.0)) **
              (sin ((eval (a, x, y)) *. 100.0)))
             -. 1.0);;

*)

(* changed spans
(33,9)-(33,10)
eval
VarG

(33,9)-(33,10)
eval (c , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(33,9)-(33,10)
(c , x , y)
TupleG (fromList [VarG])

(33,13)-(33,14)
x
VarG

(34,11)-(34,56)
y
VarG

(34,11)-(34,56)
0.0
LitG

(34,18)-(34,19)
eval
VarG

(34,18)-(34,19)
a
VarG

(34,18)-(34,19)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,18)-(34,19)
(a , x , y)
TupleG (fromList [VarG])

(34,23)-(34,26)
y
VarG

(34,32)-(34,48)
100.0
LitG

(34,38)-(34,39)
eval
VarG

(34,38)-(34,39)
b
VarG

(34,38)-(34,39)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,38)-(34,39)
(b , x , y)
TupleG (fromList [VarG])

(34,43)-(34,46)
y
VarG

(34,53)-(34,56)
100.0
LitG

(35,29)-(35,30)
eval
VarG

(35,29)-(35,30)
b
VarG

(35,29)-(35,30)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,29)-(35,30)
(b , x , y)
TupleG (fromList [VarG])

(35,34)-(35,37)
y
VarG

(35,43)-(35,59)
100.0
LitG

(35,49)-(35,50)
eval
VarG

(35,49)-(35,50)
a
VarG

(35,49)-(35,50)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,49)-(35,50)
(a , x , y)
TupleG (fromList [VarG])

(35,54)-(35,57)
y
VarG

(35,64)-(35,67)
100.0
LitG

*)
