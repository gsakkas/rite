
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

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
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      eval
        ((eval (a, (sin (pi * x)), (sin (pi * y)))),
          (eval (b, (sin (pi * x)), (sin (pi * y)))),
          (eval (c, (sin (pi * x)), (sin (pi * y)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

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
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +.
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         +. (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;

*)

(* changed spans
(30,8)-(32,53)
((eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))) /. 3.0
BopG (BopG EmptyG EmptyG) LitG

(30,9)-(30,51)
(eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(30,9)-(30,51)
eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))
BopG (AppG [EmptyG]) (AppG [EmptyG])

(30,24)-(30,32)
pi *. x
BopG VarG VarG

(30,40)-(30,48)
pi *. y
BopG VarG VarG

(31,25)-(31,33)
pi *. x
BopG VarG VarG

(31,41)-(31,49)
pi *. y
BopG VarG VarG

(32,25)-(32,33)
pi *. x
BopG VarG VarG

(32,41)-(32,49)
pi *. y
BopG VarG VarG

*)
