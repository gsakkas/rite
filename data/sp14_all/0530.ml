
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
      if c < 0.0
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
(33,10)-(33,11)
eval (c , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,19)-(34,20)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,24)-(34,27)
100.0
LitG

(34,39)-(34,40)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,44)-(34,47)
100.0
LitG

(35,30)-(35,31)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,35)-(35,38)
100.0
LitG

(35,50)-(35,51)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,55)-(35,58)
100.0
LitG

*)

(* type error slice
(16,3)-(35,69)
(33,10)-(33,11)
(33,10)-(33,17)
(33,14)-(33,17)
(34,18)-(34,28)
(34,24)-(34,27)
(34,38)-(34,48)
(34,44)-(34,47)
(35,29)-(35,39)
(35,35)-(35,38)
(35,49)-(35,59)
(35,55)-(35,58)
*)
