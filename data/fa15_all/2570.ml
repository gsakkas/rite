
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.0
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | Square ex -> ((eval ex), x, y) *. (eval (ex, x, y))
  | Mix (ex1,ex2,ex3) ->
      ((eval ((Times (ex1, ex2)), x, y)) +. (eval ((Times (ex2, ex3)), x, y)))
        /. 2.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.0
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | Square ex -> (eval (ex, x, y)) *. (eval (ex, x, y))
  | Mix (ex1,ex2,ex3) ->
      ((eval ((Times (ex1, ex2)), x, y)) +. (eval ((Times (ex2, ex3)), x, y)))
        /. 2.0;;

*)

(* changed spans
(27,18)-(27,35)
eval (ex , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(16,3)-(30,15)
(19,27)-(19,44)
(19,28)-(19,32)
(19,33)-(19,43)
(27,18)-(27,35)
(27,18)-(27,56)
(27,19)-(27,28)
(27,20)-(27,24)
(27,25)-(27,27)
*)
