
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

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
      else eval (e4, x, y)
  | SquareCosine e' -> sqrt (abs_float (cos (pi *. (eval (e', x, y)))))
  | SquareSinCos (e1,e2,e3) ->
      sqrt
        (abs_float sin
           (((cos (pi *. (eval (e1, x, y)))) *.
               (cos (pi *. (eval (e2, x, y)))))
              *. (cos (pi *. (eval (e3, x, y))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

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
      else eval (e4, x, y)
  | SquareCosine e' -> sqrt (abs_float (cos (pi *. (eval (e', x, y)))))
  | SquareSinCos (e1,e2,e3) ->
      sqrt
        (abs_float
           (sin
              (((cos (pi *. (eval (e1, x, y)))) *.
                  (cos (pi *. (eval (e2, x, y)))))
                 *. (cos (pi *. (eval (e3, x, y)))))));;

*)

(* changed spans
(30,9)-(33,51)
abs_float (sin ((cos (pi *. eval (e1 , x , y)) *. cos (pi *. eval (e2 , x , y))) *. cos (pi *. eval (e3 , x , y))))
AppG [AppG [EmptyG]]

*)

(* type error slice
(30,9)-(33,51)
(30,10)-(30,19)
*)
