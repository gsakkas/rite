
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
(27,17)-(27,34)
(27,24)-(27,26)
*)

(* type error slice
(16,2)-(30,14)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(27,17)-(27,34)
(27,17)-(27,55)
(27,18)-(27,27)
(27,19)-(27,23)
(27,24)-(27,26)
*)
