
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) mod (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      let comb = (eval (e1, x, y)) +. (eval (e2, x, y)) in
      mod_float comb (eval (e3, x, y));;

*)

(* changed spans
(29,9)-(29,23)
(29,9)-(29,43)
(29,9)-(29,66)
(29,52)-(29,66)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(29,9)-(29,13)
(29,9)-(29,23)
(29,9)-(29,43)
(29,9)-(29,43)
(29,9)-(29,66)
(29,29)-(29,33)
(29,29)-(29,43)
(29,52)-(29,56)
(29,52)-(29,66)
*)
